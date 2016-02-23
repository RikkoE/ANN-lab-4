function [ output_args ] = test4( input_args )

    x1 = vm([0 0 1 0 1 0 0 1]);
    x2 = vm([0 0 0 0 0 1 0 0]);
    x3 = vm([0 1 1 0 0 1 0 1]);
    
    x1d = vm([1 0 1 0 1 0 0 1]);

    W = x1' * x1;
    %juan kan suga massiv pung%
    disp(W);
    new = t0(sgn(W*x1d')');
    disp(new);
end

