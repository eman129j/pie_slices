function min_obstacle = find_min_obstacle(puzzle)

% Sort the puzzle matrix along each row
sorted_puzzle = sort(puzzle, 2);

% Find the minimum number of times the same row appears consecutively
consec_count = 1;
for i = 1:size(sorted_puzzle)
    consec_count = 1;
    for j = 1:size(sorted_puzzle, 1)
        if i == j
            continue;
        elseif isequal(sorted_puzzle(i,:), sorted_puzzle(j,:))
            consec_count = consec_count + 1;
        else
            continue;
        end
    end
    mat(i, 1) = consec_count;
end

% Calculate the minimum obstacle
n = 1;
for i = 1:size(mat)
    if mat(i, 1) == 2
        min_obstacle(n, :) = puzzle(i, :);
        n = n + 1;
    else
        continue;
    end
end
return;
end
