%% Single simulation

function [player_choice, host_choice, car, remaining_door] = MONTY_HALL_SIM()
    %rng('shuffle')
    doors = [1, 2, 3];
    % Let first two doors be the goats and the final door be the car, this
    % ramdonly choses which doors will be the goats and which will be the car
    behind_the_doors = randperm(3);
    goats = behind_the_doors(1:2);
    car = behind_the_doors(3);
    % Pick the player and host's choices as one of the doors and remove that
    % door from the list of doors, leaving only the remaining door in the list
    player_choice = randi(3, 1, 1);
    doors(player_choice) = 0;
    host_choice = randi(3, 1, 1);
    % Re-choose the host choice if it's the same as the player or the car doors
    while(host_choice == player_choice || host_choice == car)
        host_choice = randi(3, 1, 1);
    end
    doors(host_choice) = 0;
    for i = 1:3
        if(doors(i) ~= 0)
            remaining_door = doors(i);
        end
    end
end