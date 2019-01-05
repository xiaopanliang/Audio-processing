function Y = gmm_eval(X, model)
%gmm_eval GMM probability density function (pdf).
%   Y = gmm_eval(X,model) returns the pdf of the GMM distribution, evaluated for the obsvns in X.
%   X is a two dimensional matrix [#Frames x #Dimensions]
%   model is the GMM estimated by gmm_train
% 

N = size(X, 1);
K = length(model.weight);

for k = 1:K
    S(:,:,k) = diag(model.sigma(:,k));
end

% Preallocate likelihood matrix for each component density
LL = ones(N, K);

for k = 1:K
    %disp(S(:,:,k));
    % Compute the likelihood of the observations w.r.t. the kth component density 
    % Compute the likelihood of xi for each k using mvnpdf()
    %p_xi_given_k = [mvnpdf(xi,Mu(:,1),Sigma(:,:,1));mvnpdf(xi,Mu(:,2),Sigma(:,:,2))] ; % [K  x  1]
    LL(:,k) = mvnpdf(X,model.mu(:,k)',S(:,:,k)) ;
end

% Now LL(i,k) is the likelihood of xi w.r.t kth component density of the GMM
% The likelihood of xi w.r.t GMM = sum_k=1..K LL(i,k)
total = sum(LL,2) ; % [N x 1]. total(i) = likelihood of xi

% Take the log of total(i), i=1...,N and find the mean of the logs
Y = sum(log(total))/N ; % average log-likelihood of data matrix X
