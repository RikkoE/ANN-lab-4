function [ output_args ] = noise( input_args )

pict;
w = p1'*p1 + p2'*p2 + p3'*p3;
iter = 1024;
input = p1;

for i = 1:iter
    pdist = fliping(input,i);
    pdist = sgn(w*pdist')';
    
    if isequal(pdist, input) == 0
%         disp('not equal at iteration: ');
%         disp(iter);
        disp((i/iter)*100);
    end
end



end

