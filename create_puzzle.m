function [puzzle_values, puzzle_values_tri] = create_puzzle(equ)
%CREATE_PUZZLE is a function used to create the puzzle
puzzle_values = [];
i = 1; 
j = 1;
equa = str2func(['@(n)' equ]);
    while(size(puzzle_values, 2) < 36)
        value = equa(i);
        if(sum(puzzle_values == value) < 3)
            puzzle_values(j) = value;
            j = j + 1;
        end
            i = i + 1;
    end
    puzzle_values_tri = make_triangle(puzzle_values);
end