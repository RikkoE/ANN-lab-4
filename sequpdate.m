function [ output_args ] = sequpdate( input_args )
%SEQUPDATE Summary of this function goes here
%   Detailed explanation goes here
    pict;
    disp(p1);
    
    w = p1'*p1 + p2'*p2 + p3'*p3;
    
%     vis(p22);
    vis(sgn(w * p11')');
end

