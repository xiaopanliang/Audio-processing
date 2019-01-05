

%=========================Read in data===================================

%-------------------------trainspeech------------------------------------
function run(datadir)
datadir_trs = fullfile(datadir,'trainspeech');
data_trs = dir(datadir_trs);
files_trs = cell(length(data_trs),1);
audio_traindata = zeros (10000,60);
for i = 4:length(files_trs)
    filename=strcat(data_trs(i).name);
    %disp(filename);
    files_trs = audioread(fullfile(datadir_trs,filename));
    data_b = imresize(files_trs(:,1),[10000 ,1]);
    audio_traindata(:,i-3)=data_b;
end

audio_traindata_A = audio_traindata(:,1:15);
audio_traindata_B = audio_traindata(:,16:30);
audio_traindata_C = audio_traindata(:,31:45);
audio_traindata_D = audio_traindata(:,46:60);

%----------------------------testspeech------------------------------------
datadir_tes = fullfile(datadir,'testspeech');
data_tes = dir(datadir_tes);
files_tes = cell(length(data_tes),1);
audio_testdata = zeros (10001,40);
for i = 4:length(files_tes)
    filename=strcat(data_tes(i).name);
    %disp(filename);
    files_tes = audioread(fullfile(datadir_tes,filename));
    data_b = imresize(files_tes(:,1),[10000 ,1]);
    audio_testdata(1:10000,i-3)=data_b;
end

audio_testdata(10001,1:10) = ones(1,10);
audio_testdata(10001,11:20) = ones(1,10)*2;
audio_testdata(10001,21:30) = ones(1,10)*3;
audio_testdata(10001,31:40) = ones(1,10)*4;
%==========================================================================

%======================feature vector cepstrum=============================
%training speech data train GMM
ceps_A = zeros(12,330);
ceps_B = zeros(12,330);
ceps_C = zeros(12,330);
ceps_D = zeros(12,330);

for i = 1:15
    signal_A = audio_traindata_A(1:10000,i);
    ceps_A_train_c = cepstrum(signal_A, 12, 500, 50);
    ceps_A(:,((i-1)*22+1):((i-1)*22+22)) = ceps_A_train_c; %X [D = 12 x N =330]
    
    signal_B = audio_traindata_B(1:10000,i);
    ceps_B_train_c = cepstrum(signal_B, 12, 500, 50);
    ceps_B(:,((i-1)*22+1):((i-1)*22+22)) = ceps_B_train_c; %X [D = 12 x N =330]
    
    signal_C = audio_traindata_C(1:10000,i);
    ceps_C_train_c = cepstrum(signal_C, 12, 500, 50);
    ceps_C(:,((i-1)*22+1):((i-1)*22+22)) = ceps_C_train_c; %X [D = 12 x N =330]
    
    signal_D = audio_traindata_D(1:10000,i);
    ceps_D_train_c = cepstrum(signal_D, 12, 500, 50);
    ceps_D(:,((i-1)*22+1):((i-1)*22+22)) = ceps_D_train_c; %X [D = 12 x N =330]
   
end

%==========================GMM and accuracy calculation======================
GMM_A = gmm_train (ceps_A', 2);
GMM_B = gmm_train (ceps_B', 2);
GMM_C = gmm_train (ceps_C', 2);
GMM_D = gmm_train (ceps_D', 2);

Error_aud = 0;
Error_aud_A = 0;
Error_aud_B = 0;
Error_aud_C = 0;
Error_aud_D = 0;
A = zeros(4,40);
B = zeros(1,40);

%test speech data
LL_speaker = zeros(4,40);
for i = 1:40
    
    signal = audio_testdata(1:10000,i);
    ceps_test = cepstrum(signal, 12, 500, 50);
    True_label = audio_testdata(10001,i);
    
    LL_A = gmm_eval (ceps_test' , GMM_A);
    LL_B = gmm_eval (ceps_test' , GMM_B);
    LL_C = gmm_eval (ceps_test' , GMM_C);
    LL_D = gmm_eval (ceps_test' , GMM_D);
    
    R = [LL_A; LL_B; LL_C; LL_D];
    LL_speaker(:,i) = R;
    [R_1, idx] = sort(R, 1);
    A(:,i) = R_1';
    predict_label = idx(4,:);
    B(:,i) = predict_label;
    
    if predict_label == True_label
        Error_aud = Error_aud + 0;
    else
        if True_label == 1
        Error_aud_A = Error_aud_A + 1;
        elseif True_label == 2
        Error_aud_B = Error_aud_B + 1;
        elseif True_label == 3
        Error_aud_C = Error_aud_C + 1;
        else
        Error_aud_D = Error_aud_D + 1;
        end
        Error_aud = Error_aud_A + Error_aud_B + Error_aud_C + Error_aud_D;
    end
end

ACC_aud_A = ((10-Error_aud_A) * 100 )/ 10;
ACC_aud_B = ((10-Error_aud_B) * 100 )/ 10;
ACC_aud_C = ((10-Error_aud_C) * 100 )/ 10;
ACC_aud_D = ((10-Error_aud_D) * 100 )/ 10;
ACC_aud = ((40-Error_aud) * 100 )/ 40;
%===============================Prepare for AV===============================
LL_speaker_A = exp(LL_speaker(:,1:10));
LL_speaker_B = exp(LL_speaker(:,11:20));
LL_speaker_C = exp(LL_speaker(:,21:30));
LL_speaker_D = exp(LL_speaker(:,31:40));

%===========================================================================


%================================Visual=====================================
%===========================Read in image data==============================
datadir_tri = fullfile(datadir,'trainimg');
data_tri = dir(datadir_tri);
files_tri = cell(length(data_tri),1);
img_traindata_raw = zeros (6301,40);
img_pca_1 = zeros(6301,80);
for i = 4:(length(files_tri)-1)
    filename=strcat(data_tri(i).name);
    %disp(filename);
    files_tri = imread(fullfile(datadir_tri,filename));
    img_0 = double(rgb2gray(files_tri));
    img_b = reshape(img_0,[6300,1]);
    img_traindata_raw(1:6300,i-3)=img_b;
end

img_traindata_raw(6301,1:10) = ones(1,10);
img_traindata_raw(6301,11:20) = ones(1,10)*2;
img_traindata_raw(6301,21:30) = ones(1,10)*3;
img_traindata_raw(6301,31:40) = ones(1,10)*4;

img_pca_1(:,41:80) = img_traindata_raw;

%----------------------------testimg------------------------------------
datadir_tei = fullfile(datadir,'testimg');
data_tei = dir(datadir_tei);
files_tei = cell(length(data_tei),1);
img_testdata_raw = zeros (6301,40);

for i = 4:(length(files_tei)-1)
    filename=strcat(data_tei(i).name);
    %disp(filename);
    files_tei = imread(fullfile(datadir_tei,filename));
    img_0 = double(rgb2gray(files_tei));
    img_b = reshape(img_0,[6300,1]);
    img_testdata_raw(1:6300,i-3)=img_b;
end

img_testdata_raw(6301,1:10) = ones(1,10);
img_testdata_raw(6301,11:20) = ones(1,10)*2;
img_testdata_raw(6301,21:30) = ones(1,10)*3;
img_testdata_raw(6301,31:40) = ones(1,10)*4;

%=========================PCA feature extraction===========================
img_pca_1(:,1:40) = img_testdata_raw;
img_pca = img_pca_1(1:6300,:);

img_traindata = zeros(69,40);
img_testdata = zeros(69,40);
[img_traindata_1,Ntr,terrortr,rerrortr]  = PCA(img_pca,0.95);

%======================KNN and accuracy calculation========================
img_traindata(1:68,:) = img_traindata_1(:,41:80);
img_traindata(69,:) = img_pca_1(6301,41:80);
img_testdata(1:68,:) = img_traindata_1(:,1:40);
img_testdata(69,:) = img_pca_1(6301,1:40);

Error_img = 0;
Error_img_A = 0;
Error_img_B = 0;
Error_img_C = 0;
Error_img_D = 0;

Pt_visual = zeros(4,40);
for i = 1:40
    inx = img_testdata(1:68,i);
    T_label = img_testdata(69,i);
    data = img_traindata(1:68,:);
    labels = img_traindata(69,:);
    
    [found_label,PP] = KNN(inx,data,labels,10);
    Pt_visual(:,i) = PP;
    if found_label == T_label
        Error_img = Error_img + 0;
    else
        if T_label == 1
        Error_img_A = Error_img_A + 1;
        elseif T_label == 2
        Error_img_B = Error_img_B + 1;
        elseif T_label == 3
        Error_img_C = Error_img_C + 1;
        else 
        Error_img_D = Error_img_D + 1;
        end
        Error_img = Error_img_A + Error_img_B + Error_img_C +Error_img_D;
    end
end

ACC_img_A = ((10-Error_img_A) * 100 )/ 10;
ACC_img_B = ((10-Error_img_B) * 100 )/ 10;
ACC_img_C = ((10-Error_img_C) * 100 )/ 10;
ACC_img_D = ((10-Error_img_D) * 100 )/ 10;
ACC_img = ((40-Error_img) * 100 )/ 40;

%============================Prepare for AV================================
Pt_visual_A = Pt_visual(:,1:10);
Pt_visual_B = Pt_visual(:,11:20);
Pt_visual_C = Pt_visual(:,21:30);
Pt_visual_D = Pt_visual(:,31:40);
%==========================================================================

%%==========================AV feature matrix==============================
AV_A_01 = zeros(4,100);
AV_A_02 = zeros(4,100);
AV_A_03 = zeros(4,100);
AV_A_04 = zeros(4,100);
AV_A_05 = zeros(4,100);
AV_A_06 = zeros(4,100);
AV_A_07 = zeros(4,100);
AV_A_08 = zeros(4,100);
AV_A_09 = zeros(4,100);

AV_B_01 = zeros(4,100);
AV_B_02 = zeros(4,100);
AV_B_03 = zeros(4,100);
AV_B_04 = zeros(4,100);
AV_B_05 = zeros(4,100);
AV_B_06 = zeros(4,100);
AV_B_07 = zeros(4,100);
AV_B_08 = zeros(4,100);
AV_B_09 = zeros(4,100);

AV_C_01 = zeros(4,100);
AV_C_02 = zeros(4,100);
AV_C_03 = zeros(4,100);
AV_C_04 = zeros(4,100);
AV_C_05 = zeros(4,100);
AV_C_06 = zeros(4,100);
AV_C_07 = zeros(4,100);
AV_C_08 = zeros(4,100);
AV_C_09 = zeros(4,100);

AV_D_01 = zeros(4,100);
AV_D_02 = zeros(4,100);
AV_D_03 = zeros(4,100);
AV_D_04 = zeros(4,100);
AV_D_05 = zeros(4,100);
AV_D_06 = zeros(4,100);
AV_D_07 = zeros(4,100);
AV_D_08 = zeros(4,100);
AV_D_09 = zeros(4,100);

for i = 1:10
    AV_speaker_A = LL_speaker_A(:,i);
    AV_speaker_B = LL_speaker_B(:,i);
    AV_speaker_C = LL_speaker_C(:,i);
    AV_speaker_D = LL_speaker_D(:,i);
    for j = 1:10
        AV_visual_A = Pt_visual_A(:,j);
        AV_visual_B = Pt_visual_B(:,j);
        AV_visual_C = Pt_visual_C(:,j);
        AV_visual_D = Pt_visual_D(:,j);
        col = (i-1)*10+j;
        
        speaker_A_1 = AV_speaker_A.^ 0.1;
        visual_A_1 = AV_visual_A.^ 0.9;
        AV_A_01(:,col) = speaker_A_1 .* visual_A_1;
        speaker_A_2 = AV_speaker_A.^ 0.2;
        visual_A_2 = AV_visual_A.^ 0.8;
        AV_A_02(:,col) = speaker_A_2 .* visual_A_2;
        speaker_A_3 = AV_speaker_A.^ 0.3;
        visual_A_3 = AV_visual_A.^ 0.7;
        AV_A_03(:,col) = speaker_A_3 .* visual_A_3;
        speaker_A_4 = AV_speaker_A.^ 0.4;
        visual_A_4 = AV_visual_A.^ 0.6;
        AV_A_04(:,col) = speaker_A_4 .* visual_A_4;
        speaker_A_5 = AV_speaker_A.^ 0.5;
        visual_A_5 = AV_visual_A.^ 0.5;
        AV_A_05(:,col) = speaker_A_5 .* visual_A_5;
        speaker_A_6 = AV_speaker_A.^ 0.6;
        visual_A_6 = AV_visual_A.^ 0.4;
        AV_A_06(:,col) = speaker_A_6 .* visual_A_6;
        speaker_A_7 = AV_speaker_A.^ 0.7;
        visual_A_7 = AV_visual_A.^ 0.3;
        AV_A_07(:,col) = speaker_A_7 .* visual_A_7;
        speaker_A_8 = AV_speaker_A.^ 0.8;
        visual_A_8 = AV_visual_A.^ 0.2;
        AV_A_08(:,col) = speaker_A_8 .* visual_A_8;
        speaker_A_9 = AV_speaker_A.^ 0.9;
        visual_A_9 = AV_visual_A.^ 0.1;
        AV_A_09(:,col) = speaker_A_9 .* visual_A_9;
        
        speaker_B_1 = AV_speaker_B.^ 0.1;
        visual_B_1 = AV_visual_B.^ 0.9;
        AV_B_01(:,col) = speaker_B_1 .* visual_B_1;
        speaker_B_2 = AV_speaker_B.^ 0.2;
        visual_B_2 = AV_visual_B.^ 0.8;
        AV_B_02(:,col) = speaker_B_2 .* visual_B_2;
        speaker_B_3 = AV_speaker_B.^ 0.3;
        visual_B_3 = AV_visual_B.^ 0.7;
        AV_B_03(:,col) = speaker_B_3 .* visual_B_3;
        speaker_B_4 = AV_speaker_B .^ 0.4;
        visual_B_4 = AV_visual_B.^ 0.6;
        AV_B_04(:,col) = speaker_B_4 .* visual_B_4;
        speaker_B_5 = AV_speaker_B.^ 0.5;
        visual_B_5 = AV_visual_B.^ 0.5;
        AV_B_05(:,col) = speaker_B_5 .* visual_B_5;
        speaker_B_6 = AV_speaker_B.^ 0.6;
        visual_B_6 = AV_visual_B.^ 0.4;
        AV_B_06(:,col) = speaker_B_6 .* visual_B_6;
        speaker_B_7 = AV_speaker_B.^ 0.7;
        visual_B_7 = AV_visual_B.^ 0.3;
        AV_B_07(:,col) = speaker_B_7 .* visual_B_7;
        speaker_B_8 = AV_speaker_B.^ 0.8;
        visual_B_8 = AV_visual_B.^ 0.2;
        AV_B_08(:,col) = speaker_B_8 .* visual_B_8;
        speaker_B_9 = AV_speaker_B.^ 0.9;
        visual_B_9 = AV_visual_B.^ 0.1;
        AV_B_09(:,col) = speaker_B_9 .* visual_B_9;
        
        speaker_C_1 = AV_speaker_C.^ 0.1;
        visual_C_1 = AV_visual_C.^ 0.9;
        AV_C_01(:,col) = speaker_C_1 .* visual_C_1;
        speaker_C_2 = AV_speaker_C.^ 0.2;
        visual_C_2 = AV_visual_C.^ 0.8;
        AV_C_02(:,col) = speaker_C_2 .* visual_C_2;
        speaker_C_3 = AV_speaker_C.^ 0.3;
        visual_C_3 = AV_visual_C.^ 0.7;
        AV_C_03(:,col) = speaker_C_3 .* visual_C_3;
        speaker_C_4 = AV_speaker_C .^ 0.4;
        visual_C_4 = AV_visual_C.^ 0.6;
        AV_C_04(:,col) = speaker_C_4 .* visual_C_4;
        speaker_C_5 = AV_speaker_C.^ 0.5;
        visual_C_5 = AV_visual_C.^ 0.5;
        AV_C_05(:,col) = speaker_C_5 .* visual_C_5;
        speaker_C_6 = AV_speaker_C.^ 0.6;
        visual_C_6 = AV_visual_C.^ 0.4;
        AV_C_06(:,col) = speaker_C_6 .* visual_C_6;
        speaker_C_7 = AV_speaker_C.^ 0.7;
        visual_C_7 = AV_visual_C.^ 0.3;
        AV_C_07(:,col) = speaker_C_7 .* visual_C_7;
        speaker_C_8 = AV_speaker_C.^ 0.8;
        visual_C_8 = AV_visual_C.^ 0.2;
        AV_C_08(:,col) = speaker_C_8 .* visual_C_8;
        speaker_C_9 = AV_speaker_C.^ 0.9;
        visual_C_9 = AV_visual_C.^ 0.1;
        AV_C_09(:,col) = speaker_C_9 .* visual_C_9;
        
        speaker_D_1 = AV_speaker_D.^ 0.1;
        visual_D_1 = AV_visual_D.^ 0.9;
        AV_D_01(:,col) = speaker_D_1 .* visual_D_1;
                speaker_D_2 = AV_speaker_D.^ 0.2;
        visual_D_2 = AV_visual_D.^ 0.8;
        AV_D_02(:,col) = speaker_D_2 .* visual_D_2;
        speaker_D_3 = AV_speaker_D.^ 0.3;
        visual_D_3 = AV_visual_D.^ 0.7;
        AV_D_03(:,col) = speaker_D_3 .* visual_D_3;
        speaker_D_4 = AV_speaker_D .^ 0.4;
        visual_D_4 = AV_visual_D.^ 0.6;
        AV_D_04(:,col) = speaker_D_4 .* visual_D_4;
        speaker_D_5 = AV_speaker_D.^ 0.5;
        visual_D_5 = AV_visual_D.^ 0.5;
        AV_D_05(:,col) = speaker_D_5 .* visual_D_5;
        speaker_D_6 = AV_speaker_D.^ 0.6;
        visual_D_6 = AV_visual_D.^ 0.4;
        AV_D_06(:,col) = speaker_D_6 .* visual_D_6;
        speaker_D_7 = AV_speaker_D.^ 0.7;
        visual_D_7 = AV_visual_D.^ 0.3;
        AV_D_07(:,col) = speaker_D_7 .* visual_D_7;
        speaker_D_8 = AV_speaker_D.^ 0.8;
        visual_D_8 = AV_visual_D.^ 0.2;
        AV_D_08(:,col) = speaker_D_8 .* visual_D_8;
        speaker_D_9 = AV_speaker_D.^ 0.9;
        visual_D_9 = AV_visual_D.^ 0.1;
        AV_D_09(:,col) = speaker_D_9 .* visual_D_9;
        
    end
end


Error_AV_A_1 = 0;
[AV_sort_A_1, AV_ind_A_1] = sort(AV_A_01,'descend');
Error_AV_A_2 = 0;
[AV_sort_A_2, AV_ind_A_2] = sort(AV_A_02,'descend');
Error_AV_A_3 = 0;
[AV_sort_A_3, AV_ind_A_3] = sort(AV_A_03,'descend');
Error_AV_A_4 = 0;
[AV_sort_A_4, AV_ind_A_4] = sort(AV_A_04,'descend');
Error_AV_A_5 = 0;
[AV_sort_A_5, AV_ind_A_5] = sort(AV_A_05,'descend');
Error_AV_A_6 = 0;
[AV_sort_A_6, AV_ind_A_6] = sort(AV_A_06,'descend');
Error_AV_A_7 = 0;
[AV_sort_A_7, AV_ind_A_7] = sort(AV_A_07,'descend');
Error_AV_A_8 = 0;
[AV_sort_A_8, AV_ind_A_8] = sort(AV_A_08,'descend');
Error_AV_A_9 = 0;
[AV_sort_A_9, AV_ind_A_9] = sort(AV_A_09,'descend');

for i = 1:100
    Av_ind_A_1_pred = AV_ind_A_1(1,i);
    if Av_ind_A_1_pred == 1
        Error_AV_A_1 = Error_AV_A_1 + 0;
    else
        Error_AV_A_1 = Error_AV_A_1 + 1;
    end
end
ACC_AV_A_1 = 100 - Error_AV_A_1;

for i = 1:100
    Av_ind_A_2_pred = AV_ind_A_2(1,i);
    if Av_ind_A_2_pred == 1
        Error_AV_A_2 = Error_AV_A_2 + 0;
    else
        Error_AV_A_2 = Error_AV_A_2 + 1;
    end
end
ACC_AV_A_2 = 100 - Error_AV_A_2;

for i = 1:100
    Av_ind_A_3_pred = AV_ind_A_3(1,i);
    if Av_ind_A_3_pred == 1
        Error_AV_A_3 = Error_AV_A_3 + 0;
    else
        Error_AV_A_3 = Error_AV_A_3 + 1;
    end
end
ACC_AV_A_3 = 100 - Error_AV_A_3;

for i = 1:100
    Av_ind_A_4_pred = AV_ind_A_4(1,i);
    if Av_ind_A_4_pred == 1
        Error_AV_A_4 = Error_AV_A_4 + 0;
    else
        Error_AV_A_4 = Error_AV_A_4 + 1;
    end
end
ACC_AV_A_4 = 100 - Error_AV_A_4;

for i = 1:100
    Av_ind_A_5_pred = AV_ind_A_5(1,i);
    if Av_ind_A_5_pred == 1
        Error_AV_A_5 = Error_AV_A_5 + 0;
    else
        Error_AV_A_5 = Error_AV_A_5 + 1;
    end
end
ACC_AV_A_5 = 100 - Error_AV_A_5;

for i = 1:100
    Av_ind_A_6_pred = AV_ind_A_6(1,i);
    if Av_ind_A_6_pred == 1
        Error_AV_A_6 = Error_AV_A_6 + 0;
    else
        Error_AV_A_6 = Error_AV_A_6 + 1;
    end
end
ACC_AV_A_6 = 100 - Error_AV_A_6;

for i = 1:100
    Av_ind_A_7_pred = AV_ind_A_7(1,i);
    if Av_ind_A_7_pred == 1
        Error_AV_A_7 = Error_AV_A_7 + 0;
    else
        Error_AV_A_7 = Error_AV_A_7 + 1;
    end
end
ACC_AV_A_7 = 100 - Error_AV_A_7;

for i = 1:100
    Av_ind_A_8_pred = AV_ind_A_8(1,i);
    if Av_ind_A_8_pred == 1
        Error_AV_A_8 = Error_AV_A_8 + 0;
    else
        Error_AV_A_8 = Error_AV_A_8 + 1;
    end
end
ACC_AV_A_8 = 100 - Error_AV_A_8;

for i = 1:100
    Av_ind_A_9_pred = AV_ind_A_9(1,i);
    if Av_ind_A_9_pred == 1
        Error_AV_A_9 = Error_AV_A_9 + 0;
    else
        Error_AV_A_9 = Error_AV_A_9 + 1;
    end
end
ACC_AV_A_9 = 100 - Error_AV_A_9;     



Error_AV_B_1 = 0;
[AV_sort_B_1, AV_ind_B_1] = sort(AV_B_01,'descend');
Error_AV_B_2 = 0;
[AV_sort_B_2, AV_ind_B_2] = sort(AV_B_02,'descend');
Error_AV_B_3 = 0;
[AV_sort_B_3, AV_ind_B_3] = sort(AV_B_03,'descend');
Error_AV_B_4 = 0;
[AV_sort_B_4, AV_ind_B_4] = sort(AV_B_04,'descend');
Error_AV_B_5 = 0;
[AV_sort_B_5, AV_ind_B_5] = sort(AV_B_05,'descend');
Error_AV_B_6 = 0;
[AV_sort_B_6, AV_ind_B_6] = sort(AV_B_06,'descend');
Error_AV_B_7 = 0;
[AV_sort_B_7, AV_ind_B_7] = sort(AV_B_07,'descend');
Error_AV_B_8 = 0;
[AV_sort_B_8, AV_ind_B_8] = sort(AV_B_08,'descend');
Error_AV_B_9 = 0;
[AV_sort_B_9, AV_ind_B_9] = sort(AV_B_09,'descend');

for i = 1:100
    Av_ind_B_1_pred = AV_ind_B_1(1,i);
    if Av_ind_B_1_pred == 2
        Error_AV_B_1 = Error_AV_B_1 + 0;
    else
        Error_AV_B_1 = Error_AV_B_1 + 1;
    end
end
ACC_AV_B_1 = 100 - Error_AV_B_1;

for i = 1:100
    Av_ind_B_2_pred = AV_ind_B_2(1,i);
    if Av_ind_B_2_pred == 2
        Error_AV_B_2 = Error_AV_B_2 + 0;
    else
        Error_AV_B_2 = Error_AV_B_2 + 1;
    end
end
ACC_AV_B_2 = 100 - Error_AV_B_2;

for i = 1:100
    Av_ind_B_3_pred = AV_ind_B_3(1,i);
    if Av_ind_B_3_pred == 2
        Error_AV_B_3 = Error_AV_B_3 + 0;
    else
        Error_AV_B_3 = Error_AV_B_3 + 1;
    end
end
ACC_AV_B_3 = 100 - Error_AV_B_3;

for i = 1:100
    Av_ind_B_4_pred = AV_ind_B_4(1,i);
    if Av_ind_B_4_pred == 2
        Error_AV_B_4 = Error_AV_B_4 + 0;
    else
        Error_AV_B_4 = Error_AV_B_4 + 1;
    end
end
ACC_AV_B_4 = 100 - Error_AV_B_4;

for i = 1:100
    Av_ind_B_5_pred = AV_ind_B_5(1,i);
    if Av_ind_B_5_pred == 2
        Error_AV_B_5 = Error_AV_B_5 + 0;
    else
        Error_AV_B_5 = Error_AV_B_5 + 1;
    end
end
ACC_AV_B_5 = 100 - Error_AV_B_5;

for i = 1:100
    Av_ind_B_6_pred = AV_ind_B_6(1,i);
    if Av_ind_B_6_pred == 2
        Error_AV_B_6 = Error_AV_B_6 + 0;
    else
        Error_AV_B_6 = Error_AV_B_6 + 1;
    end
end
ACC_AV_B_6 = 100 - Error_AV_B_6;

for i = 1:100
    Av_ind_B_7_pred = AV_ind_B_7(1,i);
    if Av_ind_B_7_pred == 2
        Error_AV_B_7 = Error_AV_B_7 + 0;
    else
        Error_AV_B_7 = Error_AV_B_7 + 1;
    end
end
ACC_AV_B_7 = 100 - Error_AV_B_7;

for i = 1:100
    Av_ind_B_8_pred = AV_ind_B_8(1,i);
    if Av_ind_B_8_pred == 2
        Error_AV_B_8 = Error_AV_B_8 + 0;
    else
        Error_AV_B_8 = Error_AV_B_8 + 1;
    end
end
ACC_AV_B_8 = 100 - Error_AV_B_8;

for i = 1:100
    Av_ind_B_9_pred = AV_ind_B_9(1,i);
    if Av_ind_B_9_pred == 2
        Error_AV_B_9 = Error_AV_B_9 + 0;
    else
        Error_AV_B_9 = Error_AV_B_9 + 1;
    end
end
ACC_AV_B_9 = 100 - Error_AV_B_9;  



Error_AV_C_1 = 0;
[AV_sort_C_1, AV_ind_C_1] = sort(AV_C_01,'descend');
Error_AV_C_2 = 0;
[AV_sort_C_2, AV_ind_C_2] = sort(AV_C_02,'descend');
Error_AV_C_3 = 0;
[AV_sort_C_3, AV_ind_C_3] = sort(AV_C_03,'descend');
Error_AV_C_4 = 0;
[AV_sort_C_4, AV_ind_C_4] = sort(AV_C_04,'descend');
Error_AV_C_5 = 0;
[AV_sort_C_5, AV_ind_C_5] = sort(AV_C_05,'descend');
Error_AV_C_6 = 0;
[AV_sort_C_6, AV_ind_C_6] = sort(AV_C_06,'descend');
Error_AV_C_7 = 0;
[AV_sort_C_7, AV_ind_C_7] = sort(AV_C_07,'descend');
Error_AV_C_8 = 0;
[AV_sort_C_8, AV_ind_C_8] = sort(AV_C_08,'descend');
Error_AV_C_9 = 0;
[AV_sort_C_9, AV_ind_C_9] = sort(AV_C_09,'descend');

for i = 1:100
    Av_ind_C_1_pred = AV_ind_C_1(1,i);
    if Av_ind_C_1_pred == 3
        Error_AV_C_1 = Error_AV_C_1 + 0;
    else
        Error_AV_C_1 = Error_AV_C_1 + 1;
    end
end
ACC_AV_C_1 = 100 - Error_AV_C_1;

for i = 1:100
    Av_ind_C_2_pred = AV_ind_C_2(1,i);
    if Av_ind_C_2_pred == 3
        Error_AV_C_2 = Error_AV_C_2 + 0;
    else
        Error_AV_C_2 = Error_AV_C_2 + 1;
    end
end
ACC_AV_C_2 = 100 - Error_AV_C_2;

for i = 1:100
    Av_ind_C_3_pred = AV_ind_C_3(1,i);
    if Av_ind_C_3_pred == 3
        Error_AV_C_3 = Error_AV_C_3 + 0;
    else
        Error_AV_C_3 = Error_AV_C_3 + 1;
    end
end
ACC_AV_C_3 = 100 - Error_AV_C_3;

for i = 1:100
    Av_ind_C_4_pred = AV_ind_C_4(1,i);
    if Av_ind_C_4_pred == 3
        Error_AV_C_4 = Error_AV_C_4 + 0;
    else
        Error_AV_C_4 = Error_AV_C_4 + 1;
    end
end
ACC_AV_C_4 = 100 - Error_AV_C_4;

for i = 1:100
    Av_ind_C_5_pred = AV_ind_C_5(1,i);
    if Av_ind_C_5_pred == 3
        Error_AV_C_5 = Error_AV_C_5 + 0;
    else
        Error_AV_C_5 = Error_AV_C_5 + 1;
    end
end
ACC_AV_C_5 = 100 - Error_AV_C_5;

for i = 1:100
    Av_ind_C_6_pred = AV_ind_C_6(1,i);
    if Av_ind_C_6_pred == 3
        Error_AV_C_6 = Error_AV_C_6 + 0;
    else
        Error_AV_C_6 = Error_AV_C_6 + 1;
    end
end
ACC_AV_C_6 = 100 - Error_AV_C_6;

for i = 1:100
    Av_ind_C_7_pred = AV_ind_C_7(1,i);
    if Av_ind_C_7_pred == 3
        Error_AV_C_7 = Error_AV_C_7 + 0;
    else
        Error_AV_C_7 = Error_AV_C_7 + 1;
    end
end
ACC_AV_C_7 = 100 - Error_AV_C_7;

for i = 1:100
    Av_ind_C_8_pred = AV_ind_C_8(1,i);
    if Av_ind_C_8_pred == 3
        Error_AV_C_8 = Error_AV_C_8 + 0;
    else
        Error_AV_C_8 = Error_AV_C_8 + 1;
    end
end
ACC_AV_C_8 = 100 - Error_AV_C_8;

for i = 1:100
    Av_ind_C_9_pred = AV_ind_C_9(1,i);
    if Av_ind_C_9_pred == 3
        Error_AV_C_9 = Error_AV_C_9 + 0;
    else
        Error_AV_C_9 = Error_AV_C_9 + 1;
    end
end
ACC_AV_C_9 = 100 - Error_AV_C_9;  



Error_AV_D_1 = 0;
[AV_sort_D_1, AV_ind_D_1] = sort(AV_D_01,'descend');
Error_AV_D_2 = 0;
[AV_sort_D_2, AV_ind_D_2] = sort(AV_D_02,'descend');
Error_AV_D_3 = 0;
[AV_sort_D_3, AV_ind_D_3] = sort(AV_D_03,'descend');
Error_AV_D_4 = 0;
[AV_sort_D_4, AV_ind_D_4] = sort(AV_D_04,'descend');
Error_AV_D_5 = 0;
[AV_sort_D_5, AV_ind_D_5] = sort(AV_D_05,'descend');
Error_AV_D_6 = 0;
[AV_sort_D_6, AV_ind_D_6] = sort(AV_D_06,'descend');
Error_AV_D_7 = 0;
[AV_sort_D_7, AV_ind_D_7] = sort(AV_D_07,'descend');
Error_AV_D_8 = 0;
[AV_sort_D_8, AV_ind_D_8] = sort(AV_D_08,'descend');
Error_AV_D_9 = 0;
[AV_sort_D_9, AV_ind_D_9] = sort(AV_D_09,'descend');

for i = 1:100
    Av_ind_D_1_pred = AV_ind_D_1(1,i);
    if Av_ind_D_1_pred == 4
        Error_AV_D_1 = Error_AV_D_1 + 0;
    else
        Error_AV_D_1 = Error_AV_D_1 + 1;
    end
end
ACC_AV_D_1 = 100 - Error_AV_D_1;

for i = 1:100
    Av_ind_D_2_pred = AV_ind_D_2(1,i);
    if Av_ind_D_2_pred == 4
        Error_AV_D_2 = Error_AV_D_2 + 0;
    else
        Error_AV_D_2 = Error_AV_D_2 + 1;
    end
end
ACC_AV_D_2 = 100 - Error_AV_D_2;

for i = 1:100
    Av_ind_D_3_pred = AV_ind_D_3(1,i);
    if Av_ind_D_3_pred == 4
        Error_AV_D_3 = Error_AV_D_3 + 0;
    else
        Error_AV_D_3 = Error_AV_D_3 + 1;
    end
end
ACC_AV_D_3 = 100 - Error_AV_D_3;

for i = 1:100
    Av_ind_D_4_pred = AV_ind_D_4(1,i);
    if Av_ind_D_4_pred == 4
        Error_AV_D_4 = Error_AV_D_4 + 0;
    else
        Error_AV_D_4 = Error_AV_D_4 + 1;
    end
end
ACC_AV_D_4 = 100 - Error_AV_D_4;

for i = 1:100
    Av_ind_D_5_pred = AV_ind_D_5(1,i);
    if Av_ind_D_5_pred == 4
        Error_AV_D_5 = Error_AV_D_5 + 0;
    else
        Error_AV_D_5 = Error_AV_D_5 + 1;
    end
end
ACC_AV_D_5 = 100 - Error_AV_D_5;

for i = 1:100
    Av_ind_D_6_pred = AV_ind_D_6(1,i);
    if Av_ind_D_6_pred == 4
        Error_AV_D_6 = Error_AV_D_6 + 0;
    else
        Error_AV_D_6 = Error_AV_D_6 + 1;
    end
end
ACC_AV_D_6 = 100 - Error_AV_D_6;

for i = 1:100
    Av_ind_D_7_pred = AV_ind_D_7(1,i);
    if Av_ind_D_7_pred == 4
        Error_AV_D_7 = Error_AV_D_7 + 0;
    else
        Error_AV_D_7 = Error_AV_D_7 + 1;
    end
end
ACC_AV_D_7 = 100 - Error_AV_D_7;

for i = 1:100
    Av_ind_D_8_pred = AV_ind_D_8(1,i);
    if Av_ind_D_8_pred == 4
        Error_AV_D_8 = Error_AV_D_8 + 0;
    else
        Error_AV_D_8 = Error_AV_D_8 + 1;
    end
end
ACC_AV_D_8 = 100 - Error_AV_D_8;

for i = 1:100
    Av_ind_D_9_pred = AV_ind_D_9(1,i);
    if Av_ind_D_9_pred == 4
        Error_AV_D_9 = Error_AV_D_9 + 0;
    else
        Error_AV_D_9 = Error_AV_D_9 + 1;
    end
end
ACC_AV_D_9 = 100 - Error_AV_D_9;  


Acc_aud_P = [ACC_aud_A; ACC_aud_B; ACC_aud_C; ACC_aud_D; ACC_aud];

fprintf('\n--------- Person ID Accuracy: Audio only -----------\n');
array2table(Acc_aud_P, 'VariableNames', {'Acc'}, 'RowNames', {'A','B','C', 'D', 'Avg'})   % Acc = [5 x 9] matrix of accuracies
fprintf('--------------------\n'); 

Acc_img_P = [ACC_img_A; ACC_img_B; ACC_img_C; ACC_img_D; ACC_img];

fprintf('\n--------- Person ID Accuracy: Visual only -----------\n');
array2table(Acc_img_P, 'VariableNames', {'Acc'}, 'RowNames', {'A','B','C', 'D', 'Avg'})   % Acc = [5 x 9] matrix of accuracies
fprintf('--------------------\n'); 

ACC_AV_A = [ACC_AV_A_1,ACC_AV_A_2,ACC_AV_A_3,ACC_AV_A_4,ACC_AV_A_5,ACC_AV_A_6,ACC_AV_A_7,ACC_AV_A_8,ACC_AV_A_9];
ACC_AV_B = [ACC_AV_B_1,ACC_AV_B_2,ACC_AV_B_3,ACC_AV_B_4,ACC_AV_B_5,ACC_AV_B_6,ACC_AV_B_7,ACC_AV_B_8,ACC_AV_B_9];
ACC_AV_C = [ACC_AV_C_1,ACC_AV_C_2,ACC_AV_C_3,ACC_AV_C_4,ACC_AV_C_5,ACC_AV_C_6,ACC_AV_C_7,ACC_AV_C_8,ACC_AV_C_9];
ACC_AV_D = [ACC_AV_D_1,ACC_AV_D_2,ACC_AV_D_3,ACC_AV_D_4,ACC_AV_D_5,ACC_AV_D_6,ACC_AV_D_7,ACC_AV_D_8,ACC_AV_D_9];

ACC_AV_1 = (ACC_AV_A_1+ACC_AV_B_1+ACC_AV_C_1+ACC_AV_D_1)/4;
ACC_AV_2 = (ACC_AV_A_2+ACC_AV_B_2+ACC_AV_C_2+ACC_AV_D_2)/4;
ACC_AV_3 = (ACC_AV_A_3+ACC_AV_B_3+ACC_AV_C_3+ACC_AV_D_3)/4;
ACC_AV_4 = (ACC_AV_A_4+ACC_AV_B_4+ACC_AV_C_4+ACC_AV_D_4)/4;
ACC_AV_5 = (ACC_AV_A_5+ACC_AV_B_5+ACC_AV_C_5+ACC_AV_D_5)/4;
ACC_AV_6 = (ACC_AV_A_6+ACC_AV_B_6+ACC_AV_C_6+ACC_AV_D_6)/4;
ACC_AV_7 = (ACC_AV_A_7+ACC_AV_B_7+ACC_AV_C_7+ACC_AV_D_7)/4;
ACC_AV_8 = (ACC_AV_A_8+ACC_AV_B_8+ACC_AV_C_8+ACC_AV_D_8)/4;
ACC_AV_9 = (ACC_AV_A_9+ACC_AV_B_9+ACC_AV_C_9+ACC_AV_D_9)/4;

ACC_AV_ave = [ACC_AV_1, ACC_AV_2, ACC_AV_3, ACC_AV_4, ACC_AV_5, ACC_AV_6, ACC_AV_7, ACC_AV_8, ACC_AV_9];
ACC_AV = zeros(5,9);
ACC_AV(1,:) = ACC_AV_A;
ACC_AV(2,:) = ACC_AV_B;
ACC_AV(3,:) = ACC_AV_C;
ACC_AV(4,:) = ACC_AV_D;
ACC_AV(5,:) = ACC_AV_ave;

fprintf('\n--------- Person ID Accuracy: Audio + Visual -----------\n');
array2table(ACC_AV, 'VariableNames', {'w_01', 'w_02', 'w_03', 'w_04' , 'w_05', 'w_06', 'w_07', 'w_08', 'w_09'}, 'RowNames', {'A','B','C', 'D', 'Avg'})   % Acc = [5 x 9] matrix of accuracies
fprintf('--------------------\n'); 

end