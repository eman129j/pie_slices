function [flipped_slice] = flipSlice(slice)
%FLIPSLICE Summary of this function goes here
%   Detailed explanation goes here
    flipped_slice = [slice(3), slice(2), slice(1)];
end

