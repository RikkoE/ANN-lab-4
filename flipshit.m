function y=flipshit(x,n)
y=x;
[dummy,index]=sort(rand(1,size(x,2)));
y(index(1:n))=1;

