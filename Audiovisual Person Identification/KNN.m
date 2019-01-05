function [found_label,PP] = KNN(inx, data, labels, k)

[datarow,datacoloum] = size(data);
subtract = repmat(inx,[1,datacoloum]) - data;
A = subtract.^2;
B = sum(A);
dis_data = sqrt(B);
[C,D] = sort(dis_data,'ascend');
len = min(k,length(C));
ind = D(1,1:len);
label = labels(1,ind);
%found_label = mode(label);
P_A_1 = find(label==1);
A_num = size(P_A_1,2);
P_A = A_num/10;

P_B_1 = find(label==2);
B_num = size(P_B_1,2);
P_B = B_num/10;

P_C_1 = find(label==3);
C_num = size(P_C_1,2);
P_C = C_num/10;

P_D_1 = find(label==4);
D_num = size(P_D_1,2);
P_D = D_num/10;

PP = [P_A; P_B; P_C; P_D];
[PP_s,PP_idx] = sort(PP,'descend');
found_label = PP_idx(1,:);
% disp(PP_s);
% disp(PP_idx);

end