%----------------------------read in images----------------------
img_f2_1 = zeros(6300,20);
img_f2_1_labels = zeros(6301,20);


for i = 1:20
    imagename1 = strcat('A',num2str(i),'.jpg');
    img_0 = double(rgb2gray(imread(imagename1)));
    img_f20 = reshape(img_0,[6300,1]);
    img_f2_1(:,i) = img_f20;
    img_f2_1_labels(1:6300,:) = img_f2_1;
    img_f2_1_labels(6301,:) = ones(1,20);
    
end    

img_f2_2 = zeros(6300,20);
img_f2_2_labels = zeros(6301,20);
for i = 1:20
    imagename2 = strcat('B',num2str(i),'.jpg');
    img_1 = double(rgb2gray(imread(imagename2)));
    img_f21 = reshape(img_1,[6300,1]);
    img_f2_2(:,i) = img_f21;
    img_f2_2_labels(1:6300,:) = img_f2_2;
    img_f2_2_labels(6301,:) = ones(1,20).*2;
end   

img_f2_3 = zeros(6300,20);
img_f2_3_labels = zeros(6301,20);

for i = 1:20
    imagename3 = strcat('C',num2str(i),'.jpg');
    img_3 = double(rgb2gray(imread(imagename3)));
    img_f22 = reshape(img_3,[6300,1]);
    img_f2_3(:,i) = img_f22;
    img_f2_3_labels(1:6300,:) = img_f2_3;
    img_f2_3_labels(6301,:) = ones(1,20).*3;
end   

img_f2_4 = zeros(6300,20);
img_f2_4_labels = zeros(6301,20);

for i = 1:20
    imagename4 = strcat('D',num2str(i),'.jpg');
    img_4 = double(rgb2gray(imread(imagename4)));
    img_f23 = reshape(img_4,[6300,1]);
    img_f2_4(:,i) = img_f23;
    img_f2_4_labels(1:6300,:) = img_f2_4;
    img_f2_4_labels(6301,:) = ones(1,20).*4;
end  

img_f2 = zeros(6300,80);
img_f2_labels = zeros(6301,80);

img_f2(:,1:20)=img_f2_1;
img_f2(:,21:40)=img_f2_2;
img_f2(:,41:60)=img_f2_3;
img_f2(:,61:80)=img_f2_4;
img_f2_labels(:,1:20)=img_f2_1_labels;
img_f2_labels(:,21:40)=img_f2_2_labels;
img_f2_labels(:,41:60)=img_f2_3_labels;
img_f2_labels(:,61:80)=img_f2_4_labels;

%-----------------------------90% energy--------------------------
[matrix_r,N,te,re] = PCA(img_f2,0.9);

Error_1_f2_1 = 0;
Error_1_f2_A_1 = 0;
Error_1_f2_B_1 = 0;
Error_1_f2_C_1 = 0;
Error_1_f2_D_1 = 0;
Error_5_f2_1 = 0;
Error_5_f2_A_1 = 0;
Error_5_f2_B_1= 0;
Error_5_f2_C_1 = 0;
Error_5_f2_D_1 = 0;

for i = 1:80
    inx = matrix_r(:,i);
    T_label = img_f2_labels(6301,i);
    img_f2_data = matrix_r;
    img_f2_data(:,[i]) = [];
    data = img_f2_data;
    img_f2_label = img_f2_labels(6301,:);
    img_f2_label(:,[i]) = [];
    labels = img_f2_label;
    
    found_labels_1 = KNN(inx,data,labels,1);
    if found_labels_1 == T_label
        Error_1_f2_1 = Error_1_f2_1 + 0;
    else
        if T_label == 1
        Error_1_f2_A_1 = Error_1_f2_A_1 + 1;
        elseif T_label == 2
        Error_1_f2_B_1 = Error_1_f2_B_1 + 1;
        elseif T_label == 3
        Error_1_f2_C_1 = Error_1_f2_C_1 + 1;
        else 
        Error_1_f2_D_1 = Error_1_f2_D_1 + 1;
        end
        Error_1_f2_1 = Error_1_f2_A_1 + Error_1_f2_B_1 + Error_1_f2_C_1 +Error_1_f2_D_1;
    end
    
    found_labels_5 = KNN(inx,data,labels,5);
    if found_labels_5 == T_label
        Error_5_f2_1 = Error_5_f2_1 + 0;
    else
        if T_label == 1
        Error_5_f2_A_1 = Error_5_f2_A_1 + 1;
        elseif T_label == 2
        Error_5_f2_B_1 = Error_5_f2_B_1 + 1;
        elseif T_label == 3
        Error_5_f2_C_1 = Error_5_f2_C_1 + 1;
        else 
        Error_5_f2_D_1 = Error_5_f2_D_1 + 1;
        end
        Error_5_f2_1 = Error_5_f2_A_1 + Error_5_f2_B_1 + Error_5_f2_C_1 +Error_5_f2_D_1;
    end
    
end

Acc_1_f2_A_1 = ((20-Error_1_f2_A_1) * 100 )/ 20;
Acc_1_f2_B_1 = ((20-Error_1_f2_B_1) * 100 )/ 20;
Acc_1_f2_C_1 = ((20-Error_1_f2_C_1) * 100 )/ 20;
Acc_1_f2_D_1 = ((20-Error_1_f2_D_1) * 100 )/ 20;
Acc_1_f2_1 = ((80-Error_1_f2_1) * 100 )/ 80;

Acc_5_f2_A_1 = ((20-Error_5_f2_A_1) * 100 )/ 20;
Acc_5_f2_B_1 = ((20-Error_5_f2_B_1) * 100 )/ 20;
Acc_5_f2_C_1 = ((20-Error_5_f2_C_1) * 100 )/ 20;
Acc_5_f2_D_1 = ((20-Error_5_f2_D_1) * 100 )/ 20;
Acc_5_f2_1 = ((80-Error_5_f2_1) * 100 )/ 80;

%---------------------------98% energy-----------------------------
[matrix_r,N,te,re] = PCA(img_f2,0.98);

Error_1_f2_2 = 0;
Error_1_f2_A_2 = 0;
Error_1_f2_B_2 = 0;
Error_1_f2_C_2 = 0;
Error_1_f2_D_2 = 0;
Error_5_f2_2 = 0;
Error_5_f2_A_2 = 0;
Error_5_f2_B_2= 0;
Error_5_f2_C_2 = 0;
Error_5_f2_D_2 = 0;

for i = 1:80
    inx = matrix_r(:,i);
    T_label = img_f2_labels(6301,i);
    img_f2_data = matrix_r;
    img_f2_data(:,[i]) = [];
    data = img_f2_data;
    img_f2_label = img_f2_labels(6301,:);
    img_f2_label(:,[i]) = [];
    labels = img_f2_label;
    
    found_labels_1 = KNN(inx,data,labels,1);
    if found_labels_1 == T_label
        Error_1_f2_2 = Error_1_f2_2 + 0;
    else
        if T_label == 1
        Error_1_f2_A_2 = Error_1_f2_A_2 + 1;
        elseif T_label == 2
        Error_1_f2_B_2 = Error_1_f2_B_2 + 1;
        elseif T_label == 3
        Error_1_f2_C_2 = Error_1_f2_C_2 + 1;
        else 
        Error_1_f2_D_2 = Error_1_f2_D_2 + 1;
        end
        Error_1_f2_2 = Error_1_f2_A_2 + Error_1_f2_B_2 + Error_1_f2_C_2 +Error_1_f2_D_2;
    end
    
    found_labels_5 = KNN(inx,data,labels,5);
    if found_labels_5 == T_label
        Error_5_f2_2 = Error_5_f2_2 + 0;
    else
        if T_label == 1
        Error_5_f2_A_2 = Error_5_f2_A_2 + 1;
        elseif T_label == 2
        Error_5_f2_B_2 = Error_5_f2_B_2 + 1;
        elseif T_label == 3
        Error_5_f2_C_2 = Error_5_f2_C_2 + 1;
        else 
        Error_5_f2_D_2 = Error_5_f2_D_2 + 1;
        end
        Error_5_f2_2 = Error_5_f2_A_2 + Error_5_f2_B_2 + Error_5_f2_C_2 +Error_5_f2_D_2;
    end
    
end

Acc_1_f2_A_2 = ((20-Error_1_f2_A_2) * 100 )/ 20;
Acc_1_f2_B_2 = ((20-Error_1_f2_B_2) * 100 )/ 20;
Acc_1_f2_C_2 = ((20-Error_1_f2_C_2) * 100 )/ 20;
Acc_1_f2_D_2 = ((20-Error_1_f2_D_2) * 100 )/ 20;
Acc_1_f2_2 = ((80-Error_1_f2_2) * 100 )/ 80;

Acc_5_f2_A_2 = ((20-Error_5_f2_A_2) * 100 )/ 20;
Acc_5_f2_B_2 = ((20-Error_5_f2_B_2) * 100 )/ 20;
Acc_5_f2_C_2 = ((20-Error_5_f2_C_2) * 100 )/ 20;
Acc_5_f2_D_2 = ((20-Error_5_f2_D_2) * 100 )/ 20;
Acc_5_f2_2 = ((80-Error_5_f2_2) * 100 )/ 80;
