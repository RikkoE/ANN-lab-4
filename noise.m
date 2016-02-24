function [ output_args ] = noise( input_args )

pict;
% w = p1'*p1 + p2'*p2 + p3'*p3 + p4'*p4;

pattern1 = sgn(randn(1,1024));
pattern2 = sgn(randn(1,1024));
pattern3 = sgn(randn(1,1024));
pattern4 = sgn(randn(1,1024));
pattern5 = sgn(randn(1,1024));
pattern6 = sgn(randn(1,1024));



w = pattern1'*pattern1 + pattern2'*pattern2 + ...
    pattern3'*pattern3 + pattern4'*pattern4 + ...
    pattern5'*pattern5 + pattern6'*pattern6;

iter = 1024;
input = pattern5;

for i = 1:iter
    pdist = fliping(input,i);
    pdist = sgn(w*pdist')';
        
    if isequal(pdist, input) == 0
        disp('Failed at percentage: ');
        disp((i/iter)*100);
        disp('Number of nodes distorted');
        disp(i);
        break;
    end
end


end

