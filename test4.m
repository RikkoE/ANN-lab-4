function [ output_args ] = test4( input_args )

    x1 = vm([0 0 1 0 1 0 0 1]);
    x2 = vm([0 0 0 0 0 1 0 0]);
    x3 = vm([0 1 1 0 0 1 0 1]);
    
    x1d = vm([1 0 1 0 1 0 0 1]);
    x2d = vm([1 1 0 0 0 1 0 0]);
    x3d = vm([1 1 1 0 1 1 0 1]);

    W = x1' * x1 + x2' * x2 + x3' * x3;
        
    disp('Weight matrix');
    disp(W);
    
    disp('Original');
    disp(t0(x3));
    
    disp('Distorted');
    disp(t0(x3d));
    
    disp('First correction');
    new = sgn(W*x3d')';
    disp(t0(new));
    
    disp('Second correction');
    new = sgn(W*new')';
    disp(t0(new));
end

