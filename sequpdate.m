function [ output_args ] = sequpdate( input_args )
%SEQUPDATE Summary of this function goes here
%   Detailed explanation goes here
pict;
w = p1'*p1 + p2'*p2 + p3'*p3;

% w = randn(1024, 1024);
% w = 0.5*(w*w');

iter = 10000;
subiter = 0;
sample = 50;
unit = randi([1,1024], iter, 1);

pat = p2;

% disp('P11 energy before fix');
% disp(-(sum(sum(w*p11'*p11))));
% 
% p11 = sgn(w*p11')';
% 
% disp('P11 energy after fix');
% disp(-(sum(sum(w*p11'*p11))));

energyvect = ones(sample,1);

for i = 1:iter
    pattern = sgn(w(unit(i),:) * pat');
    pat(1,unit(i)) = pattern;
    subiter = subiter + 1;
    if subiter == (iter/sample)
        energyvect(i/(iter/sample), 1) = -(sum(sum(w*pat'*pat)));
        subiter = 0;
    end
end


x = linspace(0, sample, sample);

plot(x, energyvect);

% vis(pat);


% 
% disp('P22 energy after fix');
% disp(-(sum(sum(w*p22'*p22))));

end

