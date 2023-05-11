clear; clc;
format compact;

% 1 + ((floor n ∙ 40𝜋^2) mod 12)
puz1 = '1 + mod(floor(n * 40*pi.^2), 12)';
% 1 + ((floor n ∙ 50𝑒^2) mod 12)
puz2 = '1 + mod(floor(n * 50*exp(2)), 12)';
% 1 + ((floor 𝑛 ∙ 40𝑒^3) mod 12)
puz3 = '1 + mod(floor(n * 40*exp(3)), 12)';
% 1 + ((floor 𝑛 ∙ 50𝑒^3) mod 12)
puz4 = '1 + mod(floor(n * 50*exp(3)), 12)';
% 1 + ((floor 𝑛 ∙ 40𝑒^2) mod 12)
puz5 = '1 + mod(floor(n * 40*exp(2)), 12)';
% 1 + ((floor 𝑛 ∙ 60𝑒^3) mod 12)
puz6 = '1 + mod(floor(n * 60*exp(3)), 12)';

[puzzle_1, puzzle_1_tri] = create_puzzle(puz1);
[puzzle_2, puzzle_2_tri] = create_puzzle(puz2);
[puzzle_3, puzzle_3_tri] = create_puzzle(puz3);
[puzzle_4, puzzle_4_tri] = create_puzzle(puz4);
[puzzle_5, puzzle_5_tri] = create_puzzle(puz5);
[puzzle_6, puzzle_6_tri] = create_puzzle(puz6);

[solution_1, min_obstacle_1] = solve_puzzle(puzzle_1_tri);
[solution_2, min_obstacle_2] = solve_puzzle(puzzle_2_tri);
[solution_3, min_obstacle_3] = solve_puzzle(puzzle_3_tri);
[solution_4, min_obstacle_4] = solve_puzzle(puzzle_4_tri);
[solution_5, min_obstacle_5] = solve_puzzle(puzzle_5_tri);
[solution_6, min_obstacle_6] = solve_puzzle(puzzle_6_tri);

puzzle_1_table = table(puzzle_1_tri, solution_1, 'VariableNames', {'Puzzle 1', 'Solution'});
puzzle_2_table = table(puzzle_2_tri, solution_2, 'VariableNames', {'Puzzle 2', 'Solution'});
puzzle_3_table = table(puzzle_3_tri, solution_3, 'VariableNames', {'Puzzle 3', 'Solution'});
puzzle_4_p = table(puzzle_4_tri, 'VariableNames', {'Puzzle 4'});
puzzle_4_min = table(min_obstacle_4, 'VariableNames', {'Minimum Obsticle'});
puzzle_5_p = table(puzzle_5_tri, 'VariableNames', {'Puzzle 5'});
puzzle_5_min = table(min_obstacle_5, 'VariableNames', {'Minimum Obsticle'});
puzzle_6_table = table(puzzle_6_tri, solution_6, 'VariableNames', {'Puzzle 6', 'Solution'});

disp(puzzle_1_table);
disp(puzzle_2_table);
disp(puzzle_3_table);
disp(puzzle_4_p);
disp(puzzle_4_min);
disp(puzzle_5_p);
disp(puzzle_5_min);
disp(puzzle_6_table);