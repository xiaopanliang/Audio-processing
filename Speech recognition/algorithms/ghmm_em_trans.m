function [Anew] = ghmm_em_trans(Yseq,N,A,P0,mu,sigma)
%
%
%  USAGE [Anew] = ghmm_em_trans(y,n,alpha,A,P0,mu,sigma)
%  This function learns the parameters of the transition matrix
%

N_seq = length(Yseq);
eps = 0;
MAX_ITR = 20;
Naseq=zeros(N,N);
%%%% compute the probabilities
for seq = 1:N_seq
   Y = Yseq{seq};
   M = size(Y,2);
   T =size(Y,1);
   [alpha,scale] = ghmm_fwd(Y,A,P0,mu,sigma);
   beta = ghmm_bwd(Y,A,P0,mu,sigma,scale);
   [Pxy, Pxxy] = ghmm_prob(alpha,beta,scale,A,mu,sigma,Y);
   
   Na = zeros(N,N);
   for i=1:N
      for j=1:N
         Na(i,j)=sum(Pxxy(:,i,j));
      end
   end
   Na = Na+eps;  
   Naseq = Naseq + Na;
end

for l=1:N
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    disp('You need to insert a line of code into ghmm_em_trans.m that computes')
%    disp('the new transition probabilities A(l,m) from the corresponding')
%    disp('soft-count matrix Na(l,m)')	
   %Anew(l,:) = ???
   Anew(l,:) = Naseq(l,:) ./ sum(Pxy(l,:),2);
end



