% Monty Hall Problem using Monte Carlo simulation
% by James Dalton 6/13/18

%% House-keeping
clear all, clc

%% Inital set-up
%sims_per_run = 1000;
total_runs = 100; % Program will run up to total_runs*10 

%% Simulation

probability_cd = zeros(1, total_runs); % Change door
probability_kd = zeros(1, total_runs); % Keep door

t = 1;
for i = 1:10:total_runs*10
    wins_cd = 0; wins_kd = 0;
    for j = 1:i
        [player_choice, host_choice, car, remaining_door] = MONTY_HALL_SIM();
        if (remaining_door == car)
            wins_cd = wins_cd + 1;
        else
            wins_kd = wins_kd + 1;
        end
    end
    prob_change = wins_cd/(i);
    probability_cd(t) = prob_change;
    prob_keep = wins_kd/(i);
    probability_kd(t) = prob_keep;
    t = t + 1;
end

figure(1), hold on
plot(1:10:total_runs*10, probability_cd, 'bo')
plot([0, total_runs*10], [2/3, 2/3], '--b')
plot(1:10:total_runs*10, probability_kd, 'ro')
plot([0, total_runs*10], [1/3, 1/3], '--r')
legend('Change door - experimental', 'Change door - theoretical', 'Keep door - experimental', 'Keep door - theoretical')
xlabel('# of Runs'), ylabel('Probability of Winning'), title(sprintf('Monty Hall Problem using Monte Carlo Method (N = %i)', total_runs)), grid on