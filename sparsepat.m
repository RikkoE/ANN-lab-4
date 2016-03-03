function [ output_args ] = sparsepat( input_args )

nodes = 100;
nrofpatterns = 300;
iter = 1;

patstored = zeros(1,nrofpatterns);

intactpat = -ones(1,iter);
bias = 2.5;
active = 5;


for k = 1:iter
    
    
    patmat = zeros(nrofpatterns, nodes);
    
    % y = flipshit(patmat(1,:),10);
    % imagesc(reshape(y,10,10));
    
    for i = 1:nrofpatterns
        patmat(i,:) = flipshit(patmat(i,:),active);
    end
    
    destmat = zeros(1,300);
    
    w = zeros(nodes,nodes);
    
    for i = 1:nrofpatterns
        destroyedpat = 0;
        w = w + (patmat(i,:) - (active/nodes))'*(patmat(i,:) - (active/nodes));
        
        % Takes away the self-connections
        w = w - diag(diag(w));
        
        for j = 1:i
            %         z = fliping(patmat(j,:), active);
            %         x = sgn(w*z')';
            
            %         x = sgn(w*patmat(j,:)')';
            x = 0.5 + 0.5 * sgn(w*patmat(j,:)' - bias)';
            if isequal(patmat(j,:), x) == 0
                destroyedpat = destroyedpat + 1;
                if intactpat(:,k) < 0
                    intactpat(:,k) = j-1;
                end
            else
                patstored(:,i) = patstored(:,i) + 1;
            end
        end
        
        destmat(:,i) = destroyedpat;
    end
    %
    % title('Pattern reconstruction without self-connection: 10% distorted')
    % xlabel('Number of patterns stored')
    % ylabel('Number of destroyed patterns')
    %
    
    bias = bias + 0.2;
    
end

axis([0,300,0,300]);
% ax1 = linspace(0, 10, iter);
ax2 = linspace(1,nrofpatterns, 300);
plot(ax2, patstored);

% axis([0,300,0,300]);
% ax1 = linspace(1,nrofpatterns, 300);
% ax2 = linspace(1,nrofpatterns, 300);
% plot(ax1, destmat, ax1, ax2);

end

