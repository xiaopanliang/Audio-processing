%================================Read in data==============================
datadir_all=dir('/Users/mingqindai/Documents/MATLAB/MP5_mingqin2/AV_DATA/*.fea');
Yseq = cell(40,1);
for i=1:length(Yseq)
    filename = strcat(datadir_all(i).name);
    %disp(filename);
    Yseq{i,1} = importdata(filename);
end

% A = Yseq{1};
% B = Yseq(1);
%--------------------------audio and visul for 2 &5------------------------
Yseq_2_aud = cell(10,1);
Yseq_2_vis = cell(10,1);
Yseq_5_aud = cell(10,1);
Yseq_5_vis = cell(10,1);
for i = 1:10
    Yseq_2_aud{i,1} = Yseq{2*i-1};
    Yseq_2_vis{i,1} = Yseq{2*i};
    Yseq_5_aud{i,1} = Yseq{20+2*i-1};
    Yseq_5_vis{i,1} = Yseq{20+2*i};
end
%--------------------------------av for 2 &5-------------------------------
Yseq_2_av{i,1} = cell(10,1);
Yseq_5_av{i,1} = cell(10,1);
for i = 1:10
    aud_2 = Yseq_2_aud{i};
    vis_2 = Yseq_2_vis{i};
    aud_5 = Yseq_5_aud{i};
    vis_5 = Yseq_5_vis{i};
    av_2 = [];
    av_5 = [];
    av_2(:,1:24) = aud_2;
    av_2(:,25:27) = vis_2;
    av_5(:,1:24) = aud_5;
    av_5(:,25:27) = vis_5;
    Yseq_2_av{i,1} = av_2;
    Yseq_5_av{i,1} = av_5;
end
%==========================================================================

N = 5;
Ainit = [0.8,0.2,0,0,0;0,0.8,0.2,0,0;0,0,0.8,0.2,0;0,0,0,0.8,0.2;0,0,0,0,1];

%=========================ACC of audio for 5=============================

Error_5_aud = 0;
for i = 1:10
    %test and train dataset for 2
    Yseq_5_aud_test = Yseq_5_aud{i};
    Yseq_5_aud_train1 = Yseq_5_aud;
    Yseq_5_aud_train1(i,:) = [];
    Yseq_5_aud_train = Yseq_5_aud_train1;
    Yseq_2_aud_train = Yseq_2_aud;
    %train HMM2 & HMM5
    [P0_aud_2,A_aud_2,mu_aud_2,sigma_aud_2] = ghmm_learn(Yseq_2_aud_train,N,Ainit);
    [P0_aud_5,A_aud_5,mu_aud_5,sigma_aud_5] = ghmm_learn(Yseq_5_aud_train,N,Ainit);
    %caculate probability of the given test data belongs to HMM2 & HMM5
    [alpha_aud_2,scale_aud_2] = ghmm_fwd(Yseq_5_aud_test,A_aud_2,P0_aud_2,mu_aud_2,sigma_aud_2);
    P_test_HMM2 = sum(scale_aud_2);
    [alpha_aud_5,scale_aud_5] = ghmm_fwd(Yseq_5_aud_test,A_aud_5,P0_aud_5,mu_aud_5,sigma_aud_5);
    P_test_HMM5 = sum(scale_aud_5);
    %calculate whether it gives the right answer
    if P_test_HMM2 <= P_test_HMM5
        Error_5_aud = Error_5_aud + 0;
    else
        Error_5_aud = Error_5_aud + 1;
    end
end
    
Acc_5_aud = (10 - Error_5_aud)*100/10;  

