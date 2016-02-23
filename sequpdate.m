function [ output_args ] = sequpdate( input_args )
%SEQUPDATE Summary of this function goes here
%   Detailed explanation goes here
pict;
w = p1'*p1 + p2'*p2 + p3'*p3;

iter = 20000;
subiter = 0;
unit = randi([1,1024], iter, 1);
disp(unit);

%     vis(p22);
% vis(sgn(w * p11')');

% disp(p11');

for i = 1:iter
    pattern = sgn(w(unit(i),:) * p22');
    p22(1,unit(i)) = pattern;
    subiter = subiter + 1;
    if subiter == 100
        imagesc(reshape(p22,32,32));
        subiter = 0;
    end
end

end

