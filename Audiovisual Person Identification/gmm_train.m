function gmm_model = gmm_train(X,k,th,maxiter,Init)
%gmm_train estimate the GMM model from the data X.
%   gmm_model = gmm_train(X,k,th,maxiter,Init) returns GMM model
%   X is a two dimensional matrix [Frames,Dimensions]
%   k is the number of the mixtures

if nargin <= 1
    disp('gmm_train must have at least 2 inputs: X,k!')
    return
elseif nargin == 2
    th = 0.001; maxiter = 1000; Init = [];
elseif nargin == 3,
    maxiter = 1000; Init = [];
elseif nargin == 4,
    Init = [];
elseif nargin == 5
    if ~Verify_Init(X,k,Init)
        return
    end
elseif nargin > 5
    disp('gmm_train must have 2 to 5 inputs!');
    return
end


%%%% Initialization of Mu, Sigma and Weight%%%%
[n,d] = size(X);
% disp(n);
% disp(k);
if isempty(Init)
    [Mu,Sigma,Weight] = Init_EM(X,k);
else
    Mu = Init.Mu;
    Sigma = Init.Sigma;
    Weight = Init.Weight;
end

%%%% EM algorithm %%%%
Lo = 0;
for i = 1:maxiter    
    [E,Ln] = estep(X',Mu,Sigma,Weight);
%     fprintf(1,'%d: Delta LogLike = %6.4f (%6.4f - %6.4f)\n', i, Ln-Lo, Ln, Lo);
    if i > 1
        if Ln-Lo < th
            break;
        end
    end
    Lo = Ln;    
    [Mu Sigma Weight] = mstep(X',E);
end
% if i == maxiter
%     disp('Maximum number of iterations reached.')
%     disp('Convergence failed!');
% else
%     disp('Convergence succeeded!');
%     disp(sprintf('Number of iterations: %d',i-1));
% end

gmm_model.mu = Mu;
gmm_model.sigma = Sigma;
gmm_model.weight = Weight;

%%%% FUNCTION: Verify_Init %%%%
function result = Verify_Init(X,k,Init)
[n,d] = size(X);
if isstruct(Init)
    [Md,Mk] = size(Init.Mu);
    [Sd,Sk] = size(Init.Sigma);
    [Wd,Wk] = size(Init.Weight);
    if Mk~=k || Sk~=k || Wk~=k
        disp('k in Init.Mu(d,k), Init.Sigma(d,k) and Init.Weight(1,k) must all equal to the given k!')
        result = 0; return
    end
    if Wd~=1
        disp('Init.Weight(1,k) must be a row vector!')
        result = 0; return
    end
    if Md~=d || Sd~=d
        disp('d in Init.Mu(d,k) and Init.Sigma(d,k) must both equal to d in X(n,d)!')
        result = 0; return
    end
elseif ~isempty(Init)
    disp('Init must be [], or a structure containing Mu(d,k), Sigma(d,k) and Weight(1,k)!')
    result = 0; return
end
result = 1; return


%%%% FUNCTION: Init_EM(X,k) %%%%
function [Mu,Sigma,Weight] = Init_EM(X,k)
[n,d] = size(X);
[idx,centroid] = kmeans(X,k,'maxiter',8,'display','off','EmptyAction','singleton');
Mu = centroid'; % row i of centroid matrix is the mean of cluster i
Sigma = zeros(d,k);
Weight = zeros(1,k);
for j = 1:k
    idxc = find(idx==j);
    Sigma(:,j) = var(X(idxc,:));
    Weight(j) = length(idxc)/n;
end

function [gamma, LL] = estep(X, Mu, Sigma, Weight)
% Compute the E-step: Given data X and model parameters, compute the gamma
% probabilities and avg. log likelihood of X

[D, K] = size(Mu);
if ~isequal(size(Sigma),[D K]) || ~isequal(length(Weight), K)
    fprintf(1,'Desired dimensions = [%d %d]\n', [D K]);
    error('Mismatch in dimensions of Sigma ([%d %d])  or Weight (%d)', size(Sigma), K);
end
Weight = Weight(:); % [K x 1]

% X must be a DxN matrix, i.e,  X = [x1 x2 x3 ... xN] 
% Each column of X is a feature vector of D dims. There are N 
% such feature vectors (= observations) stacked column wise.
if ~isequal(size(X,1),D)
    error('Data matrix X must have D = %d rows', D);
end
N = size(X, 2);

% Reshape Sigma to form a 3-D tensor [D x D x K]. Required for mvnpdf().
for k = 1:K
    S(:,:,k) = diag(Sigma(:,k));
end

% Initialize gamma matrix
gamma = zeros(N, K);

% Compute gamma(i, k) = p(k| xi; theta_init) for each i and k
% i = index of obsvn; i = 1,...,N.
% k = index of component density; k = 1,..,K.
%
% gamma(i, k) = probability that xi belongs to component density 'k'
%             = class posterior
% 
% p(k| xi; theta_init) can be computed using Baye's rule as:
% 
%                          p(k; theta_init)*p(xi|k; theta_init)
% p(k| xi; theta_init) = --------------------------------------- ,
%                                 p(xi; theta_init)
%
% where,
% p(xi; theta_init) = sum_k=1,..K [p(k;theta_init)*p(xi|k ; theta_init)]
%
c_gamma = zeros(N,1);
for i = 1:N
	% Get the i^th observation from X and convert it to a row vector
    xi = X(:,i)'; % [1 x D]

	% Compute the likelihood of xi for each k using mvnpdf()
    p_xi_given_k = [mvnpdf(xi,Mu(:,1)',S(:,:,1));mvnpdf(xi,Mu(:,2)',S(:,:,2))] ; % [K  x  1]

    % Ensure p ~= 0 (avoids log 0 case)
    p_xi_given_k = max(p_xi_given_k, eps);

    % Compute the num of p(k| xi; theta_init) using Baye's
    num = Weight .* p_xi_given_k ; % [K x 1]

    % Compute the den of p(k| xi; theta_init) using Baye's
    den = sum(num) ; % [1 x 1]

    % Compute p(k| xi; theta_init) from num and den
    p_k_given_xi = num./den ; %?????[K x 1]

    % Save p(k| xi; theta_init) in gamma matrix
    gamma(i,:) = p_k_given_xi' ; % [1 x K] 

    % At this point, we should have sum(gamma(i,:)) = 1 (or very close to 1)
    check_gamma = sum(gamma(i,:));
    c_gamma(i,:) = check_gamma;
    
    % Otherwise sth might be wrong!
end
%disp(c_gamma);
% Evaluate avg. log likelihood of X  w.r.t  model
model.mu = Mu;
model.sigma = Sigma;
model.weight = Weight;
LL = gmm_eval(X', model);

function [Mu,Sigma,Weight] = mstep(X, gamma)
% Compute the M-step: Given data X and gamma probabilities, estimate the
% model parameters

[N, K] = size(gamma);

% X must be a DxN matrix, i.e,  X = [x1 x2 x3 ... xN] 
% Each column of X is a feature vector of D dims. There are N 
% such feature vectors (= observations) stacked column wise.
if ~isequal(size(X,2), N)
    error('Data matrix X must have N = %d columns', N);
end
D = size(X, 1);

% Using gamma probabilities, compute the number of obsvns in each cluster
Nk = sum(gamma) ; % [1 x K]. Make sure sum(Nk) is N. Otherwise sth might be wrong!
%disp(sum(Nk,2));

% Let's compute the component density parameters of the GMM:
% weights, means, cov matrices

% Step 1: Compute weights of the component densities
Weight = Nk ./ N ; % [1 x K]

% Step 2: Compute means as the weighted sum of obsvns where
% the weights of this sum are the normalized gamma values. We'll denote the
% weights by rho.
rho = gamma ./ Nk ; % [N x K]
Mu = X * rho ; % [D x K]

% Step 3: Compute diagonal covariance matrices as weighted sum of outer products
% of rank-1 centered matrices. The weights used in the summation are simply
% the rho values.
Sigma = zeros(D, K);
for k = 1: K
    % Center the data matrix X
    Z = X - repmat(Mu(:,k),1,N) ; % Z = [z1 z2 ... zN] = [D x N]
    
    % Scale each column of the centered matrix Z with the rho values
    % corresponding to component k. So we need
    % [rho1*z1 rho2*z2 ... rhoN*zN]
    Zscaled = Z .* repmat(rho(:,k)',12,1) ; % [D x N]
    % Zscaled = Z .* rho(:,k)'
    
    % Now compute the outer product of Zscaled and Z to get the cov. matrix.
    % But keep only the diag elements.
    A = Zscaled * Z';
    Sigma(:, k) = diag(A) ; % [D x K]
end