

%-------------------------Read in images----------------------------
%PCA part A
img_f2_1 = zeros(6300,20);
img_f2_1_labels = zeros(6301,20);
%raw pixel 70*90 matrix part A
img_f1_1_1 = zeros(6300,20);
img_f1_1_1_labels = zeros(6301,20);
%raw pixel 35*45 matrix part A
img_f1_2_1 = zeros(1575,20);
img_f1_2_1_labels = zeros (1576,20);
%raw pixel 17*22 matrix part A
img_f1_3_1 = zeros(374,20);
img_f1_3_1_labels = zeros(365,20);
%raw pixel 7*9 matrix part A
img_f1_4_1 = zeros(63,20);
img_f1_4_1_labels = zeros(64,20);

for i = 1:20
    imagename1 = strcat('A',num2str(i),'.jpg');
    img_0 = double(rgb2gray(imread(imagename1)));
    %data for feature 2&3
    img_f20 = reshape(img_0,[6300,1]);
    img_f2_1(:,i) = img_f20;
    img_f2_1_labels(1:6300,:) = img_f2_1;
    img_f2_1_labels(6301,:) = ones(1,20);
    %raw pixel 70*90 maatrix
    img01 = imresize(img_0,[70,90]);
    img011 = reshape(img01,[6300,1]);
    img_f1_1_1(:,i)= img011;
    img_f1_1_1_labels(1:6300,:) = img_f1_1_1;
    img_f1_1_1_labels(6301,:) = ones(1,20);
    %raw pixel 35*45 matrix
    img02 = imresize(img_0,[35,45]);
    img021 = reshape(img02,[1575,1]);
    img_f1_2_1(:,i)= img021;
    img_f1_2_1_labels(1:1575,:) = img_f1_2_1;
    img_f1_2_1_labels(1576,:) = ones(1,20);
    %raw pixel 17*22 matrix
    img03 = imresize(img_0,[17,22]);
    img031 = reshape(img03,[374,1]);
    img_f1_3_1(:,i)= img031;
    img_f1_3_1_labels(1:374,:) = img_f1_3_1;
    img_f1_3_1_labels(375,:) = ones(1,20);
    %raw pixel 7*9 matrix
    img04 = imresize(img_0,[7,9]);
    img041 = reshape(img04,[63,1]);
    img_f1_4_1(:,i)= img041;
    img_f1_4_1_labels(1:63,:) = img_f1_4_1;
    img_f1_4_1_labels(64,:) = ones(1,20);
end    


%PCA part B
img_f2_2 = zeros(6300,20);
img_f2_2_labels = zeros(6301,20);
%raw pixel 70*90 matrix part B
img_f1_1_2 = zeros(6300,20);
img_f1_1_2_labels = zeros(6301,20);
%raw pixel 35*45 matrix part B
img_f1_2_2 = zeros(1575,20);
img_f1_2_2_labels = zeros (1576,20);
%raw pixel 17*22 matrix part B
img_f1_3_2 = zeros(374,20);
img_f1_3_2_labels = zeros(365,20);
%raw pixel 7*9 matrix part B
img_f1_4_2 = zeros(63,20);
img_f1_4_2_labels = zeros(64,20);

for i = 1:20
    imagename2 = strcat('B',num2str(i),'.jpg');
    img_1 = double(rgb2gray(imread(imagename2)));
    %data for feature 2&3
    img_f21 = reshape(img_1,[6300,1]);
    img_f2_2(:,i) = img_f21;
    img_f2_2_labels(1:6300,:) = img_f2_2;
    img_f2_2_labels(6301,:) = ones(1,20).*2;
    %raw pixel 70*90 matrix
    img01_1 = imresize(img_1,[70,90]);
    img011_1 = reshape(img01_1,[6300,1]);
    img_f1_1_2(:,i)= img011_1;
    img_f1_1_2_labels(1:6300,:) = img_f1_1_2;
    img_f1_1_2_labels(6301,:) = ones(1,20).*2;
    %raw pixel 35*45 matrix
    img02_1 = imresize(img_1,[35,45]);
    img021_1 = reshape(img02_1,[1575,1]);
    img_f1_2_2(:,i)= img021_1;
    img_f1_2_2_labels(1:1575,:) = img_f1_2_2;
    img_f1_2_2_labels(1576,:) = ones(1,20).*2;
    %raw pixel 17*22 matrix
    img03_1 = imresize(img_1,[17,22]);
    img031_1 = reshape(img03_1,[374,1]);
    img_f1_3_2(:,i)= img031_1;
    img_f1_3_2_labels(1:374,:) = img_f1_3_2;
    img_f1_3_2_labels(375,:) = ones(1,20).*2;
    %raw pixel 7*9 matrix
    img04_1 = imresize(img_1,[7,9]);
    img041_1 = reshape(img04_1,[63,1]);
    img_f1_4_2(:,i)= img041_1;
    img_f1_4_2_labels(1:63,:) = img_f1_4_2;
    img_f1_4_2_labels(64,:) = ones(1,20).*2;
end   

%PCA part C
img_f2_3 = zeros(6300,20);
img_f2_3_labels = zeros(6301,20);
%raw pixel 70*90 matrix part C
img_f1_1_3 = zeros(6300,20);
img_f1_1_3_labels = zeros(6301,20);
%raw pixel 35*45 matrix part C
img_f1_2_3 = zeros(1575,20);
img_f1_2_3_labels = zeros (1576,20);
%raw pixel 17*22 matrix part C
img_f1_3_3 = zeros(374,20);
img_f1_3_3_labels = zeros(365,20);
%raw pixel 7*9 matrix part C
img_f1_4_3 = zeros(63,20);
img_f1_4_3_labels = zeros(64,20);


for i = 1:20
    imagename3 = strcat('C',num2str(i),'.jpg');
    img_3 = double(rgb2gray(imread(imagename3)));
    %data for feature 2&3
    img_f22 = reshape(img_3,[6300,1]);
    img_f2_3(:,i) = img_f22;
    img_f2_3_labels(1:6300,:) = img_f2_3;
    img_f2_3_labels(6301,:) = ones(1,20).*3;
    %raw pixel 70*90 matrix
    img01_2 = imresize(img_3,[70,90]);
    img011_2 = reshape(img01_2,[6300,1]);
    img_f1_1_3(:,i)= img011_2;
    img_f1_1_3_labels(1:6300,:) = img_f1_1_3;
    img_f1_1_3_labels(6301,:) = ones(1,20).*3;
    %raw pixel 35*45 matrix
    img02_2 = imresize(img_3,[35,45]);
    img021_2 = reshape(img02_2,[1575,1]);
    img_f1_2_3(:,i)= img021_2;
    img_f1_2_3_labels(1:1575,:) = img_f1_2_3;
    img_f1_2_3_labels(1576,:) = ones(1,20).*3;
    %raw pixel 17*22 matrix
    img03_2 = imresize(img_3,[17,22]);
    img031_2 = reshape(img03_2,[374,1]);
    img_f1_3_3(:,i)= img031_2;
    img_f1_3_3_labels(1:374,:) = img_f1_3_3;
    img_f1_3_3_labels(375,:) = ones(1,20).*3;
    %raw pixel 7*9 matrix
    img04_2 = imresize(img_3,[7,9]);
    img041_2 = reshape(img04_2,[63,1]);
    img_f1_4_3(:,i)= img041_2;
    img_f1_4_3_labels(1:63,:) = img_f1_4_3;
    img_f1_4_3_labels(64,:) = ones(1,20).*3;
end   

%PPCA part D
img_f2_4 = zeros(6300,20);
img_f2_4_labels = zeros(6301,20);
%raw pixel 70*90 matrix part D
img_f1_1_4 = zeros(6300,20);
img_f1_1_4_labels = zeros(6301,20);
%raw pixel 35*45 matrix part D
img_f1_2_4 = zeros(1575,20);
img_f1_2_4_labels = zeros (1576,20);
%raw pixel 17*22 matrix part D
img_f1_3_4 = zeros(374,20);
img_f1_3_4_labels = zeros(365,20);
%raw pixel 7*9 matrix part D
img_f1_4_4 = zeros(63,20);
img_f1_4_4_labels = zeros(64,20);


for i = 1:20
    imagename4 = strcat('D',num2str(i),'.jpg');
    img_4 = double(rgb2gray(imread(imagename4)));
    %data for feature 2&3
    img_f23 = reshape(img_4,[6300,1]);
    img_f2_4(:,i) = img_f23;
    img_f2_4_labels(1:6300,:) = img_f2_4;
    img_f2_4_labels(6301,:) = ones(1,20).*4;
    %raw pixel 70*90 matrix
    img01_3 = imresize(img_4,[70,90]);
    img011_3 = reshape(img01_3,[6300,1]);
    img_f1_1_4(:,i)= img011_3;
    img_f1_1_4_labels(1:6300,:) = img_f1_1_4;
    img_f1_1_4_labels(6301,:) = ones(1,20).*4;
    %raw pixel 35*45 matrix
    img02_3 = imresize(img_4,[35,45]);
    img021_3 = reshape(img02_3,[1575,1]);
    img_f1_2_4(:,i)= img021_3;
    img_f1_2_4_labels(1:1575,:) = img_f1_2_4;
    img_f1_2_4_labels(1576,:) = ones(1,20).*4;
    %raw pixel 17*22 matrix
    img03_3 = imresize(img_4,[17,22]);
    img031_3 = reshape(img03_3,[374,1]);
    img_f1_3_4(:,i)= img031_3;
    img_f1_3_4_labels(1:374,:) = img_f1_3_4;
    img_f1_3_4_labels(375,:) = ones(1,20).*4;
    %raw pixel 7*9 matrix
    img04_3 = imresize(img_4,[7,9]);
    img041_3 = reshape(img04_3,[63,1]);
    img_f1_4_4(:,i)= img041_3;
    img_f1_4_4_labels(1:63,:) = img_f1_4_4;
    img_f1_4_4_labels(64,:) = ones(1,20).*4;
end  

img_f2 = zeros(6300,80);
img_f2_labels = zeros(6301,80);
img_f1_1 = zeros(6300,80);
img_f1_1_labels = zeros(6301,80);
img_f1_2 = zeros(1575,80);
img_f1_2_labels = zeros(1576,80);
img_f1_3 = zeros(374,80);
img_f1_3_labels = zeros(375,80);
img_f1_4 = zeros(63,80);
img_f1_4_labels = zeros(64,80);

%feature matrix 
img_f2(:,1:20)=img_f2_1;
img_f2(:,21:40)=img_f2_2;
img_f2(:,41:60)=img_f2_3;
img_f2(:,61:80)=img_f2_4;
img_f2_labels(:,1:20)=img_f2_1_labels;
img_f2_labels(:,21:40)=img_f2_2_labels;
img_f2_labels(:,41:60)=img_f2_3_labels;
img_f2_labels(:,61:80)=img_f2_4_labels;

img_f1_1(:,1:20)=img_f1_1_1;
img_f1_1(:,21:40)=img_f1_1_2;
img_f1_1(:,41:60)=img_f1_1_3;
img_f1_1(:,61:80)=img_f1_1_4;
img_f1_1_labels(:,1:20)=img_f1_1_1_labels;
img_f1_1_labels(:,21:40)=img_f1_1_2_labels;
img_f1_1_labels(:,41:60)=img_f1_1_3_labels;
img_f1_1_labels(:,61:80)=img_f1_1_4_labels;

img_f1_2(:,1:20)=img_f1_2_1;
img_f1_2(:,21:40)=img_f1_2_2;
img_f1_2(:,41:60)=img_f1_2_3;
img_f1_2(:,61:80)=img_f1_2_4;
img_f1_2_labels(:,1:20)=img_f1_2_1_labels;
img_f1_2_labels(:,21:40)=img_f1_2_2_labels;
img_f1_2_labels(:,41:60)=img_f1_2_3_labels;
img_f1_2_labels(:,61:80)=img_f1_2_4_labels;

img_f1_3(:,1:20)=img_f1_3_1;
img_f1_3(:,21:40)=img_f1_3_2;
img_f1_3(:,41:60)=img_f1_3_3;
img_f1_3(:,61:80)=img_f1_3_4;
img_f1_3_labels(:,1:20)=img_f1_3_1_labels;
img_f1_3_labels(:,21:40)=img_f1_3_2_labels;
img_f1_3_labels(:,41:60)=img_f1_3_3_labels;
img_f1_3_labels(:,61:80)=img_f1_3_4_labels;

img_f1_4(:,1:20)=img_f1_4_1;
img_f1_4(:,21:40)=img_f1_4_2;
img_f1_4(:,41:60)=img_f1_4_3;
img_f1_4(:,61:80)=img_f1_4_4;
img_f1_4_labels(:,1:20)=img_f1_4_1_labels;
img_f1_4_labels(:,21:40)=img_f1_4_2_labels;
img_f1_4_labels(:,41:60)=img_f1_4_3_labels;
img_f1_4_labels(:,61:80)=img_f1_4_4_labels;

%---------------End Read in images(f1-1,f1-2,f1-3,f2,f3)----------------

%-------------KNN & Accuracy calculation (Raw pixel 1,2,3)--------------

%raw pixel 70*90 
Error_1_1 = 0;
Error_1_1_A = 0;
Error_1_1_B = 0;
Error_1_1_C = 0;
Error_1_1_D = 0;
Error_5_1 = 0;
Error_5_1_A = 0;
Error_5_1_B= 0;
Error_5_1_C = 0;
Error_5_1_D = 0;

for i = 1:80
    inx = img_f1_1_labels(1:6300,i);
    T_label = img_f1_1_labels(6301,i);
    img_f1_1_data = img_f1_1;
    img_f1_1_data(:,[i]) = [];
    data = img_f1_1_data;
    img_f1_1_label = img_f1_1_labels(6301,:);
    img_f1_1_label(:,[i]) = [];
    labels = img_f1_1_label;
    
    found_labels_1 = KNN(inx,data,labels,1);
    if found_labels_1 == T_label
        Error_1_1 = Error_1_1 + 0;
    else
        if T_label == 1
        Error_1_1_A = Error_1_1_A + 1;
        elseif T_label == 2
        Error_1_1_B = Error_1_1_B + 1;
        elseif T_label == 3
        Error_1_1_C = Error_1_1_C + 1;
        else 
        Error_1_1_D = Error_1_1_D + 1;
        end
        Error_1_1 = Error_1_1_A + Error_1_1_B + Error_1_1_C +Error_1_1_D;
    end
    
    found_labels_5 = KNN(inx,data,labels,5);
    if found_labels_5 == T_label
        Error_5_1 = Error_5_1 + 0;
    else
        if T_label == 1
        Error_5_1_A = Error_5_1_A + 1;
        elseif T_label == 2
        Error_5_1_B = Error_5_1_B + 1;
        elseif T_label == 3
        Error_5_1_C = Error_5_1_C + 1;
        else 
        Error_5_1_D = Error_5_1_D + 1;
        end
        Error_5_1 = Error_5_1_A + Error_5_1_B + Error_5_1_C +Error_5_1_D;
    end
    
end

Acc_1_1_A = ((20-Error_1_1_A) * 100 )/ 20;
Acc_1_1_B = ((20-Error_1_1_B) * 100 )/ 20;
Acc_1_1_C = ((20-Error_1_1_C) * 100 )/ 20;
Acc_1_1_D = ((20-Error_1_1_D) * 100 )/ 20;
Acc_1_1 = ((80-Error_1_1) * 100 )/ 80;

Acc_5_1_A = ((20-Error_5_1_A) * 100 )/ 20;
Acc_5_1_B = ((20-Error_5_1_B) * 100 )/ 20;
Acc_5_1_C = ((20-Error_5_1_C) * 100 )/ 20;
Acc_5_1_D = ((20-Error_5_1_D) * 100 )/ 20;
Acc_5_1 = ((80-Error_5_1) * 100 )/ 80;


%raw pixel 35*45
Error_1_2 = 0;
Error_1_2_A = 0;
Error_1_2_B = 0;
Error_1_2_C = 0;
Error_1_2_D = 0;
Error_5_2 = 0;
Error_5_2_A = 0;
Error_5_2_B= 0;
Error_5_2_C = 0;
Error_5_2_D = 0;

for i = 1:80
    inx = img_f1_2_labels(1:1575,i);
    T_label = img_f1_2_labels(1576,i);
    img_f1_2_data = img_f1_2;
    img_f1_2_data(:,[i]) = [];
    data = img_f1_2_data;
    img_f1_2_label = img_f1_2_labels(1576,:);
    img_f1_2_label(:,[i]) = [];
    labels = img_f1_2_label;
    
    found_labels_1 = KNN(inx,data,labels,1);
    if found_labels_1 == T_label
        Error_1_2 = Error_1_2 + 0;
    else
        if T_label == 1
        Error_1_2_A = Error_1_2_A + 1;
        elseif T_label == 2
        Error_1_2_B = Error_1_2_B + 1;
        elseif T_label == 3
        Error_1_2_C = Error_1_2_C + 1;
        else 
        Error_1_2_D = Error_1_2_D + 1;
        end
        Error_1_2 = Error_1_2_A + Error_1_2_B + Error_1_2_C +Error_1_2_D;
    end
    
    found_labels_5 = KNN(inx,data,labels,5);
    if found_labels_5 == T_label
        Error_5_2 = Error_5_2 + 0;
    else
        if T_label == 1
        Error_5_2_A = Error_5_2_A + 1;
        elseif T_label == 2
        Error_5_2_B = Error_5_2_B + 1;
        elseif T_label == 3
        Error_5_2_C = Error_5_2_C + 1;
        else 
        Error_5_2_D = Error_5_2_D + 1;
        end
        Error_5_2 = Error_5_2_A + Error_5_2_B + Error_5_2_C +Error_5_2_D;
    end
    
end

Acc_1_2_A = ((20-Error_1_2_A) * 100 )/ 20;
Acc_1_2_B = ((20-Error_1_2_B) * 100 )/ 20;
Acc_1_2_C = ((20-Error_1_2_C) * 100 )/ 20;
Acc_1_2_D = ((20-Error_1_2_D) * 100 )/ 20;
Acc_1_2 = ((80-Error_1_2) * 100 )/ 80;

Acc_5_2_A = ((20-Error_5_2_A) * 100 )/ 20;
Acc_5_2_B = ((20-Error_5_2_B) * 100 )/ 20;
Acc_5_2_C = ((20-Error_5_2_C) * 100 )/ 20;
Acc_5_2_D = ((20-Error_5_2_D) * 100 )/ 20;
Acc_5_2 = ((80-Error_5_2) * 100 )/ 80;


%raw pixel 17*22
Error_1_3 = 0;
Error_1_3_A = 0;
Error_1_3_B = 0;
Error_1_3_C = 0;
Error_1_3_D = 0;
Error_5_3 = 0;
Error_5_3_A = 0;
Error_5_3_B= 0;
Error_5_3_C = 0;
Error_5_3_D = 0;

for i = 1:80
    inx = img_f1_3_labels(1:374,i);
    T_label = img_f1_3_labels(375,i);
    img_f1_3_data = img_f1_3;
    img_f1_3_data(:,[i]) = [];
    data = img_f1_3_data;
    img_f1_3_label = img_f1_3_labels(375,:);
    img_f1_3_label(:,[i]) = [];
    labels = img_f1_3_label;
    
    found_labels_1 = KNN(inx,data,labels,1);
    if found_labels_1 == T_label
        Error_1_3 = Error_1_3 + 0;
    else
        if T_label == 1
        Error_1_3_A = Error_1_3_A + 1;
        elseif T_label == 2
        Error_1_3_B = Error_1_3_B + 1;
        elseif T_label == 3
        Error_1_3_C = Error_1_3_C + 1;
        else 
        Error_1_3_D = Error_1_3_D + 1;
        end
        Error_1_3 = Error_1_3_A + Error_1_3_B + Error_1_3_C +Error_1_3_D;
    end
    
    found_labels_5 = KNN(inx,data,labels,5);
    if found_labels_5 == T_label
        Error_5_3 = Error_5_3 + 0;
    else
        if T_label == 1
        Error_5_3_A = Error_5_3_A + 1;
        elseif T_label == 2
        Error_5_3_B = Error_5_3_B + 1;
        elseif T_label == 3
        Error_5_3_C = Error_5_3_C + 1;
        else 
        Error_5_3_D = Error_5_3_D + 1;
        end
        Error_5_3 = Error_5_3_A + Error_5_3_B + Error_5_3_C +Error_5_3_D;
    end
    
end

Acc_1_3_A = ((20-Error_1_3_A) * 100 )/ 20;
Acc_1_3_B = ((20-Error_1_3_B) * 100 )/ 20;
Acc_1_3_C = ((20-Error_1_3_C) * 100 )/ 20;
Acc_1_3_D = ((20-Error_1_3_D) * 100 )/ 20;
Acc_1_3 = ((80-Error_1_3) * 100 )/ 80;

Acc_5_3_A = ((20-Error_5_3_A) * 100 )/ 20;
Acc_5_3_B = ((20-Error_5_3_B) * 100 )/ 20;
Acc_5_3_C = ((20-Error_5_3_C) * 100 )/ 20;
Acc_5_3_D = ((20-Error_5_3_D) * 100 )/ 20;
Acc_5_3 = ((80-Error_5_3) * 100 )/ 80;

%raw pixel 7*9 
Error_1_4 = 0;
Error_1_4_A = 0;
Error_1_4_B = 0;
Error_1_4_C = 0;
Error_1_4_D = 0;
Error_5_4 = 0;
Error_5_4_A = 0;
Error_5_4_B= 0;
Error_5_4_C = 0;
Error_5_4_D = 0;

for i = 1:80
    inx = img_f1_4_labels(1:63,i);
    T_label = img_f1_4_labels(64,i);
    img_f1_1_data = img_f1_4;
    img_f1_1_data(:,[i]) = [];
    data = img_f1_1_data;
    img_f1_1_label = img_f1_4_labels(64,:);
    img_f1_1_label(:,[i]) = [];
    labels = img_f1_1_label;
    
    [found_labels_1] = KNN(inx,data,labels,1);
    if found_labels_1 == T_label
        Error_1_4 = Error_1_4 + 0;
    else
        if T_label == 1
        Error_1_4_A = Error_1_4_A + 1;
        elseif T_label == 2
        Error_1_4_B = Error_1_4_B + 1;
        elseif T_label == 3
        Error_1_4_C = Error_1_4_C + 1;
        else 
        Error_1_4_D = Error_1_4_D + 1;
        end
        Error_1_4 = Error_1_4_A + Error_1_4_B + Error_1_4_C +Error_1_4_D;
    end
    
    [found_labels_5] = KNN(inx,data,labels,5);
    if found_labels_5 == T_label
        Error_5_4 = Error_5_4 + 0;
    else
        if T_label == 1
        Error_5_4_A = Error_5_4_A + 1;
        elseif T_label == 2
        Error_5_4_B = Error_5_4_B + 1;
        elseif T_label == 3
        Error_5_4_C = Error_5_4_C + 1;
        else 
        Error_5_4_D = Error_5_4_D + 1;
        end
        Error_5_4 = Error_5_4_A + Error_5_4_B + Error_5_4_C +Error_5_4_D;
    end
    
end

Acc_1_4_A = ((20-Error_1_4_A) * 100 )/ 20;
Acc_1_4_B = ((20-Error_1_4_B) * 100 )/ 20;
Acc_1_4_C = ((20-Error_1_4_C) * 100 )/ 20;
Acc_1_4_D = ((20-Error_1_4_D) * 100 )/ 20;
Acc_1_4 = ((80-Error_1_4) * 100 )/ 80;

Acc_5_4_A = ((20-Error_5_4_A) * 100 )/ 20;
Acc_5_4_B = ((20-Error_5_4_B) * 100 )/ 20;
Acc_5_4_C = ((20-Error_5_4_C) * 100 )/ 20;
Acc_5_4_D = ((20-Error_5_4_D) * 100 )/ 20;
Acc_5_4 = ((80-Error_5_4) * 100 )/ 80;


%-----------------------------PCA------------------------------------
% Generat PCA feature matrix and calculte the true error and estimated error
[matrix_r,N,te,re] = PCA(img_f2, 0.95);
%-------------------KNN & ACCURACY CALCULATION-----------------------
%raw pixel 17*22
Error_1_f2 = 0;
Error_1_f2_A = 0;
Error_1_f2_B = 0;
Error_1_f2_C = 0;
Error_1_f2_D = 0;
Error_5_f2 = 0;
Error_5_f2_A = 0;
Error_5_f2_B= 0;
Error_5_f2_C = 0;
Error_5_f2_D = 0;

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
        Error_1_f2 = Error_1_f2 + 0;
    else
        if T_label == 1
        Error_1_f2_A = Error_1_f2_A + 1;
        elseif T_label == 2
        Error_1_f2_B = Error_1_f2_B + 1;
        elseif T_label == 3
        Error_1_f2_C = Error_1_f2_C + 1;
        else 
        Error_1_f2_D = Error_1_f2_D + 1;
        end
        Error_1_f2 = Error_1_f2_A + Error_1_f2_B + Error_1_f2_C +Error_1_f2_D;
    end
    
    found_labels_5 = KNN(inx,data,labels,5);
    if found_labels_5 == T_label
        Error_5_f2 = Error_5_f2 + 0;
    else
        if T_label == 1
        Error_5_f2_A = Error_5_f2_A + 1;
        elseif T_label == 2
        Error_5_f2_B = Error_5_f2_B + 1;
        elseif T_label == 3
        Error_5_f2_C = Error_5_f2_C + 1;
        else 
        Error_5_f2_D = Error_5_f2_D + 1;
        end
        Error_5_f2 = Error_5_f2_A + Error_5_f2_B + Error_5_f2_C +Error_5_f2_D;
    end
    
end

Acc_1_f2_A = ((20-Error_1_f2_A) * 100 )/ 20;
Acc_1_f2_B = ((20-Error_1_f2_B) * 100 )/ 20;
Acc_1_f2_C = ((20-Error_1_f2_C) * 100 )/ 20;
Acc_1_f2_D = ((20-Error_1_f2_D) * 100 )/ 20;
Acc_1_f2 = ((80-Error_1_f2) * 100 )/ 80;

Acc_5_f2_A = ((20-Error_5_f2_A) * 100 )/ 20;
Acc_5_f2_B = ((20-Error_5_f2_B) * 100 )/ 20;
Acc_5_f2_C = ((20-Error_5_f2_C) * 100 )/ 20;
Acc_5_f2_D = ((20-Error_5_f2_D) * 100 )/ 20;
Acc_5_f2 = ((80-Error_5_f2) * 100 )/ 80;

%-----------------------------end PCA--------------------------------

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
  

%------------------------display-------------------------------
disp('Feat = raw, Input Dims = [70 90], kNN = 1')
disp('      A         B         C         D      overall')
D11 = [Acc_1_1_A,Acc_1_1_B,Acc_1_1_C,Acc_1_1_D,Acc_1_1];
disp(D11)
disp('_____________________________________________________')
disp('')
disp('Feat = raw, Input Dims = [35 45], kNN = 1')
disp('    A     B     C     D   overall')
D12 = [Acc_1_2_A,Acc_1_2_B,Acc_1_2_C,Acc_1_2_D,Acc_1_2];
disp(D12)
disp('_____________________________________________________')
disp('')
disp('Feat = raw, Input Dims = [17 22], kNN = 1')
disp('      A         B         C         D      overall')
D13 = [Acc_1_3_A,Acc_1_3_B,Acc_1_3_C,Acc_1_3_D,Acc_1_3];
disp(D13)
disp('_____________________________________________________')
disp('')
disp('Feat = raw, Input Dims = [ 7  9], kNN = 1')
disp('      A         B         C         D      overall')
D14 = [Acc_1_4_A,Acc_1_4_B,Acc_1_4_C,Acc_1_4_D,Acc_1_4];
disp(D14)
disp('_____________________________________________________')
disp('')
disp('Feat = PCA, Input Dims = [90  70], kNN = 1')
disp('      A         B         C         D      overall')
D15 = [Acc_1_f2_A,Acc_1_f2_B,Acc_1_f2_C,Acc_1_f2_D,Acc_1_f2];
disp(D15)
disp('_____________________________________________________')
disp('')
disp('Feat = random projection, Input Dims = [90  70], kNN = 1')
disp('      A         B         C         D      overall')
D16 = [Acc_1_f3_A,Acc_1_f3_B,Acc_1_f3_C,Acc_1_f3_D,Acc_1_f3];
disp(D16)
disp('_____________________________________________________')
disp('')

disp('')
disp('_____________________________________________________')

disp('Feat = raw, Input Dims = [70 90], kNN = 5')
disp('    A     B     C     D   overall')
D51 = [Acc_5_1_A,Acc_5_1_B,Acc_5_1_C,Acc_5_1_D,Acc_5_1];
disp(D51)
disp('_____________________________________________________')
disp('')

disp('Feat = raw, Input Dims = [35 45], kNN = 5')
disp('      A         B         C         D      overall')
D52 = [Acc_5_2_A,Acc_5_2_B,Acc_5_2_C,Acc_5_2_D,Acc_5_2];
disp(D52)
disp('_____________________________________________________')
disp('')

disp('Feat = raw, Input Dims = [17 22], kNN = 5')
disp('      A         B         C         D      overall')
D53 = [Acc_5_3_A,Acc_5_3_B,Acc_5_3_C,Acc_5_3_D,Acc_5_3];
disp(D53)
disp('_____________________________________________________')
disp('')

disp('Feat = raw, Input Dims = [ 7  9], kNN = 5')
disp('    A     B     C     D   overall')
D54 = [Acc_5_4_A,Acc_5_4_B,Acc_5_4_C,Acc_5_4_D,Acc_5_4];
disp(D54)
disp('_____________________________________________________')
disp('')

disp('Feat = PCA, Input Dims = [90  70], kNN = 5')
disp('      A         B         C         D      overall')
D55 = [Acc_5_f2_A,Acc_5_f2_B,Acc_5_f2_C,Acc_5_f2_D,Acc_5_f2];
disp(D55)
disp('_____________________________________________________')
disp('')

disp('Feat = Random projection, Input Dims = [90  70], kNN = 5')
disp('    A     B     C     D   overall')
D56 = [Acc_5_f3_A,Acc_5_f3_B,Acc_5_f3_C,Acc_5_f3_D,Acc_5_f3];
disp(D56)
disp('_____________________________________________________')
disp('')