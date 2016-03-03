function [ output_args ] = bignoise( input_args )

nodes = 100;
nrofpatterns = 300;
intactpat = zeros(1,nrofpatterns);

flippedunits = 10;

patmat = sign(randn(nrofpatterns,nodes));
w = zeros(nodes,nodes);

destmat = zeros(1,300);

for i = 1:nrofpatterns
    destroyedpat = 0;
    w = w + patmat(i,:)'*patmat(i,:);
    
    % Takes away the self-connections
    w = w - diag(diag(w));
    
    for j = 1:i
        z = fliping(patmat(j,:), flippedunits);
        x = sgn(w*z')';
        
%         x = sgn(w*patmat(j,:)')';
        if isequal(patmat(j,:), x) == 0
            destroyedpat = destroyedpat + 1;
        else
            intactpat(:,i) = intactpat(:,i) + 1;
        end
    end
    
    destmat(:,i) = destroyedpat; 
end

title('Pattern reconstruction without self-connection: 10% distorted')
xlabel('Number of patterns stored')
ylabel('Number of destroyed patterns')

axis([0,300,0,300]);
ax1 = linspace(1,nrofpatterns, 300);
ax2 = linspace(1,nrofpatterns, 300);
plot(ax1, intactpat);

end



