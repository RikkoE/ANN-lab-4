function [ output_args ] = test4( input_args )

    x1 = vm([0 0 1 0 1 0 0 1]);
    x2 = vm([0 0 0 0 0 1 0 0]);
    x3 = vm([0 1 1 0 0 1 0 1]);
    
    iter = -1;
    
    x1d = vm([1 0 1 0 1 0 0 1]);
    x2d = vm([0 0 0 0 0 1 0 0]);
    x3d = vm([1 1 1 0 1 1 0 1]);

    W = x1' * x1 + x2' * x2 + x3' * x3;
    % W2 = x2' * x2;
    
    disp(W);
    new = sgn(W*x1d')';
    new2 = sgn(W*x2d')';
    new3 = sgn(W*x3d')';
    
    new4=sgn(W*new3')';
    
    %disp(t0(new));
    %disp(t0(new2));
    disp(t0(new3));
    disp(t0(new4));

    x2d = vm([1 1 0 0 0 1 0 0]);
    x3d = vm([1 1 1 0 1 1 0 1]);

    W = x1' * x1 + x2' * x2 + x3' * x3;
        
    fixpoint = x2;
    input = x2d;
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
    
    % The first correction
%     disp('First correction');
%     new = sgn(W*x3d')';
%     disp(t0(new));
%     
%     disp('Second correction');
%     new = sgn(W*new')';
%     disp(t0(new));
end

