
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

%-------------------------random projection---------------------------
%generate a projection matrix of size 6300*N, N=68
P = randn(6300,68);
%matrix of original data img_f2 is a 6300 by 80 matrix.
%project each 6300*1 image on to the random space, img_f3_r is the result
%matrix.
img_f3_r = P'* img_f2;

%--------------Random projection KNN & Accuracy calculation----------------

Error_1_f3 = 0;
Error_1_f3_A = 0;
Error_1_f3_B = 0;
Error_1_f3_C = 0;
Error_1_f3_D = 0;
Error_5_f3 = 0;
Error_5_f3_A = 0;
Error_5_f3_B= 0;
Error_5_f3_C = 0;
Error_5_f3_D = 0;

for i = 1:80
    inx = img_f3_r(:,i);
    T_label = img_f2_labels(6301,i);
    img_f3_data = img_f3_r;
    img_f3_data(:,[i]) = [];
    data = img_f3_data;
    img_f3_label = img_f2_labels(6301,:);
    img_f3_label(:,[i]) = [];
    labels = img_f3_label;
    
    found_labels_1 = KNN(inx,data,labels,1);
    if found_labels_1 == T_label
        Error_1_f3 = Error_1_f3 + 0;
    else
        if T_label == 1
        Error_1_f3_A = Error_1_f3_A + 1;
        elseif T_label == 2
        Error_1_f3_B = Error_1_f3_B + 1;
        elseif T_label == 3
        Error_1_f3_C = Error_1_f3_C + 1;
        else 
        Error_1_f3_D = Error_1_f3_D + 1;
        end
        Error_1_f3 = Error_1_f3_A + Error_1_f3_B + Error_1_f3_C +Error_1_f3_D;
    end
    
    found_labels_5 = KNN(inx,data,labels,5);
    if found_labels_5 == T_label
        Error_5_f3 = Error_5_f3 + 0;
    else
        if T_label == 1
        Error_5_f3_A = Error_5_f3_A + 1;
        elseif T_label == 2
        Error_5_f3_B = Error_5_f3_B + 1;
        elseif T_label == 3
        Error_5_f3_C = Error_5_f3_C + 1;
        else 
        Error_5_f3_D = Error_5_f3_D + 1;
        end
        Error_5_f3 = Error_5_f3_A + Error_5_f3_B + Error_5_f3_C +Error_5_f3_D;
    end
    
end

Acc_1_f3_A = ((20-Error_1_f3_A) * 100 )/ 20;
Acc_1_f3_B = ((20-Error_1_f3_B) * 100 )/ 20;
Acc_1_f3_C = ((20-Error_1_f3_C) * 100 )/ 20;
Acc_1_f3_D = ((20-Error_1_f3_D) * 100 )/ 20;
Acc_1_f3 = ((80-Error_1_f3) * 100 )/ 80;

Acc_5_f3_A = ((20-Error_5_f3_A) * 100 )/ 20;
Acc_5_f3_B = ((20-Error_5_f3_B) * 100 )/ 20;
Acc_5_f3_C = ((20-Error_5_f3_C) * 100 )/ 20;
Acc_5_f3_D = ((20-Error_5_f3_D) * 100 )/ 20;
Acc_5_f3 = ((80-Error_5_f3) * 100 )/ 80;