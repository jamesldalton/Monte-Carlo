% This program will run a simulation of being dealt 5 random cards from 
% a deck of 52. What is the probability of being dealt all hearts?

% Create a deck array that contains numbers 1-52 in a random order
% Let's say that the hearts are cards 1 thru 13 and all numbers are not
% hearts
number_of_runs = 100000;
% Array of 100,000 zeros (used later)
allHearts = zeros(1,number_of_runs);

for n = 1:number_of_runs
    deck = randperm(52);
    % Draw the top 13 cards
    num_of_cards_drawn = 5;
    draw = deck(1:num_of_cards_drawn);
    % Count how many are hearts
    count  = 0;
    for i = 1:num_of_cards_drawn
        if draw(i) <= 13;
            count = count+1;
        end
    end
    % Check if all the cards drawn were hearts
    % A one represent that all the cards drawn in this run were hearts
    % A zero represents that NOT all the cards drawn were hearts
    if count == num_of_cards_drawn;
        allHearts(n) = 1;
    else
        allHearts(n) = 0;
    end
end
% Add up all the times a hand of all hearts was drawn
S = sum(allHearts);
% Calculate estimated probabilty of drawing these hearts
P = S/number_of_runs