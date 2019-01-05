function [matrix_r,N,terror,rerror] = PCA(input,p)

[rowinput, colouminput] = size(input);

A = mean(input,2);
B = repmat(A,[1,colouminput]);
subtract = input - B;

input_c = (1/(colouminput-1))*(subtract*subtract');

[V, D] = eig(input_c);
[Vrow, Vcoloum] = size(V);

D_col = diag(D)';
[D_des,ind_order] = sort(D_col,'descend');
V_des = V(:,ind_order);

E_Sum = sum(D_des,2);

for i = 1:Vrow
    ratio = sum(D_des(1,1:i),2)/E_Sum;
    if ratio > p
        N = i;
        break;
    end
end

V_Fin = V_des(:,1:N);
matrix_r = V_Fin'* subtract;

N1=N+1;
terror = sum(D_des(1,N1:Vcoloum),2);
xhat = V_Fin * matrix_r + B;
rerror = sum( sum(abs(input - xhat).^2,1) )/(colouminput-1);
end