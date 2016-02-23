function [ output_args ] = biniteration( input_args )

x1 = vm([0 0 1 0 1 0 0 1]);
x2 = vm([0 0 0 0 0 1 0 0]);
x3 = vm([0 1 1 0 0 1 0 1]);

iter = -1;

W = x1' * x1 + x2' * x2 + x3' * x3;

last = 30;

solutionmatrix = [x1;x2;x3];

n = 8;
for i = 1:pow2(n)
    
    x = dec2bin((i-1),n) - '0';
    input = vm(x);

    while isequal(input, last) == 0
        last = input;
        input = sgn(W*input')';
        iter = iter + 1;
    end
    
    [rows, columns] = size(solutionmatrix);
    for j = 1:rows
        if isequal(solutionmatrix(j,:), input)
            break;
        end
        if j == rows
            solutionmatrix = [solutionmatrix;input];
        end
    end
end

disp('Attractors found');
disp(t0(solutionmatrix));

[rows, columns] = size(solutionmatrix);
disp('Number of attractors');
disp(rows);


end

