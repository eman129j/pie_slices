function [slice] = rotateSlice(slice)
%ROTATESLICE Summary of this function goes here
%   Detailed explanation goes here
    numOfRotations = 1;
    for (i = 1:numOfRotations)
        temp = slice(1, 1);
        slice(1, 1) = slice(1, 2);
        slice(1, 2) = slice(1, 3);
        slice(1, 3) = temp;
    end
end

% shift left
%   temp = slice(1, 1);
%   slice(1, 1) = slice(1, 2);
%   slice(1, 2) = slice(1, 3);
%   slice(1, 3) = temp

% shift right
%         temp = slice(1, 1);
%         slice(1, 1) = slice(1, 3);
%         slice(1, 3) = slice(1, 2);
%         slice(1, 2) = temp;