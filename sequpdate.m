function [ output_args ] = sequpdate( input_args )
%SEQUPDATE Summary of this function goes here
%   Detailed explanation goes here
pict;
% w = p1'*p1 + p2'*p2 + p3'*p3;

w = randn(1024, 1024);
w = 0.5*(w*w');

iter = 1024;
subiter = 0;
unit = randi([1,1024], iter, 1);

% disp('P11 energy before fix');
% disp(-(sum(sum(w*p11'*p11))));
% 
% p11 = sgn(w*p11')';
% 
% disp('P11 energy after fix');
% disp(-(sum(sum(w*p11'*p11))));

energyvect = ones(10,1);

for i = 1:iter
    pattern = sgn(w(unit(i),:) * p1');
    p1(1,unit(i)) = pattern;
%     subiter = subiter + 1;
%     if subiter == 10000
%         energyvect(i/10000, 1) = -(sum(sum(w*p1'*p1)));
%         subiter = 0;
%     end
end

vis(p1);

x = [1 2 3 4 5 6 7 8 9 10];

% plot(x, energyvect);

% 
% disp('P22 energy after fix');
% disp(-(sum(sum(w*p22'*p22))));

end

