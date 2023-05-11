function [solution, min_obstacle] = solve_puzzle(puzzle)
puzzle_stored = puzzle;
check_matrix = zeros(12, 3);
first_instance_matrix = zeros(12, 3);
face1_sum = sum(puzzle(:, 1));
face2_sum = sum(puzzle(:, 2));
face3_sum = sum(puzzle(:, 3));
time_max = 0;
forced_stop = false;
% Check if rotated puzzle produces a valid solution
while ~(face1_sum == 78 && face2_sum == 78 && face3_sum == 78)
    if time_max > 10
        forced_stop = true;
        break;
    end

    for face = 1:3
        for num = 1:12
            count = 0;
            for slice = 1:12
                if (puzzle(slice, face) == num)
                    count = count + 1;
                    if (count == 1)
                        first_instance_matrix(slice, face) = num;
                    elseif (count > 1)
                        check_matrix(slice, face) = num;
                    end
                end
            end
        end
    end
    % Check if any row in check_matrix has non-zero elements
    rows_to_rotate = [];
    rows_to_flip = [];
    for i = 1:size(check_matrix, 1)
        row = check_matrix(i, :);
        if (row(1) == 0 && any(row))
            rows_to_rotate(end+1) = i;
        elseif row(2) == 0 && any(row)
            rows_to_flip(end+1) = i;
        elseif any(row)
            rows_to_rotate(end+1) = i;
        end
    end

    % Rotate the specified rows
    for i = 1:length(rows_to_rotate)
        puzzle(rows_to_rotate(i), :) = rotateSlice(puzzle(rows_to_rotate(i), :));
    end

    % Flip the specified rows
    for i = 1:length(rows_to_flip)
        puzzle(rows_to_flip(i), :) = flipSlice(puzzle(rows_to_flip(i), :));
    end

    % Recalculate the sums and check_matrix
    face1_sum = sum(puzzle(:, 1));
    face2_sum = sum(puzzle(:, 2));
    face3_sum = sum(puzzle(:, 3));
    check_matrix = zeros(12, 3);
    first_instance_matrix = zeros(12, 3);
    rows_to_flip = [];
    rows_to_rotate = [];
    time_max = time_max + 1;
end
% Puzzle has a valid solution
if forced_stop == true  % need to find the min obstical if forced_stop = true
    solution = zeros(12, 3);
    min_obstacle = find_min_obstacle(puzzle_stored);
else
    solution = puzzle;
    min_obstacle = 0;
    return
end
end