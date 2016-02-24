function [ output_args ] = bignoise( input_args )

nodes = 100;
nrofpatterns = 300;

flippedunits = 10;

patmat = sign(randn(nrofpatterns,nodes));
w = zeros(nodes,nodes);

destmat = zeros(1,300);

for i = 1:nrofpatterns
    destroyedpat = 0;
    w = w + patmat(i,:)'*patmat(i,:);
    
    for j = 1:i
        z = fliping(patmat(j,:), flippedunits);
        x = sgn(w*z')';
        
%     	x = sgn(w*patmat(j,:)')';
        if isequal(patmat(j,:), x) == 0
            destroyedpat = destroyedpat + 1;
        end
    end
%     disp('Patterns in weight matrix');
%     disp(i);
%     disp('Patterns destroyed');
%     disp(destroyedpat);
    destmat(:,i) = destroyedpat;
end

axis([0,300,0,300]);
ax1 = linspace(1,nrofpatterns, 300);
ax2 = linspace(1,nrofpatterns, 300);
plot(ax1, destmat, ax1, ax2);

disp(destmat); 

end



