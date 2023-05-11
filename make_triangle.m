function [triangle_puzzle] = make_triangle(input_list)
%MAKE_TRIANGLE Summary of this function goes here
%   Detailed explanation goes here
triangle_puzzle = zeros(12,3);

for i = 1:12
    for j = 1:3
        idx = (i-1)*3 + j;
        if idx <= length(input_list)
            triangle_puzzle(i,j) = input_list(idx);
        end
    end
end
end
