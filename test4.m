function [ output_args ] = test4( input_args )

    x1 = vm([0 0 1 0 1 0 0 1]);
    x2 = vm([0 0 0 0 0 1 0 0]);
    x3 = vm([0 1 1 0 0 1 0 1]);
    
    iter = -1;
    
    x1d = vm([1 0 1 0 1 0 0 1]);
    x2d = vm([1 1 0 0 0 1 0 0]);
    x3d = vm([1 1 1 0 1 1 0 1]);

    W = x1' * x1 + x2' * x2 + x3' * x3;
        
    fixpoint = x2;
    input = vm([1 1 1 1 1 1 1 1]);
    last = 30;
    
    disp('Weight matrix');
    disp(W);
    
    disp('Original');
    disp(t0(fixpoint));
    
    disp('Distorted');
    disp(t0(input));
    
    while isequal(input, last) == 0
        last = input;
        input = sgn(W*input')';
        iter = iter + 1;
    end
    
    disp('Iterations');
    disp(iter);
    
    disp('Finished pattern');
    disp(t0(input));
end

