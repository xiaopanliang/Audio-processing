

%---------------------- Read in wav file -----------------------------
% raw feature
aud_raw = zeros(10002,100);

% read in A speaker's wav
for i = 1:5
    audionamea = strcat('A',num2str(i),'a','.wav');
    [data,Fs] = audioread(audionamea);
    data_a = imresize(data(:,1),[10000 ,1]);
    aud_raw(1:10000,i) = data_a;
    aud_raw(10002,i) = i;
    
    audionameb = strcat('A',num2str(i),'b','.wav');
    [data,Fs] = audioread(audionameb);
    data_b = imresize(data(:,1),[10000 ,1]);
    aud_raw(1:10000,i+5) = data_b;
    aud_raw(10002,i+5) = i;
    
    audionamec = strcat('A',num2str(i),'c','.wav');
    [data,Fs] = audioread(audionamec);
    data_c = imresize(data(:,1),[10000 ,1]);
    aud_raw(1:10000,i+5*2) = data_c;
    aud_raw(10002,i+5*2) = i;
    
    audionamed = strcat('A',num2str(i),'d','.wav');
    [data,Fs] = audioread(audionamed);
    data_d = imresize(data(:,1),[10000 ,1]);
    aud_raw(1:10000,i+5*3) = data_d;
    aud_raw(10002,i+5*3) = i;
    
    audionamee = strcat('A',num2str(i),'e','.wav');
    [data,Fs] = audioread(audionamee);
    data_e = imresize(data(:,1),[10000 ,1]);
    aud_raw(1:10000,i+5*4) = data_e;
    aud_raw(10002,i+5*4) = i;

end

%label the peaker A as 11
aud_raw(10001,1:25) = ones(1,25)*11;

%read in B speaker's wav
for i = 1:5
    audionamea = strcat('B',num2str(i),'a','.wav');
    [data,Fs] = audioread(audionamea);
    data_a = imresize(data(:,1),[10000 ,1]);
    aud_raw(1:10000,i+5*5) = data_a;
    aud_raw(10002,i+5*5) = i;
    
    audionameb = strcat('B',num2str(i),'b','.wav');
    [data,Fs] = audioread(audionameb);
    data_b = imresize(data(:,1),[10000 ,1]);
    aud_raw(1:10000,i+5*6) = data_b;
    aud_raw(10002,i+5*6) = i;
    
    audionamec = strcat('B',num2str(i),'c','.wav');
    [data,Fs] = audioread(audionamec);
    data_c = imresize(data(:,1),[10000 ,1]);
    aud_raw(1:10000,i+5*7) = data_c;
    aud_raw(10002,i+5*7) = i;
    
    audionamed = strcat('B',num2str(i),'d','.wav');
    [data,Fs] = audioread(audionamed);
    data_d = imresize(data(:,1),[10000 ,1]);
    aud_raw(1:10000,i+5*8) = data_d;
    aud_raw(10002,i+5*8) = i;
    
    audionamee = strcat('B',num2str(i),'e','.wav');
    [data,Fs] = audioread(audionamee);
    data_e = imresize(data(:,1),[10000 ,1]);
    aud_raw(1:10000,i+5*9) = data_e;
    aud_raw(10002,i+5*9) = i;

end

%label the peaker B as 12
aud_raw(10001,26:50) = ones(1,25)*12;

%read in C speaker's wav
for i = 1:5
    audionamea = strcat('C',num2str(i),'a','.wav');
    [data,Fs] = audioread(audionamea);
    data_a = imresize(data(:,1),[10000 ,1]);
    aud_raw(1:10000,i+5*10) = data_a;
    aud_raw(10002,i+5*10) = i;
    
    audionameb = strcat('C',num2str(i),'b','.wav');
    [data,Fs] = audioread(audionameb);
    data_b = imresize(data(:,1),[10000 ,1]);
    aud_raw(1:10000,i+5*11) = data_b;
    aud_raw(10002,i+5*11) = i;
    
    audionamec = strcat('C',num2str(i),'c','.wav');
    [data,Fs] = audioread(audionamec);
    data_c = imresize(data(:,1),[10000 ,1]);
    aud_raw(1:10000,i+5*12) = data_c;
    aud_raw(10002,i+5*12) = i;
    
    audionamed = strcat('C',num2str(i),'d','.wav');
    [data,Fs] = audioread(audionamed);
    data_d = imresize(data(:,1),[10000 ,1]);
    aud_raw(1:10000,i+5*13) = data_d;
    aud_raw(10002,i+5*13) = i;
    
    audionamee = strcat('C',num2str(i),'e','.wav');
    [data,Fs] = audioread(audionamee);
    data_e = imresize(data(:,1),[10000 ,1]);
    aud_raw(1:10000,i+5*14) = data_e;
    aud_raw(10002,i+5*14) = i;

end

%label the peaker C as 13
aud_raw(10001,51:75) = ones(1,25)*13;

%read in D speaker's wav
for i = 1:5
    audionamea = strcat('D',num2str(i),'a','.wav');
    [data,Fs] = audioread(audionamea);
    data_a = imresize(data(:,1),[10000 ,1]);
    aud_raw(1:10000,i+5*15) = data_a;
    aud_raw(10002,i+5*15) = i;
    
    audionameb = strcat('D',num2str(i),'b','.wav');
    [data,Fs] = audioread(audionameb);
    data_b = imresize(data(:,1),[10000 ,1]);
    aud_raw(1:10000,i+5*16) = data_b;
    aud_raw(10002,i+5*16) = i;
    
    audionamec = strcat('D',num2str(i),'c','.wav');
    [data,Fs] = audioread(audionamec);
    data_c = imresize(data(:,1),[10000 ,1]);
    aud_raw(1:10000,i+5*17) = data_c;
    aud_raw(10002,i+5*17) = i;
    
    audionamed = strcat('D',num2str(i),'d','.wav');
    [data,Fs] = audioread(audionamed);
    data_d = imresize(data(:,1),[10000 ,1]);
    aud_raw(1:10000,i+5*18) = data_d;
    aud_raw(10002,i+5*18) = i;
    
    audionamee = strcat('D',num2str(i),'e','.wav');
    [data,Fs] = audioread(audionamee);
    data_e = imresize(data(:,1),[10000 ,1]);
    aud_raw(1:10000,i+5*19) = data_e;
    aud_raw(10002,i+5*19) = i;

end
%label the peaker D as 14
aud_raw(10001,76:100) = ones(1,25)*14;

%raw data used for speaker recognition
aud_raw_speech = aud_raw;

%raw data used for digit recognition
aud_raw_speaker1 = sortrows(aud_raw',10002);
aud_raw_speaker = aud_raw_speaker1';

%SPEECH RECOGNITION-------------KNN & accuracy calculation
%Define Error 
Error_raw_1_1_speech = 0;
Error_raw_1_2_speech = 0;
Error_raw_1_3_speech = 0;
Error_raw_1_4_speech = 0;
Error_raw_1_5_speech = 0;
Error_raw_1_speech = 0;
Error_raw_5_1_speech = 0;
Error_raw_5_2_speech = 0;
Error_raw_5_3_speech = 0;
Error_raw_5_4_speech = 0;
Error_raw_5_5_speech = 0;
Error_raw_5_speech = 0;

%KNN start
for i = 1:100
    inx = aud_raw_speech(1:10000,i);
    speaker_label = aud_raw_speech(10001,i);
    T_speech_label = aud_raw_speech(10002,i);
    aud_data = zeros(10000,75);
    
    if speaker_label == 11
        aud_data = aud_raw_speech(1:10000,26:100);
        speech_label = aud_raw_speech(10002,26:100);
    elseif speaker_label == 12
        aud_data_1 = aud_raw_speech(1:10000,1:25);
        aud_data_2 = aud_raw_speech(1:10000,51:100);
        aud_data(:,1:25) = aud_data_1;
        aud_data(:,26:75) = aud_data_2;
        speech_label_1 = aud_raw_speech(10002,1:25);
        speech_label_2 = aud_raw_speech(10002,51:100);
        speech_label(:,1:25) = speech_label_1;
        speech_label(:,26:75)= speech_label_2;
    elseif speaker_label == 13
        aud_data_1 = aud_raw_speech(1:10000,1:50);
        aud_data_2 = aud_raw_speech(1:10000,76:100);
        aud_data(:,1:50) = aud_data_1;
        aud_data(:,51:75) = aud_data_2;
        speech_label_1 = aud_raw_speech(10002,1:50);
        speech_label_2 = aud_raw_speech(10002,76:100);
        speech_label(:,1:50) = speech_label_1;
        speech_label(:,51:75)= speech_label_2;
    else 
        aud_data = aud_raw_speech(1:10000,1:75);
        speech_label = aud_raw_speech(10002,1:75);
    end
    
    %ERROR calculation for raw,1NN
    found_labels_raw_1 = KNN(inx,aud_data,speech_label,1);
    if found_labels_raw_1 == T_speech_label
        Error_raw_1_speech = Error_raw_1_speech + 0;
    else
        if T_speech_label == 1
        Error_raw_1_1_speech = Error_raw_1_1_speech + 1;
        elseif T_speech_label == 2
        Error_raw_1_2_speech = Error_raw_1_2_speech + 1;
        elseif T_speech_label == 3
        Error_raw_1_3_speech = Error_raw_1_3_speech + 1;
        elseif T_speech_label == 4 
        Error_raw_1_4_speech = Error_raw_1_4_speech + 1;
        else
        Error_raw_1_5_speech = Error_raw_1_5_speech + 1;
        end
        Error_raw_1_speech = Error_raw_1_1_speech + Error_raw_1_2_speech + Error_raw_1_3_speech +Error_raw_1_4_speech+Error_raw_1_5_speech;
    end
    
    %ERROR calculation for raw,5NN
    found_labels_raw_5 = KNN(inx,aud_data,speech_label,5);
    if found_labels_raw_5 == T_speech_label
        Error_raw_5_speech = Error_raw_5_speech + 0;
    else
        if T_speech_label == 1
        Error_raw_5_1_speech = Error_raw_5_1_speech + 1;
        elseif T_speech_label == 2
        Error_raw_5_2_speech = Error_raw_5_2_speech + 1;
        elseif T_speech_label == 3
        Error_raw_5_3_speech = Error_raw_5_3_speech + 1;
        elseif T_speech_label == 4 
        Error_raw_5_4_speech = Error_raw_5_4_speech + 1;
        else
        Error_raw_5_5_speech = Error_raw_5_5_speech + 1;
        end
        Error_raw_5_speech = Error_raw_5_1_speech + Error_raw_5_2_speech + Error_raw_5_3_speech +Error_raw_5_4_speech+Error_raw_5_5_speech;
    end
    
end
% RAW--------accuracy calculation for speech recognition
Acc_raw_1_1_speech = ((20-Error_raw_1_1_speech) * 100 )/ 20;
Acc_raw_1_2_speech = ((20-Error_raw_1_2_speech) * 100 )/ 20;
Acc_raw_1_3_speech = ((20-Error_raw_1_3_speech) * 100 )/ 20;
Acc_raw_1_4_speech = ((20-Error_raw_1_4_speech) * 100 )/ 20;
Acc_raw_1_5_speech = ((20-Error_raw_1_5_speech) * 100 )/ 20;
Acc_raw_1_speech = ((100-Error_raw_1_speech) * 100 )/ 100;

Acc_raw_5_1_speech = ((20-Error_raw_5_1_speech) * 100 )/ 20;
Acc_raw_5_2_speech = ((20-Error_raw_5_2_speech) * 100 )/ 20;
Acc_raw_5_3_speech = ((20-Error_raw_5_3_speech) * 100 )/ 20;
Acc_raw_5_4_speech = ((20-Error_raw_5_4_speech) * 100 )/ 20;
Acc_raw_5_5_speech = ((20-Error_raw_5_5_speech) * 100 )/ 20;
Acc_raw_5_speech = ((100-Error_raw_5_speech) * 100 )/ 100;

%SPEAKER RECOGNITION-------------KNN & accuracy calculation
%Define Error 
Error_raw_1_11_speaker = 0;
Error_raw_1_12_speaker = 0;
Error_raw_1_13_speaker = 0;
Error_raw_1_14_speaker = 0;
Error_raw_1_speaker = 0;
Error_raw_5_11_speaker= 0;
Error_raw_5_12_speaker = 0;
Error_raw_5_13_speaker = 0;
Error_raw_5_14_speaker = 0;
Error_raw_5_speaker = 0;

for i = 1:100
    inx = aud_raw_speaker(1:10000,i);
    speech_label = aud_raw_speaker(10002,i);
    T_speaker_label = aud_raw_speaker(10001,i);
    aud_data = zeros(10000,80);
    
    if speech_label == 1
        aud_data = aud_raw_speaker(1:10000,21:100);
        speaker_label = aud_raw_speaker(10001,21:100);
    elseif speech_label == 2
        aud_data_1 = aud_raw_speaker(1:10000,1:20);
        aud_data_2 = aud_raw_speaker(1:10000,41:100);
        aud_data(:,1:20) = aud_data_1;
        aud_data(:,21:80) = aud_data_2;
        speaker_label_1 = aud_raw_speaker(10001,1:20);
        speaker_label_2 = aud_raw_speaker(10001,41:100);
        speaker_label(:,1:20) = speaker_label_1;
        speaker_label(:,21:80) = speaker_label_2;
    elseif speech_label == 3
        aud_data_1 = aud_raw_speaker(1:10000,1:40);
        aud_data_2 = aud_raw_speaker(1:10000,61:100);
        aud_data(:,1:40) = aud_data_1;
        aud_data(:,41:80) = aud_data_2;
        speaker_label_1 = aud_raw_speaker(10001,1:40);
        speaker_label_2 = aud_raw_speaker(10001,61:100);
        speaker_label(:,1:40) = speaker_label_1;
        speaker_label(:,41:80) = speaker_label_2;
    elseif speech_label == 4
        aud_data_1 = aud_raw_speaker(1:10000,1:60);
        aud_data_2 = aud_raw_speaker(1:10000,81:100);
        aud_data(:,1:60) = aud_data_1;
        aud_data(:,61:80) = aud_data_2;
        speaker_label_1 = aud_raw_speaker(10001,1:60);
        speaker_label_2 = aud_raw_speaker(10001,81:100);
        speaker_label(:,1:60) = speaker_label_1;
        speaker_label(:,61:80) = speaker_label_2;
    else
        aud_data = aud_raw_speaker(1:10000,1:80);
        speaker_label = aud_raw_speaker(10001,1:80);
    end
    
     %ERROR calculation for raw,1NN
    found_labels_raw_1 = KNN(inx,aud_data,speaker_label,1);
    if found_labels_raw_1 == T_speaker_label
        Error_raw_1_speaker = Error_raw_1_speaker + 0;
    else
        if T_speaker_label == 11
        Error_raw_1_11_speaker = Error_raw_1_11_speaker + 1;
        elseif T_speaker_label == 12
        Error_raw_1_12_speaker = Error_raw_1_12_speaker + 1;
        elseif T_speaker_label == 13
        Error_raw_1_13_speaker = Error_raw_1_13_speaker + 1;
        else
        Error_raw_1_14_speaker = Error_raw_1_14_speaker + 1;
        end
        Error_raw_1_speaker = Error_raw_1_11_speaker + Error_raw_1_12_speaker + Error_raw_1_13_speaker +Error_raw_1_14_speaker;
    end
    
     %ERROR calculation for raw,5NN
    found_labels_raw_5 = KNN(inx,aud_data,speaker_label,5);
    if found_labels_raw_5 == T_speaker_label
        Error_raw_5_speaker = Error_raw_5_speaker + 0;
    else
        if T_speaker_label == 11
        Error_raw_5_11_speaker = Error_raw_5_11_speaker + 1;
        elseif T_speaker_label == 12
        Error_raw_5_12_speaker = Error_raw_5_12_speaker + 1;
        elseif T_speaker_label == 13
        Error_raw_5_13_speaker = Error_raw_5_13_speaker + 1;
        else
        Error_raw_5_14_speaker = Error_raw_5_14_speaker + 1;
        end
        Error_raw_5_speaker = Error_raw_5_11_speaker + Error_raw_5_12_speaker + Error_raw_5_13_speaker +Error_raw_5_14_speaker;
    end
end

% RAW--------accuracy calculation for speaker recognition
Acc_raw_1_11_speaker = ((25-Error_raw_1_11_speaker) * 100 )/ 25;
Acc_raw_1_12_speaker = ((25-Error_raw_1_12_speaker) * 100 )/ 25;
Acc_raw_1_13_speaker = ((25-Error_raw_1_13_speaker) * 100 )/ 25;
Acc_raw_1_14_speaker = ((25-Error_raw_1_14_speaker) * 100 )/ 25;
Acc_raw_1_speaker = ((100-Error_raw_1_speaker) * 100 )/ 100;

Acc_raw_5_11_speaker = ((25-Error_raw_5_11_speaker) * 100 )/ 25;
Acc_raw_5_12_speaker = ((25-Error_raw_5_12_speaker) * 100 )/ 25;
Acc_raw_5_13_speaker = ((25-Error_raw_5_13_speaker) * 100 )/ 25;
Acc_raw_5_14_speaker = ((25-Error_raw_5_14_speaker) * 100 )/ 25;
Acc_raw_5_speaker = ((100-Error_raw_5_speaker) * 100 )/ 100;


%===================================================================
%===========================start CC================================

%----------------------data used for CC-----------------------------
aud_CC_speech_100 = zeros(1334,100);
aud_CC_speech_500 = zeros(266,100);
aud_CC_speech_10000 = zeros(14,100);

for i = 1:100
    signal = aud_raw(1:10000,i);
    aud_CC_speech_c_100 = cepstrum(signal, 12, 100, 10);
    aud_CC_speech_100(1:1332,i) = aud_CC_speech_c_100;
    aud_CC_speech_c_500 = cepstrum(signal, 12, 500, 50);
    aud_CC_speech_500(1:264,i) = aud_CC_speech_c_500;
    aud_CC_speech_c_10000 = cepstrum(signal, 12, 10000, 1000);
    aud_CC_speech_10000(1:12,i) = aud_CC_speech_c_10000;
end

%data used for speech recognition
aud_CC_speech_100(1333:1334,:) = aud_raw(10001:10002,:);
aud_CC_speech_500(265:266,:) = aud_raw(10001:10002,:);
aud_CC_speech_10000(13:14,:) = aud_raw(10001:10002,:);

%data used for speaker recognition
aud_CC_speaker_1001 = sortrows(aud_CC_speech_100',1334);
aud_CC_speaker_100 = aud_CC_speaker_1001';
aud_CC_speaker_5001 = sortrows(aud_CC_speech_500',266);
aud_CC_speaker_500 = aud_CC_speaker_5001';
aud_CC_speaker_100001 = sortrows(aud_CC_speech_10000',14);
aud_CC_speaker_10000 = aud_CC_speaker_100001';

%----------------------data used for CC end -------------------------


%==============================CC W = 100============================
%-----------SPEECH RECOGNITION------KNN & accuracy calculation-------
%Define Error 
Error_CC_1_1_speech_100 = 0;
Error_CC_1_2_speech_100 = 0;
Error_CC_1_3_speech_100 = 0;
Error_CC_1_4_speech_100 = 0;
Error_CC_1_5_speech_100 = 0;
Error_CC_1_speech_100 = 0;
Error_CC_5_1_speech_100 = 0;
Error_CC_5_2_speech_100 = 0;
Error_CC_5_3_speech_100 = 0;
Error_CC_5_4_speech_100 = 0;
Error_CC_5_5_speech_100 = 0;
Error_CC_5_speech_100 = 0;

%KNN start
for i = 1:100
    inx = aud_CC_speech_100(1:1332,i);
    speaker_label = aud_CC_speech_100(1333,i);
    T_speech_label = aud_CC_speech_100(1334,i);
    aud_data = zeros(1332,75);
    
    if speaker_label == 11
        aud_data = aud_CC_speech_100(1:1332,26:100);
        speech_label = aud_CC_speech_100(1334,26:100);
    elseif speaker_label == 12
        aud_data_1 = aud_CC_speech_100(1:1332,1:25);
        aud_data_2 = aud_CC_speech_100(1:1332,51:100);
        aud_data(:,1:25) = aud_data_1;
        aud_data(:,26:75) = aud_data_2;
        speech_label_1 = aud_CC_speech_100(1334,1:25);
        speech_label_2 = aud_CC_speech_100(1334,51:100);
        speech_label(:,1:25) = speech_label_1;
        speech_label(:,26:75)= speech_label_2;
    elseif speaker_label == 13
        aud_data_1 = aud_CC_speech_100(1:1332,1:50);
        aud_data_2 = aud_CC_speech_100(1:1332,76:100);
        aud_data(:,1:50) = aud_data_1;
        aud_data(:,51:75) = aud_data_2;
        speech_label_1 = aud_CC_speech_100(1334,1:50);
        speech_label_2 = aud_CC_speech_100(1334,76:100);
        speech_label(:,1:50) = speech_label_1;
        speech_label(:,51:75)= speech_label_2;
    else 
        aud_data = aud_CC_speech_100(1:1332,1:75);
        speech_label = aud_CC_speech_100(1334,1:75);
    end
    
    %ERROR calculation for raw,1NN
    found_labels_CC_100 = KNN(inx,aud_data,speech_label,1);
    if found_labels_CC_100 == T_speech_label
        Error_CC_1_speech_100 = Error_CC_1_speech_100 + 0;
    else
        if T_speech_label == 1
        Error_CC_1_1_speech_100 = Error_CC_1_1_speech_100 + 1;
        elseif T_speech_label == 2
        Error_CC_1_2_speech_100 = Error_CC_1_2_speech_100 + 1;
        elseif T_speech_label == 3
        Error_CC_1_3_speech_100 = Error_CC_1_3_speech_100 + 1;
        elseif T_speech_label == 4 
        Error_CC_1_4_speech_100 = Error_CC_1_4_speech_100 + 1;
        else
        Error_CC_1_5_speech_100 = Error_CC_1_5_speech_100 + 1;
        end
        Error_CC_1_speech_100 = Error_CC_1_1_speech_100 + Error_CC_1_2_speech_100 + Error_CC_1_3_speech_100 +Error_CC_1_4_speech_100+Error_CC_1_5_speech_100;
    end
    
    %ERROR calculation for raw,5NN
    found_labels_CC_100_5 = KNN(inx,aud_data,speech_label,5);
    if found_labels_CC_100_5 == T_speech_label
        Error_CC_5_speech_100 = Error_CC_5_speech_100 + 0;
    else
        if T_speech_label == 1
        Error_CC_5_1_speech_100 = Error_CC_5_1_speech_100 + 1;
        elseif T_speech_label == 2
        Error_CC_5_2_speech_100 = Error_CC_5_2_speech_100 + 1;
        elseif T_speech_label == 3
        Error_CC_5_3_speech_100 = Error_CC_5_3_speech_100 + 1;
        elseif T_speech_label == 4 
        Error_CC_5_4_speech_100 = Error_CC_5_4_speech_100 + 1;
        else
        Error_CC_5_5_speech_100 = Error_CC_5_5_speech_100 + 1;
        end
        Error_CC_5_speech_100 = Error_CC_5_1_speech_100 + Error_CC_5_2_speech_100 + Error_CC_5_3_speech_100 +Error_CC_5_4_speech_100+Error_CC_5_5_speech_100;
    end
    
end
% --------accuracy calculation for speech recognition----------------------
Acc_CC_1_1_speech_100 = ((20-Error_CC_1_1_speech_100) * 100 )/ 20;
Acc_CC_1_2_speech_100 = ((20-Error_CC_1_2_speech_100) * 100 )/ 20;
Acc_CC_1_3_speech_100 = ((20-Error_CC_1_3_speech_100) * 100 )/ 20;
Acc_CC_1_4_speech_100 = ((20-Error_CC_1_4_speech_100) * 100 )/ 20;
Acc_CC_1_5_speech_100 = ((20-Error_CC_1_5_speech_100) * 100 )/ 20;
Acc_CC_1_speech_100 = ((100-Error_CC_1_speech_100) * 100 )/ 100;

Acc_CC_5_1_speech_100 = ((20-Error_CC_5_1_speech_100) * 100 )/ 20;
Acc_CC_5_2_speech_100 = ((20-Error_CC_5_2_speech_100) * 100 )/ 20;
Acc_CC_5_3_speech_100 = ((20-Error_CC_5_3_speech_100) * 100 )/ 20;
Acc_CC_5_4_speech_100 = ((20-Error_CC_5_4_speech_100) * 100 )/ 20;
Acc_CC_5_5_speech_100 = ((20-Error_CC_5_5_speech_100) * 100 )/ 20;
Acc_CC_5_speech_100 = ((100-Error_CC_5_speech_100) * 100 )/ 100;
%--------SPEECH RECOGNITION------KNN & accuracy calculation-- end---------

%-------SPEAKER RECOGNITION------KNN & accuracy calculation----start------

%Define Error 
Error_CC_1_11_speaker_100 = 0;
Error_CC_1_12_speaker_100 = 0;
Error_CC_1_13_speaker_100 = 0;
Error_CC_1_14_speaker_100 = 0;
Error_CC_1_speaker_100 = 0;
Error_CC_5_11_speaker_100= 0;
Error_CC_5_12_speaker_100 = 0;
Error_CC_5_13_speaker_100 = 0;
Error_CC_5_14_speaker_100 = 0;
Error_CC_5_speaker_100 = 0;

for i = 1:100
    inx = aud_CC_speaker_100(1:1332,i);
    speech_label = aud_CC_speaker_100(1334,i);
    T_speaker_label = aud_CC_speaker_100(1333,i);
    aud_data = zeros(1332,80);
    
    if speech_label == 1
        aud_data = aud_CC_speaker_100(1:1332,21:100);
        speaker_label = aud_CC_speaker_100(1333,21:100);
    elseif speech_label == 2
        aud_data_1 = aud_CC_speaker_100(1:1332,1:20);
        aud_data_2 = aud_CC_speaker_100(1:1332,41:100);
        aud_data(:,1:20) = aud_data_1;
        aud_data(:,21:80) = aud_data_2;
        speaker_label_1 = aud_CC_speaker_100(1333,1:20);
        speaker_label_2 = aud_CC_speaker_100(1333,41:100);
        speaker_label(:,1:20) = speaker_label_1;
        speaker_label(:,21:80) = speaker_label_2;
    elseif speech_label == 3
        aud_data_1 = aud_CC_speaker_100(1:1332,1:40);
        aud_data_2 = aud_CC_speaker_100(1:1332,61:100);
        aud_data(:,1:40) = aud_data_1;
        aud_data(:,41:80) = aud_data_2;
        speaker_label_1 = aud_CC_speaker_100(1333,1:40);
        speaker_label_2 = aud_CC_speaker_100(1333,61:100);
        speaker_label(:,1:40) = speaker_label_1;
        speaker_label(:,41:80) = speaker_label_2;
    elseif speech_label == 4
        aud_data_1 = aud_CC_speaker_100(1:1332,1:60);
        aud_data_2 = aud_CC_speaker_100(1:1332,81:100);
        aud_data(:,1:60) = aud_data_1;
        aud_data(:,61:80) = aud_data_2;
        speaker_label_1 = aud_CC_speaker_100(1333,1:60);
        speaker_label_2 = aud_CC_speaker_100(1333,81:100);
        speaker_label(:,1:60) = speaker_label_1;
        speaker_label(:,61:80) = speaker_label_2;
    else
        aud_data = aud_CC_speaker_100(1:1332,1:80);
        speaker_label = aud_CC_speaker_100(1333,1:80);
    end
    
     %ERROR calculation for CC w = 100,1NN
    found_labels_CC_1_100 = KNN(inx,aud_data,speaker_label,1);
    if found_labels_CC_1_100 == T_speaker_label
        Error_CC_1_speaker_100 = Error_CC_1_speaker_100 + 0;
    else
        if T_speaker_label == 11
        Error_CC_1_11_speaker_100 = Error_CC_1_11_speaker_100 + 1;
        elseif T_speaker_label == 12
        Error_CC_1_12_speaker_100 = Error_CC_1_12_speaker_100 + 1;
        elseif T_speaker_label == 13
        Error_CC_1_13_speaker_100 = Error_CC_1_13_speaker_100 + 1;
        else
        Error_CC_1_14_speaker_100 = Error_CC_1_14_speaker_100 + 1;
        end
        Error_CC_1_speaker_100 = Error_CC_1_11_speaker_100 + Error_CC_1_12_speaker_100 + Error_CC_1_13_speaker_100 +Error_CC_1_14_speaker_100;
    end
    
     %ERROR calculation for CC w =100 ,5NN
    found_labels_raw_5 = KNN(inx,aud_data,speaker_label,5);
    if found_labels_raw_5 == T_speaker_label
        Error_CC_5_speaker_100 = Error_CC_5_speaker_100 + 0;
    else
        if T_speaker_label == 11
        Error_CC_5_11_speaker_100 = Error_CC_5_11_speaker_100 + 1;
        elseif T_speaker_label == 12
        Error_CC_5_12_speaker_100 = Error_CC_5_12_speaker_100 + 1;
        elseif T_speaker_label == 13
        Error_CC_5_13_speaker_100 = Error_CC_5_13_speaker_100 + 1;
        else
        Error_CC_5_14_speaker_100 = Error_CC_5_14_speaker_100 + 1;
        end
        Error_CC_5_speaker_100 = Error_CC_5_11_speaker_100 + Error_CC_5_12_speaker_100 + Error_CC_5_13_speaker_100 +Error_CC_5_14_speaker_100;
    end
end

% CC W = 100--------accuracy calculation for speaker recognition
Acc_CC_1_11_speaker_100 = ((25-Error_CC_1_11_speaker_100) * 100 )/ 25;
Acc_CC_1_12_speaker_100 = ((25-Error_CC_1_12_speaker_100) * 100 )/ 25;
Acc_CC_1_13_speaker_100 = ((25-Error_CC_1_13_speaker_100) * 100 )/ 25;
Acc_CC_1_14_speaker_100 = ((25-Error_CC_1_14_speaker_100) * 100 )/ 25;
Acc_CC_1_speaker_100 = ((100-Error_CC_1_speaker_100) * 100 )/ 100;

Acc_CC_5_11_speaker_100 = ((25-Error_CC_5_11_speaker_100) * 100 )/ 25;
Acc_CC_5_12_speaker_100 = ((25-Error_CC_5_12_speaker_100) * 100 )/ 25;
Acc_CC_5_13_speaker_100 = ((25-Error_CC_5_13_speaker_100) * 100 )/ 25;
Acc_CC_5_14_speaker_100 = ((25-Error_CC_5_14_speaker_100) * 100 )/ 25;
Acc_CC_5_speaker_100 = ((100-Error_CC_5_speaker_100) * 100 )/ 100;

%-------SPEAKER RECOGNITION------KNN & accuracy calculation----end--------

%=========================================================================

%==============================CC W = 500=================================
%-----------SPEECH RECOGNITION------KNN & accuracy calculation---start----

Error_CC_1_1_speech_500 = 0;
Error_CC_1_2_speech_500 = 0;
Error_CC_1_3_speech_500 = 0;
Error_CC_1_4_speech_500 = 0;
Error_CC_1_5_speech_500 = 0;
Error_CC_1_speech_500 = 0;
Error_CC_5_1_speech_500 = 0;
Error_CC_5_2_speech_500 = 0;
Error_CC_5_3_speech_500 = 0;
Error_CC_5_4_speech_500 = 0;
Error_CC_5_5_speech_500 = 0;
Error_CC_5_speech_500 = 0;


%KNN start
for i = 1:100
    inx = aud_CC_speech_500(1:264,i);
    speaker_label = aud_CC_speech_500(265,i);
    T_speech_label = aud_CC_speech_500(266,i);
    aud_data = zeros(264,75);
    
    if speaker_label == 11
        aud_data = aud_CC_speech_500(1:264,26:100);
        speech_label = aud_CC_speech_500(266,26:100);
    elseif speaker_label == 12
        aud_data_1 = aud_CC_speech_500(1:264,1:25);
        aud_data_2 = aud_CC_speech_500(1:264,51:100);
        aud_data(:,1:25) = aud_data_1;
        aud_data(:,26:75) = aud_data_2;
        speech_label_1 = aud_CC_speech_500(266,1:25);
        speech_label_2 = aud_CC_speech_500(266,51:100);
        speech_label(:,1:25) = speech_label_1;
        speech_label(:,26:75)= speech_label_2;
    elseif speaker_label == 13
        aud_data_1 = aud_CC_speech_500(1:264,1:50);
        aud_data_2 = aud_CC_speech_500(1:264,76:100);
        aud_data(:,1:50) = aud_data_1;
        aud_data(:,51:75) = aud_data_2;
        speech_label_1 = aud_CC_speech_500(266,1:50);
        speech_label_2 = aud_CC_speech_500(266,76:100);
        speech_label(:,1:50) = speech_label_1;
        speech_label(:,51:75)= speech_label_2;
    else 
        aud_data = aud_CC_speech_500(1:264,1:75);
        speech_label = aud_CC_speech_500(266,1:75);
    end
    
    %ERROR calculation for CC w =500,1NN
    found_labels_CC_500 = KNN(inx,aud_data,speech_label,1);
    if found_labels_CC_500 == T_speech_label
        Error_CC_1_speech_500 = Error_CC_1_speech_500 + 0;
    else
        if T_speech_label == 1
        Error_CC_1_1_speech_500 = Error_CC_1_1_speech_500 + 1;
        elseif T_speech_label == 2
        Error_CC_1_2_speech_500 = Error_CC_1_2_speech_500 + 1;
        elseif T_speech_label == 3
        Error_CC_1_3_speech_500 = Error_CC_1_3_speech_500 + 1;
        elseif T_speech_label == 4 
        Error_CC_1_4_speech_500 = Error_CC_1_4_speech_500 + 1;
        else
        Error_CC_1_5_speech_500 = Error_CC_1_5_speech_500 + 1;
        end
        Error_CC_1_speech_500 = Error_CC_1_1_speech_500 + Error_CC_1_2_speech_500 + Error_CC_1_3_speech_500 +Error_CC_1_4_speech_500+Error_CC_1_5_speech_500;
    end
    
    %ERROR calculation for CC w =500,5NN
    found_labels_CC_500_5 = KNN(inx,aud_data,speech_label,5);
    if found_labels_CC_500_5 == T_speech_label
        Error_CC_5_speech_500 = Error_CC_5_speech_500 + 0;
    else
        if T_speech_label == 1
        Error_CC_5_1_speech_500 = Error_CC_5_1_speech_500 + 1;
        elseif T_speech_label == 2
        Error_CC_5_2_speech_500 = Error_CC_5_2_speech_500 + 1;
        elseif T_speech_label == 3
        Error_CC_5_3_speech_500 = Error_CC_5_3_speech_500 + 1;
        elseif T_speech_label == 4 
        Error_CC_5_4_speech_500 = Error_CC_5_4_speech_500 + 1;
        else
        Error_CC_5_5_speech_500 = Error_CC_5_5_speech_500 + 1;
        end
        Error_CC_5_speech_500 = Error_CC_5_1_speech_500 + Error_CC_5_2_speech_500 + Error_CC_5_3_speech_500 +Error_CC_5_4_speech_500+Error_CC_5_5_speech_500;
    end
    
end
% CC w =500--------accuracy calculation for speech recognition
Acc_CC_1_1_speech_500 = ((20-Error_CC_1_1_speech_500) * 100 )/ 20;
Acc_CC_1_2_speech_500 = ((20-Error_CC_1_2_speech_500) * 100 )/ 20;
Acc_CC_1_3_speech_500 = ((20-Error_CC_1_3_speech_500) * 100 )/ 20;
Acc_CC_1_4_speech_500 = ((20-Error_CC_1_4_speech_500) * 100 )/ 20;
Acc_CC_1_5_speech_500 = ((20-Error_CC_1_5_speech_500) * 100 )/ 20;
Acc_CC_1_speech_500 = ((100-Error_CC_1_speech_500) * 100 )/ 100;

Acc_CC_5_1_speech_500 = ((20-Error_CC_5_1_speech_500) * 100 )/ 20;
Acc_CC_5_2_speech_500 = ((20-Error_CC_5_2_speech_500) * 100 )/ 20;
Acc_CC_5_3_speech_500 = ((20-Error_CC_5_3_speech_500) * 100 )/ 20;
Acc_CC_5_4_speech_500 = ((20-Error_CC_5_4_speech_500) * 100 )/ 20;
Acc_CC_5_5_speech_500 = ((20-Error_CC_5_5_speech_500) * 100 )/ 20;
Acc_CC_5_speech_500 = ((100-Error_CC_5_speech_500) * 100 )/ 100;

%-------SPEECH RECOGNITION------KNN & accuracy calculation----end---------

%-------SPEAKER RECOGNITION------KNN & accuracy calculation----start------

%Define Error 
Error_CC_1_11_speaker_500 = 0;
Error_CC_1_12_speaker_500 = 0;
Error_CC_1_13_speaker_500 = 0;
Error_CC_1_14_speaker_500 = 0;
Error_CC_1_speaker_500 = 0;
Error_CC_5_11_speaker_500= 0;
Error_CC_5_12_speaker_500 = 0;
Error_CC_5_13_speaker_500 = 0;
Error_CC_5_14_speaker_500 = 0;
Error_CC_5_speaker_500 = 0;

for i = 1:100
    inx = aud_CC_speaker_500(1:264,i);
    speech_label = aud_CC_speaker_500(266,i);
    T_speaker_label = aud_CC_speaker_500(265,i);
    aud_data = zeros(264,80);
    
    if speech_label == 1
        aud_data = aud_CC_speaker_500(1:264,21:100);
        speaker_label = aud_CC_speaker_500(265,21:100);
    elseif speech_label == 2
        aud_data_1 = aud_CC_speaker_500(1:264,1:20);
        aud_data_2 = aud_CC_speaker_500(1:264,41:100);
        aud_data(:,1:20) = aud_data_1;
        aud_data(:,21:80) = aud_data_2;
        speaker_label_1 = aud_CC_speaker_500(265,1:20);
        speaker_label_2 = aud_CC_speaker_500(265,41:100);
        speaker_label(:,1:20) = speaker_label_1;
        speaker_label(:,21:80) = speaker_label_2;
    elseif speech_label == 3
        aud_data_1 = aud_CC_speaker_500(1:264,1:40);
        aud_data_2 = aud_CC_speaker_500(1:264,61:100);
        aud_data(:,1:40) = aud_data_1;
        aud_data(:,41:80) = aud_data_2;
        speaker_label_1 = aud_CC_speaker_500(265,1:40);
        speaker_label_2 = aud_CC_speaker_500(265,61:100);
        speaker_label(:,1:40) = speaker_label_1;
        speaker_label(:,41:80) = speaker_label_2;
    elseif speech_label == 4
        aud_data_1 = aud_CC_speaker_500(1:264,1:60);
        aud_data_2 = aud_CC_speaker_500(1:264,81:100);
        aud_data(:,1:60) = aud_data_1;
        aud_data(:,61:80) = aud_data_2;
        speaker_label_1 = aud_CC_speaker_500(265,1:60);
        speaker_label_2 = aud_CC_speaker_500(265,81:100);
        speaker_label(:,1:60) = speaker_label_1;
        speaker_label(:,61:80) = speaker_label_2;
    else
        aud_data = aud_CC_speaker_500(1:264,1:80);
        speaker_label = aud_CC_speaker_500(265,1:80);
    end
    
     %ERROR calculation for CC w = 500,1NN
    found_labels_CC_1_500 = KNN(inx,aud_data,speaker_label,1);
    if found_labels_CC_1_500 == T_speaker_label
        Error_CC_1_speaker_500 = Error_CC_1_speaker_500 + 0;
    else
        if T_speaker_label == 11
        Error_CC_1_11_speaker_500 = Error_CC_1_11_speaker_500 + 1;
        elseif T_speaker_label == 12
        Error_CC_1_12_speaker_500 = Error_CC_1_12_speaker_500 + 1;
        elseif T_speaker_label == 13
        Error_CC_1_13_speaker_500 = Error_CC_1_13_speaker_500 + 1;
        else
        Error_CC_1_14_speaker_500 = Error_CC_1_14_speaker_500 + 1;
        end
        Error_CC_1_speaker_500 = Error_CC_1_11_speaker_500 + Error_CC_1_12_speaker_500 + Error_CC_1_13_speaker_500 +Error_CC_1_14_speaker_500;
    end
    
     %ERROR calculation for CC w =500 ,5NN
    found_labels_raw_5 = KNN(inx,aud_data,speaker_label,5);
    if found_labels_raw_5 == T_speaker_label
        Error_CC_5_speaker_500 = Error_CC_5_speaker_500 + 0;
    else
        if T_speaker_label == 11
        Error_CC_5_11_speaker_500 = Error_CC_5_11_speaker_500 + 1;
        elseif T_speaker_label == 12
        Error_CC_5_12_speaker_500 = Error_CC_5_12_speaker_500 + 1;
        elseif T_speaker_label == 13
        Error_CC_5_13_speaker_500 = Error_CC_5_13_speaker_500 + 1;
        else
        Error_CC_5_14_speaker_500 = Error_CC_5_14_speaker_500 + 1;
        end
        Error_CC_5_speaker_500 = Error_CC_5_11_speaker_500 + Error_CC_5_12_speaker_500 + Error_CC_5_13_speaker_500 +Error_CC_5_14_speaker_500;
    end
end

% CC W = 500--------accuracy calculation for speaker recognition
Acc_CC_1_11_speaker_500 = ((25-Error_CC_1_11_speaker_500) * 100 )/ 25;
Acc_CC_1_12_speaker_500 = ((25-Error_CC_1_12_speaker_500) * 100 )/ 25;
Acc_CC_1_13_speaker_500 = ((25-Error_CC_1_13_speaker_500) * 100 )/ 25;
Acc_CC_1_14_speaker_500 = ((25-Error_CC_1_14_speaker_500) * 100 )/ 25;
Acc_CC_1_speaker_500 = ((100-Error_CC_1_speaker_500) * 100 )/ 100;

Acc_CC_5_11_speaker_500 = ((25-Error_CC_5_11_speaker_500) * 100 )/ 25;
Acc_CC_5_12_speaker_500 = ((25-Error_CC_5_12_speaker_500) * 100 )/ 25;
Acc_CC_5_13_speaker_500 = ((25-Error_CC_5_13_speaker_500) * 100 )/ 25;
Acc_CC_5_14_speaker_500 = ((25-Error_CC_5_14_speaker_500) * 100 )/ 25;
Acc_CC_5_speaker_500 = ((100-Error_CC_5_speaker_500) * 100 )/ 100;

%-------SPEAKER RECOGNITION------KNN & accuracy calculation----end--------

%=========================================================================

%==============================CC W =10000=================================
%-----------SPEECH RECOGNITION------KNN & accuracy calculation---start----
Error_CC_1_1_speech_10000 = 0;
Error_CC_1_2_speech_10000 = 0;
Error_CC_1_3_speech_10000 = 0;
Error_CC_1_4_speech_10000 = 0;
Error_CC_1_5_speech_10000 = 0;
Error_CC_1_speech_10000 = 0;
Error_CC_5_1_speech_10000 = 0;
Error_CC_5_2_speech_10000 = 0;
Error_CC_5_3_speech_10000 = 0;
Error_CC_5_4_speech_10000 = 0;
Error_CC_5_5_speech_10000 = 0;
Error_CC_5_speech_10000 = 0;


%KNN start
for i = 1:100
    inx = aud_CC_speech_10000(1:12,i);
    speaker_label = aud_CC_speech_10000(13,i);
    T_speech_label = aud_CC_speech_10000(14,i);
    aud_data = zeros(12,75);
    
    if speaker_label == 11
        aud_data = aud_CC_speech_10000(1:12,26:100);
        speech_label = aud_CC_speech_10000(14,26:100);
    elseif speaker_label == 12
        aud_data_1 = aud_CC_speech_10000(1:12,1:25);
        aud_data_2 = aud_CC_speech_10000(1:12,51:100);
        aud_data(:,1:25) = aud_data_1;
        aud_data(:,26:75) = aud_data_2;
        speech_label_1 = aud_CC_speech_10000(14,1:25);
        speech_label_2 = aud_CC_speech_10000(14,51:100);
        speech_label(:,1:25) = speech_label_1;
        speech_label(:,26:75)= speech_label_2;
    elseif speaker_label == 13
        aud_data_1 = aud_CC_speech_10000(1:12,1:50);
        aud_data_2 = aud_CC_speech_10000(1:12,76:100);
        aud_data(:,1:50) = aud_data_1;
        aud_data(:,51:75) = aud_data_2;
        speech_label_1 = aud_CC_speech_10000(14,1:50);
        speech_label_2 = aud_CC_speech_10000(14,76:100);
        speech_label(:,1:50) = speech_label_1;
        speech_label(:,51:75)= speech_label_2;
    else 
        aud_data = aud_CC_speech_10000(1:12,1:75);
        speech_label = aud_CC_speech_10000(14,1:75);
    end
    
    %ERROR calculation for CC w =10000,1NN
    found_labels_CC_10000 = KNN(inx,aud_data,speech_label,1);
    if found_labels_CC_10000 == T_speech_label
        Error_CC_1_speech_10000 = Error_CC_1_speech_10000 + 0;
    else
        if T_speech_label == 1
        Error_CC_1_1_speech_10000 = Error_CC_1_1_speech_10000 + 1;
        elseif T_speech_label == 2
        Error_CC_1_2_speech_10000 = Error_CC_1_2_speech_10000 + 1;
        elseif T_speech_label == 3
        Error_CC_1_3_speech_10000 = Error_CC_1_3_speech_10000 + 1;
        elseif T_speech_label == 4 
        Error_CC_1_4_speech_10000 = Error_CC_1_4_speech_10000 + 1;
        else
        Error_CC_1_5_speech_10000 = Error_CC_1_5_speech_10000 + 1;
        end
        Error_CC_1_speech_10000 = Error_CC_1_1_speech_10000 + Error_CC_1_2_speech_10000 + Error_CC_1_3_speech_10000 +Error_CC_1_4_speech_10000+Error_CC_1_5_speech_10000;
    end
    
    %ERROR calculation for CC w = 10000,5NN
    found_labels_CC_10000_5 = KNN(inx,aud_data,speech_label,5);
    if found_labels_CC_10000_5 == T_speech_label
        Error_CC_5_speech_10000 = Error_CC_5_speech_10000 + 0;
    else
        if T_speech_label == 1
        Error_CC_5_1_speech_10000 = Error_CC_5_1_speech_10000 + 1;
        elseif T_speech_label == 2
        Error_CC_5_2_speech_10000 = Error_CC_5_2_speech_10000 + 1;
        elseif T_speech_label == 3
        Error_CC_5_3_speech_10000 = Error_CC_5_3_speech_10000 + 1;
        elseif T_speech_label == 4 
        Error_CC_5_4_speech_10000 = Error_CC_5_4_speech_10000 + 1;
        else
        Error_CC_5_5_speech_10000 = Error_CC_5_5_speech_10000 + 1;
        end
        Error_CC_5_speech_10000 = Error_CC_5_1_speech_10000 + Error_CC_5_2_speech_10000 + Error_CC_5_3_speech_10000 +Error_CC_5_4_speech_10000+Error_CC_5_5_speech_10000;
    end
    
end
% CC w=10000--------accuracy calculation for speech recognition
Acc_CC_1_1_speech_10000 = ((20-Error_CC_1_1_speech_10000) * 100 )/ 20;
Acc_CC_1_2_speech_10000 = ((20-Error_CC_1_2_speech_10000) * 100 )/ 20;
Acc_CC_1_3_speech_10000 = ((20-Error_CC_1_3_speech_10000) * 100 )/ 20;
Acc_CC_1_4_speech_10000 = ((20-Error_CC_1_4_speech_10000) * 100 )/ 20;
Acc_CC_1_5_speech_10000 = ((20-Error_CC_1_5_speech_10000) * 100 )/ 20;
Acc_CC_1_speech_10000 = ((100-Error_CC_1_speech_10000) * 100 )/ 100;

Acc_CC_5_1_speech_10000 = ((20-Error_CC_5_1_speech_10000) * 100 )/ 20;
Acc_CC_5_2_speech_10000 = ((20-Error_CC_5_2_speech_10000) * 100 )/ 20;
Acc_CC_5_3_speech_10000 = ((20-Error_CC_5_3_speech_10000) * 100 )/ 20;
Acc_CC_5_4_speech_10000 = ((20-Error_CC_5_4_speech_10000) * 100 )/ 20;
Acc_CC_5_5_speech_10000 = ((20-Error_CC_5_5_speech_10000) * 100 )/ 20;
Acc_CC_5_speech_10000 = ((100-Error_CC_5_speech_10000) * 100 )/ 100;

%-------SPEECH RECOGNITION------KNN & accuracy calculation----end---------

%-------SPEAKER RECOGNITION------KNN & accuracy calculation----start------
%Define Error 
Error_CC_1_11_speaker_10000 = 0;
Error_CC_1_12_speaker_10000 = 0;
Error_CC_1_13_speaker_10000 = 0;
Error_CC_1_14_speaker_10000 = 0;
Error_CC_1_speaker_10000 = 0;
Error_CC_5_11_speaker_10000= 0;
Error_CC_5_12_speaker_10000 = 0;
Error_CC_5_13_speaker_10000 = 0;
Error_CC_5_14_speaker_10000 = 0;
Error_CC_5_speaker_10000 = 0;

for i = 1:100
    inx = aud_CC_speaker_10000(1:12,i);
    speech_label = aud_CC_speaker_10000(14,i);
    T_speaker_label = aud_CC_speaker_10000(13,i);
    aud_data = zeros(12,80);
    
    if speech_label == 1
        aud_data = aud_CC_speaker_10000(1:12,21:100);
        speaker_label = aud_CC_speaker_10000(13,21:100);
    elseif speech_label == 2
        aud_data_1 = aud_CC_speaker_10000(1:12,1:20);
        aud_data_2 = aud_CC_speaker_10000(1:12,41:100);
        aud_data(:,1:20) = aud_data_1;
        aud_data(:,21:80) = aud_data_2;
        speaker_label_1 = aud_CC_speaker_10000(13,1:20);
        speaker_label_2 = aud_CC_speaker_10000(13,41:100);
        speaker_label(:,1:20) = speaker_label_1;
        speaker_label(:,21:80) = speaker_label_2;
    elseif speech_label == 3
        aud_data_1 = aud_CC_speaker_10000(1:12,1:40);
        aud_data_2 = aud_CC_speaker_10000(1:12,61:100);
        aud_data(:,1:40) = aud_data_1;
        aud_data(:,41:80) = aud_data_2;
        speaker_label_1 = aud_CC_speaker_10000(13,1:40);
        speaker_label_2 = aud_CC_speaker_10000(13,61:100);
        speaker_label(:,1:40) = speaker_label_1;
        speaker_label(:,41:80) = speaker_label_2;
    elseif speech_label == 4
        aud_data_1 = aud_CC_speaker_10000(1:12,1:60);
        aud_data_2 = aud_CC_speaker_10000(1:12,81:100);
        aud_data(:,1:60) = aud_data_1;
        aud_data(:,61:80) = aud_data_2;
        speaker_label_1 = aud_CC_speaker_10000(13,1:60);
        speaker_label_2 = aud_CC_speaker_10000(13,81:100);
        speaker_label(:,1:60) = speaker_label_1;
        speaker_label(:,61:80) = speaker_label_2;
    else
        aud_data = aud_CC_speaker_10000(1:12,1:80);
        speaker_label = aud_CC_speaker_10000(13,1:80);
    end
    
     %ERROR calculation for CC w = 10000,1NN
    found_labels_CC_1_500 = KNN(inx,aud_data,speaker_label,1);
    if found_labels_CC_1_500 == T_speaker_label
        Error_CC_1_speaker_10000 = Error_CC_1_speaker_10000 + 0;
    else
        if T_speaker_label == 11
        Error_CC_1_11_speaker_10000 = Error_CC_1_11_speaker_10000 + 1;
        elseif T_speaker_label == 12
        Error_CC_1_12_speaker_10000 = Error_CC_1_12_speaker_10000 + 1;
        elseif T_speaker_label == 13
        Error_CC_1_13_speaker_10000 = Error_CC_1_13_speaker_10000 + 1;
        else
        Error_CC_1_14_speaker_10000 = Error_CC_1_14_speaker_10000 + 1;
        end
        Error_CC_1_speaker_10000 = Error_CC_1_11_speaker_10000 + Error_CC_1_12_speaker_10000 + Error_CC_1_13_speaker_10000 +Error_CC_1_14_speaker_10000;
    end
    
     %ERROR calculation for CC w =10000 ,5NN
    found_labels_raw_5 = KNN(inx,aud_data,speaker_label,5);
    if found_labels_raw_5 == T_speaker_label
        Error_CC_5_speaker_10000 = Error_CC_5_speaker_10000 + 0;
    else
        if T_speaker_label == 11
        Error_CC_5_11_speaker_10000 = Error_CC_5_11_speaker_10000 + 1;
        elseif T_speaker_label == 12
        Error_CC_5_12_speaker_10000 = Error_CC_5_12_speaker_10000 + 1;
        elseif T_speaker_label == 13
        Error_CC_5_13_speaker_10000 = Error_CC_5_13_speaker_10000 + 1;
        else
        Error_CC_5_14_speaker_10000 = Error_CC_5_14_speaker_10000 + 1;
        end
        Error_CC_5_speaker_10000 = Error_CC_5_11_speaker_10000 + Error_CC_5_12_speaker_10000 + Error_CC_5_13_speaker_10000 +Error_CC_5_14_speaker_10000;
    end
end

% CC W = 10000--------accuracy calculation for speaker recognition
Acc_CC_1_11_speaker_10000 = ((25-Error_CC_1_11_speaker_10000) * 100 )/ 25;
Acc_CC_1_12_speaker_10000 = ((25-Error_CC_1_12_speaker_10000) * 100 )/ 25;
Acc_CC_1_13_speaker_10000 = ((25-Error_CC_1_13_speaker_10000) * 100 )/ 25;
Acc_CC_1_14_speaker_10000 = ((25-Error_CC_1_14_speaker_10000) * 100 )/ 25;
Acc_CC_1_speaker_10000 = ((100-Error_CC_1_speaker_10000) * 100 )/ 100;

Acc_CC_5_11_speaker_10000 = ((25-Error_CC_5_11_speaker_10000) * 100 )/ 25;
Acc_CC_5_12_speaker_10000 = ((25-Error_CC_5_12_speaker_10000) * 100 )/ 25;
Acc_CC_5_13_speaker_10000 = ((25-Error_CC_5_13_speaker_10000) * 100 )/ 25;
Acc_CC_5_14_speaker_10000 = ((25-Error_CC_5_14_speaker_10000) * 100 )/ 25;
Acc_CC_5_speaker_10000 = ((100-Error_CC_5_speaker_10000) * 100 )/ 100;


%-------SPEAKER RECOGNITION------KNN & accuracy calculation----end--------

%=========================================================================
%===============================CC part end===============================

%=========================================================================

%===================================================================
%===========================start MFCC================================

%----------------------data used for mfCC-----------------------------
aud_MFCC_speech_100 = zeros(1334,100);
aud_MFCC_speech_500 = zeros(266,100);
aud_MFCC_speech_10000 = zeros(14,100);

for i = 1:100
    signal = aud_raw(1:10000,i);
    aud_MFCC_speech_c_100 = mfcc(signal, 12, 100, 10);
    aud_MFCC_speech_100(1:1332,i) = aud_MFCC_speech_c_100;
    aud_MFCC_speech_c_500 = mfcc(signal, 12, 500, 50);
    aud_MFCC_speech_500(1:264,i) = aud_MFCC_speech_c_500;
    aud_MFCC_speech_c_10000 = mfcc(signal, 12, 10000, 1000);
    aud_MFCC_speech_10000(1:12,i) = aud_MFCC_speech_c_10000;
end

%data used for speech recognition
aud_MFCC_speech_100(1333:1334,:) = aud_raw(10001:10002,:);
aud_MFCC_speech_500(265:266,:) = aud_raw(10001:10002,:);
aud_MFCC_speech_10000(13:14,:) = aud_raw(10001:10002,:);

%data used for speaker recognition
aud_MFCC_speaker_1001 = sortrows(aud_MFCC_speech_100',1334);
aud_MFCC_speaker_100 = aud_MFCC_speaker_1001';
aud_MFCC_speaker_5001 = sortrows(aud_MFCC_speech_500',266);
aud_MFCC_speaker_500 = aud_MFCC_speaker_5001';
aud_MFCC_speaker_100001 = sortrows(aud_MFCC_speech_10000',14);
aud_MFCC_speaker_10000 = aud_MFCC_speaker_100001';

%----------------------data used for MFCC end -------------------------
%==============================MFCC W = 100============================
%-----------SPEECH RECOGNITION------KNN & accuracy calculation-------
%Define Error 
Error_MFCC_1_1_speech_100 = 0;
Error_MFCC_1_2_speech_100 = 0;
Error_MFCC_1_3_speech_100 = 0;
Error_MFCC_1_4_speech_100 = 0;
Error_MFCC_1_5_speech_100 = 0;
Error_MFCC_1_speech_100 = 0;
Error_MFCC_5_1_speech_100 = 0;
Error_MFCC_5_2_speech_100 = 0;
Error_MFCC_5_3_speech_100 = 0;
Error_MFCC_5_4_speech_100 = 0;
Error_MFCC_5_5_speech_100 = 0;
Error_MFCC_5_speech_100 = 0;

%KNN start
for i = 1:100
    inx = aud_MFCC_speech_100(1:1332,i);
    speaker_label = aud_MFCC_speech_100(1333,i);
    T_speech_label = aud_MFCC_speech_100(1334,i);
    aud_data = zeros(1332,75);
    
    if speaker_label == 11
        aud_data = aud_MFCC_speech_100(1:1332,26:100);
        speech_label = aud_MFCC_speech_100(1334,26:100);
    elseif speaker_label == 12
        aud_data_1 = aud_MFCC_speech_100(1:1332,1:25);
        aud_data_2 = aud_MFCC_speech_100(1:1332,51:100);
        aud_data(:,1:25) = aud_data_1;
        aud_data(:,26:75) = aud_data_2;
        speech_label_1 = aud_MFCC_speech_100(1334,1:25);
        speech_label_2 = aud_MFCC_speech_100(1334,51:100);
        speech_label(:,1:25) = speech_label_1;
        speech_label(:,26:75)= speech_label_2;
    elseif speaker_label == 13
        aud_data_1 = aud_MFCC_speech_100(1:1332,1:50);
        aud_data_2 = aud_MFCC_speech_100(1:1332,76:100);
        aud_data(:,1:50) = aud_data_1;
        aud_data(:,51:75) = aud_data_2;
        speech_label_1 = aud_MFCC_speech_100(1334,1:50);
        speech_label_2 = aud_MFCC_speech_100(1334,76:100);
        speech_label(:,1:50) = speech_label_1;
        speech_label(:,51:75)= speech_label_2;
    else 
        aud_data = aud_MFCC_speech_100(1:1332,1:75);
        speech_label = aud_MFCC_speech_100(1334,1:75);
    end
    
    %ERROR calculation for raw,1NN
    found_labels_MFCC_100 = KNN(inx,aud_data,speech_label,1);
    if found_labels_MFCC_100 == T_speech_label
        Error_MFCC_1_speech_100 = Error_MFCC_1_speech_100 + 0;
    else
        if T_speech_label == 1
        Error_MFCC_1_1_speech_100 = Error_MFCC_1_1_speech_100 + 1;
        elseif T_speech_label == 2
        Error_MFCC_1_2_speech_100 = Error_MFCC_1_2_speech_100 + 1;
        elseif T_speech_label == 3
        Error_MFCC_1_3_speech_100 = Error_MFCC_1_3_speech_100 + 1;
        elseif T_speech_label == 4 
        Error_MFCC_1_4_speech_100 = Error_MFCC_1_4_speech_100 + 1;
        else
        Error_MFCC_1_5_speech_100 = Error_MFCC_1_5_speech_100 + 1;
        end
        Error_MFCC_1_speech_100 = Error_MFCC_1_1_speech_100 + Error_MFCC_1_2_speech_100 + Error_MFCC_1_3_speech_100 +Error_MFCC_1_4_speech_100+Error_MFCC_1_5_speech_100;
    end
    
    %ERROR calculation for raw,5NN
    found_labels_MFCC_100_5 = KNN(inx,aud_data,speech_label,5);
    if found_labels_MFCC_100_5 == T_speech_label
        Error_MFCC_5_speech_100 = Error_MFCC_5_speech_100 + 0;
    else
        if T_speech_label == 1
        Error_MFCC_5_1_speech_100 = Error_MFCC_5_1_speech_100 + 1;
        elseif T_speech_label == 2
        Error_MFCC_5_2_speech_100 = Error_MFCC_5_2_speech_100 + 1;
        elseif T_speech_label == 3
        Error_MFCC_5_3_speech_100 = Error_MFCC_5_3_speech_100 + 1;
        elseif T_speech_label == 4 
        Error_MFCC_5_4_speech_100 = Error_MFCC_5_4_speech_100 + 1;
        else
        Error_MFCC_5_5_speech_100 = Error_MFCC_5_5_speech_100 + 1;
        end
        Error_MFCC_5_speech_100 = Error_MFCC_5_1_speech_100 + Error_MFCC_5_2_speech_100 + Error_MFCC_5_3_speech_100 +Error_MFCC_5_4_speech_100+Error_MFCC_5_5_speech_100;
    end
    
end
% --------accuracy calculation for speech recognition----------------------
Acc_MFCC_1_1_speech_100 = ((20-Error_MFCC_1_1_speech_100) * 100 )/ 20;
Acc_MFCC_1_2_speech_100 = ((20-Error_MFCC_1_2_speech_100) * 100 )/ 20;
Acc_MFCC_1_3_speech_100 = ((20-Error_MFCC_1_3_speech_100) * 100 )/ 20;
Acc_MFCC_1_4_speech_100 = ((20-Error_MFCC_1_4_speech_100) * 100 )/ 20;
Acc_MFCC_1_5_speech_100 = ((20-Error_MFCC_1_5_speech_100) * 100 )/ 20;
Acc_MFCC_1_speech_100 = ((100-Error_MFCC_1_speech_100) * 100 )/ 100;

Acc_MFCC_5_1_speech_100 = ((20-Error_MFCC_5_1_speech_100) * 100 )/ 20;
Acc_MFCC_5_2_speech_100 = ((20-Error_MFCC_5_2_speech_100) * 100 )/ 20;
Acc_MFCC_5_3_speech_100 = ((20-Error_MFCC_5_3_speech_100) * 100 )/ 20;
Acc_MFCC_5_4_speech_100 = ((20-Error_MFCC_5_4_speech_100) * 100 )/ 20;
Acc_MFCC_5_5_speech_100 = ((20-Error_MFCC_5_5_speech_100) * 100 )/ 20;
Acc_MFCC_5_speech_100 = ((100-Error_MFCC_5_speech_100) * 100 )/ 100;
%--------SPEECH RECOGNITION------KNN & accuracy calculation-- end---------

%-------SPEAKER RECOGNITION------KNN & accuracy calculation----start------

Error_MFCC_1_11_speaker_100 = 0;
Error_MFCC_1_12_speaker_100 = 0;
Error_MFCC_1_13_speaker_100 = 0;
Error_MFCC_1_14_speaker_100 = 0;
Error_MFCC_1_speaker_100 = 0;
Error_MFCC_5_11_speaker_100= 0;
Error_MFCC_5_12_speaker_100 = 0;
Error_MFCC_5_13_speaker_100 = 0;
Error_MFCC_5_14_speaker_100 = 0;
Error_MFCC_5_speaker_100 = 0;

for i = 1:100
    inx = aud_MFCC_speaker_100(1:1332,i);
    speech_label = aud_MFCC_speaker_100(1334,i);
    T_speaker_label = aud_MFCC_speaker_100(1333,i);
    aud_data = zeros(1332,80);
    
    if speech_label == 1
        aud_data = aud_MFCC_speaker_100(1:1332,21:100);
        speaker_label = aud_MFCC_speaker_100(1333,21:100);
    elseif speech_label == 2
        aud_data_1 = aud_MFCC_speaker_100(1:1332,1:20);
        aud_data_2 = aud_MFCC_speaker_100(1:1332,41:100);
        aud_data(:,1:20) = aud_data_1;
        aud_data(:,21:80) = aud_data_2;
        speaker_label_1 = aud_MFCC_speaker_100(1333,1:20);
        speaker_label_2 = aud_MFCC_speaker_100(1333,41:100);
        speaker_label(:,1:20) = speaker_label_1;
        speaker_label(:,21:80) = speaker_label_2;
    elseif speech_label == 3
        aud_data_1 = aud_MFCC_speaker_100(1:1332,1:40);
        aud_data_2 = aud_MFCC_speaker_100(1:1332,61:100);
        aud_data(:,1:40) = aud_data_1;
        aud_data(:,41:80) = aud_data_2;
        speaker_label_1 = aud_MFCC_speaker_100(1333,1:40);
        speaker_label_2 = aud_MFCC_speaker_100(1333,61:100);
        speaker_label(:,1:40) = speaker_label_1;
        speaker_label(:,41:80) = speaker_label_2;
    elseif speech_label == 4
        aud_data_1 = aud_MFCC_speaker_100(1:1332,1:60);
        aud_data_2 = aud_MFCC_speaker_100(1:1332,81:100);
        aud_data(:,1:60) = aud_data_1;
        aud_data(:,61:80) = aud_data_2;
        speaker_label_1 = aud_MFCC_speaker_100(1333,1:60);
        speaker_label_2 = aud_MFCC_speaker_100(1333,81:100);
        speaker_label(:,1:60) = speaker_label_1;
        speaker_label(:,61:80) = speaker_label_2;
    else
        aud_data = aud_MFCC_speaker_100(1:1332,1:80);
        speaker_label = aud_MFCC_speaker_100(1333,1:80);
    end
    
     %ERROR calculation for CC w = 10000,1NN
    found_labels_MFCC_1_100 = KNN(inx,aud_data,speaker_label,1);
    if found_labels_MFCC_1_100 == T_speaker_label
        Error_MFCC_1_speaker_100 = Error_MFCC_1_speaker_100 + 0;
    else
        if T_speaker_label == 11
        Error_MFCC_1_11_speaker_100 = Error_MFCC_1_11_speaker_100 + 1;
        elseif T_speaker_label == 12
        Error_MFCC_1_12_speaker_100 = Error_MFCC_1_12_speaker_100 + 1;
        elseif T_speaker_label == 13
        Error_MFCC_1_13_speaker_100 = Error_MFCC_1_13_speaker_100 + 1;
        else
        Error_MFCC_1_14_speaker_100 = Error_MFCC_1_14_speaker_100 + 1;
        end
        Error_MFCC_1_speaker_100 = Error_MFCC_1_11_speaker_100 + Error_MFCC_1_12_speaker_100 + Error_MFCC_1_13_speaker_100 +Error_MFCC_1_14_speaker_100;
    end
    
     %ERROR calculation for CC w =10000 ,5NN
    found_labels_MFCC_5_100 = KNN(inx,aud_data,speaker_label,5);
    if found_labels_MFCC_5_100 == T_speaker_label
        Error_MFCC_5_speaker_100 = Error_MFCC_5_speaker_100 + 0;
    else
        if T_speaker_label == 11
        Error_MFCC_5_11_speaker_100 = Error_MFCC_5_11_speaker_100 + 1;
        elseif T_speaker_label == 12
        Error_MFCC_5_12_speaker_100 = Error_MFCC_5_12_speaker_100 + 1;
        elseif T_speaker_label == 13
        Error_MFCC_5_13_speaker_100 = Error_MFCC_5_13_speaker_100 + 1;
        else
        Error_MFCC_5_14_speaker_100 = Error_MFCC_5_14_speaker_100 + 1;
        end
        Error_MFCC_5_speaker_100 = Error_MFCC_5_11_speaker_100 + Error_MFCC_5_12_speaker_100 + Error_MFCC_5_13_speaker_100 +Error_MFCC_5_14_speaker_100;
    end
end

% CC W = 10000--------accuracy calculation for speaker recognition
Acc_MFCC_1_11_speaker_100 = ((25-Error_MFCC_1_11_speaker_100) * 100 )/ 25;
Acc_MFCC_1_12_speaker_100 = ((25-Error_MFCC_1_12_speaker_100) * 100 )/ 25;
Acc_MFCC_1_13_speaker_100 = ((25-Error_MFCC_1_13_speaker_100) * 100 )/ 25;
Acc_MFCC_1_14_speaker_100 = ((25-Error_MFCC_1_14_speaker_100) * 100 )/ 25;
Acc_MFCC_1_speaker_100 = ((100-Error_MFCC_1_speaker_100) * 100 )/ 100;

Acc_MFCC_5_11_speaker_100 = ((25-Error_MFCC_5_11_speaker_100) * 100 )/ 25;
Acc_MFCC_5_12_speaker_100 = ((25-Error_MFCC_5_12_speaker_100) * 100 )/ 25;
Acc_MFCC_5_13_speaker_100 = ((25-Error_MFCC_5_13_speaker_100) * 100 )/ 25;
Acc_MFCC_5_14_speaker_100 = ((25-Error_MFCC_5_14_speaker_100) * 100 )/ 25;
Acc_MFCC_5_speaker_100 = ((100-Error_MFCC_5_speaker_100) * 100 )/ 100;

%-------SPEAKER RECOGNITION------KNN & accuracy calculation----end--------

%=========================================================================

%==============================MFCC W = 500============================
%-----------SPEECH RECOGNITION------KNN & accuracy calculation-------
%Define Error 
Error_MFCC_1_1_speech_500 = 0;
Error_MFCC_1_2_speech_500 = 0;
Error_MFCC_1_3_speech_500 = 0;
Error_MFCC_1_4_speech_500 = 0;
Error_MFCC_1_5_speech_500 = 0;
Error_MFCC_1_speech_500 = 0;
Error_MFCC_5_1_speech_500 = 0;
Error_MFCC_5_2_speech_500 = 0;
Error_MFCC_5_3_speech_500 = 0;
Error_MFCC_5_4_speech_500 = 0;
Error_MFCC_5_5_speech_500 = 0;
Error_MFCC_5_speech_500 = 0;


%KNN start
for i = 1:100
    inx = aud_MFCC_speech_500(1:264,i);
    speaker_label = aud_MFCC_speech_500(265,i);
    T_speech_label = aud_MFCC_speech_500(266,i);
    aud_data = zeros(264,75);
    
    if speaker_label == 11
        aud_data = aud_MFCC_speech_500(1:264,26:100);
        speech_label = aud_MFCC_speech_500(266,26:100);
    elseif speaker_label == 12
        aud_data_1 = aud_MFCC_speech_500(1:264,1:25);
        aud_data_2 = aud_MFCC_speech_500(1:264,51:100);
        aud_data(:,1:25) = aud_data_1;
        aud_data(:,26:75) = aud_data_2;
        speech_label_1 = aud_MFCC_speech_500(266,1:25);
        speech_label_2 = aud_MFCC_speech_500(266,51:100);
        speech_label(:,1:25) = speech_label_1;
        speech_label(:,26:75)= speech_label_2;
    elseif speaker_label == 13
        aud_data_1 = aud_MFCC_speech_500(1:264,1:50);
        aud_data_2 = aud_MFCC_speech_500(1:264,76:100);
        aud_data(:,1:50) = aud_data_1;
        aud_data(:,51:75) = aud_data_2;
        speech_label_1 = aud_MFCC_speech_500(266,1:50);
        speech_label_2 = aud_MFCC_speech_500(266,76:100);
        speech_label(:,1:50) = speech_label_1;
        speech_label(:,51:75)= speech_label_2;
    else 
        aud_data = aud_MFCC_speech_500(1:264,1:75);
        speech_label = aud_MFCC_speech_500(266,1:75);
    end
    
    %ERROR calculation for raw,1NN
    found_labels_MFCC_500 = KNN(inx,aud_data,speech_label,1);
    if found_labels_MFCC_500 == T_speech_label
        Error_MFCC_1_speech_500 = Error_MFCC_1_speech_500 + 0;
    else
        if T_speech_label == 1
        Error_MFCC_1_1_speech_500 = Error_MFCC_1_1_speech_500 + 1;
        elseif T_speech_label == 2
        Error_MFCC_1_2_speech_500 = Error_MFCC_1_2_speech_500 + 1;
        elseif T_speech_label == 3
        Error_MFCC_1_3_speech_500 = Error_MFCC_1_3_speech_500 + 1;
        elseif T_speech_label == 4 
        Error_MFCC_1_4_speech_500 = Error_MFCC_1_4_speech_500 + 1;
        else
        Error_MFCC_1_5_speech_500 = Error_MFCC_1_5_speech_500 + 1;
        end
        Error_MFCC_1_speech_500 = Error_MFCC_1_1_speech_500 + Error_MFCC_1_2_speech_500 + Error_MFCC_1_3_speech_500 +Error_MFCC_1_4_speech_500+Error_MFCC_1_5_speech_500;
    end
    
    %ERROR calculation for raw,5NN
    found_labels_MFCC_500_5 = KNN(inx,aud_data,speech_label,5);
    if found_labels_MFCC_500_5 == T_speech_label
        Error_MFCC_5_speech_500 = Error_MFCC_5_speech_500 + 0;
    else
        if T_speech_label == 1
        Error_MFCC_5_1_speech_500 = Error_MFCC_5_1_speech_500 + 1;
        elseif T_speech_label == 2
        Error_MFCC_5_2_speech_500 = Error_MFCC_5_2_speech_500 + 1;
        elseif T_speech_label == 3
        Error_MFCC_5_3_speech_500 = Error_MFCC_5_3_speech_500 + 1;
        elseif T_speech_label == 4 
        Error_MFCC_5_4_speech_500 = Error_MFCC_5_4_speech_500 + 1;
        else
        Error_MFCC_5_5_speech_500 = Error_MFCC_5_5_speech_500 + 1;
        end
        Error_MFCC_5_speech_500 = Error_MFCC_5_1_speech_500 + Error_MFCC_5_2_speech_500 + Error_MFCC_5_3_speech_500 +Error_MFCC_5_4_speech_500+Error_MFCC_5_5_speech_500;
    end
    
end
% RAW--------accuracy calculation for speech recognition
Acc_MFCC_1_1_speech_500 = ((20-Error_MFCC_1_1_speech_500) * 100 )/ 20;
Acc_MFCC_1_2_speech_500 = ((20-Error_MFCC_1_2_speech_500) * 100 )/ 20;
Acc_MFCC_1_3_speech_500 = ((20-Error_MFCC_1_3_speech_500) * 100 )/ 20;
Acc_MFCC_1_4_speech_500 = ((20-Error_MFCC_1_4_speech_500) * 100 )/ 20;
Acc_MFCC_1_5_speech_500 = ((20-Error_MFCC_1_5_speech_500) * 100 )/ 20;
Acc_MFCC_1_speech_500 = ((100-Error_MFCC_1_speech_500) * 100 )/ 100;

Acc_MFCC_5_1_speech_500 = ((20-Error_MFCC_5_1_speech_500) * 100 )/ 20;
Acc_MFCC_5_2_speech_500 = ((20-Error_MFCC_5_2_speech_500) * 100 )/ 20;
Acc_MFCC_5_3_speech_500 = ((20-Error_MFCC_5_3_speech_500) * 100 )/ 20;
Acc_MFCC_5_4_speech_500 = ((20-Error_MFCC_5_4_speech_500) * 100 )/ 20;
Acc_MFCC_5_5_speech_500 = ((20-Error_MFCC_5_5_speech_500) * 100 )/ 20;
Acc_MFCC_5_speech_500 = ((100-Error_MFCC_5_speech_500) * 100 )/ 100;

%--------SPEECH RECOGNITION------KNN & accuracy calculation-- end---------

%-------SPEAKER RECOGNITION------KNN & accuracy calculation----start------

%Define Error 
Error_MFCC_1_11_speaker_500 = 0;
Error_MFCC_1_12_speaker_500 = 0;
Error_MFCC_1_13_speaker_500 = 0;
Error_MFCC_1_14_speaker_500 = 0;
Error_MFCC_1_speaker_500 = 0;
Error_MFCC_5_11_speaker_500= 0;
Error_MFCC_5_12_speaker_500 = 0;
Error_MFCC_5_13_speaker_500 = 0;
Error_MFCC_5_14_speaker_500 = 0;
Error_MFCC_5_speaker_500 = 0;

for i = 1:100
    inx = aud_MFCC_speaker_500(1:264,i);
    speech_label = aud_MFCC_speaker_500(266,i);
    T_speaker_label = aud_MFCC_speaker_500(265,i);
    aud_data = zeros(264,80);
    
    if speech_label == 1
        aud_data = aud_MFCC_speaker_500(1:264,21:100);
        speaker_label = aud_MFCC_speaker_500(265,21:100);
    elseif speech_label == 2
        aud_data_1 = aud_MFCC_speaker_500(1:264,1:20);
        aud_data_2 = aud_MFCC_speaker_500(1:264,41:100);
        aud_data(:,1:20) = aud_data_1;
        aud_data(:,21:80) = aud_data_2;
        speaker_label_1 = aud_MFCC_speaker_500(265,1:20);
        speaker_label_2 = aud_MFCC_speaker_500(265,41:100);
        speaker_label(:,1:20) = speaker_label_1;
        speaker_label(:,21:80) = speaker_label_2;
    elseif speech_label == 3
        aud_data_1 = aud_MFCC_speaker_500(1:264,1:40);
        aud_data_2 = aud_MFCC_speaker_500(1:264,61:100);
        aud_data(:,1:40) = aud_data_1;
        aud_data(:,41:80) = aud_data_2;
        speaker_label_1 = aud_MFCC_speaker_500(265,1:40);
        speaker_label_2 = aud_MFCC_speaker_500(265,61:100);
        speaker_label(:,1:40) = speaker_label_1;
        speaker_label(:,41:80) = speaker_label_2;
    elseif speech_label == 4
        aud_data_1 = aud_MFCC_speaker_500(1:264,1:60);
        aud_data_2 = aud_MFCC_speaker_500(1:264,81:100);
        aud_data(:,1:60) = aud_data_1;
        aud_data(:,61:80) = aud_data_2;
        speaker_label_1 = aud_MFCC_speaker_500(265,1:60);
        speaker_label_2 = aud_MFCC_speaker_500(265,81:100);
        speaker_label(:,1:60) = speaker_label_1;
        speaker_label(:,61:80) = speaker_label_2;
    else
        aud_data = aud_MFCC_speaker_500(1:264,1:80);
        speaker_label = aud_MFCC_speaker_500(265,1:80);
    end
    
     %ERROR calculation for CC w = 500,1NN
    found_labels_MFCC_1_10000 = KNN(inx,aud_data,speaker_label,1);
    if found_labels_MFCC_1_10000 == T_speaker_label
        Error_MFCC_1_speaker_500 = Error_MFCC_1_speaker_500 + 0;
    else
        if T_speaker_label == 11
        Error_MFCC_1_11_speaker_500 = Error_MFCC_1_11_speaker_500 + 1;
        elseif T_speaker_label == 12
        Error_MFCC_1_12_speaker_500 = Error_MFCC_1_12_speaker_500 + 1;
        elseif T_speaker_label == 13
        Error_MFCC_1_13_speaker_500 = Error_MFCC_1_13_speaker_500 + 1;
        else
        Error_MFCC_1_14_speaker_500 = Error_MFCC_1_14_speaker_500 + 1;
        end
        Error_MFCC_1_speaker_500 = Error_MFCC_1_11_speaker_500 + Error_MFCC_1_12_speaker_500 + Error_MFCC_1_13_speaker_500 +Error_MFCC_1_14_speaker_500;
    end
    
     %ERROR calculation for CC w =500 ,5NN
    found_labels_MFCC_5_10000 = KNN(inx,aud_data,speaker_label,5);
    if found_labels_MFCC_5_10000 == T_speaker_label
        Error_MFCC_5_speaker_500 = Error_MFCC_5_speaker_500 + 0;
    else
        if T_speaker_label == 11
        Error_MFCC_5_11_speaker_500 = Error_MFCC_5_11_speaker_500 + 1;
        elseif T_speaker_label == 12
        Error_MFCC_5_12_speaker_500 = Error_MFCC_5_12_speaker_500 + 1;
        elseif T_speaker_label == 13
        Error_MFCC_5_13_speaker_500 = Error_MFCC_5_13_speaker_500 + 1;
        else
        Error_MFCC_5_14_speaker_500 = Error_MFCC_5_14_speaker_500 + 1;
        end
        Error_MFCC_5_speaker_500 = Error_MFCC_5_11_speaker_500 + Error_MFCC_5_12_speaker_500 + Error_MFCC_5_13_speaker_500 +Error_MFCC_5_14_speaker_500;
    end
end

% CC W = 500--------accuracy calculation for speaker recognition
Acc_MFCC_1_11_speaker_500 = ((25-Error_MFCC_1_11_speaker_500) * 100 )/ 25;
Acc_MFCC_1_12_speaker_500 = ((25-Error_MFCC_1_12_speaker_500) * 100 )/ 25;
Acc_MFCC_1_13_speaker_500 = ((25-Error_MFCC_1_13_speaker_500) * 100 )/ 25;
Acc_MFCC_1_14_speaker_500 = ((25-Error_MFCC_1_14_speaker_500) * 100 )/ 25;
Acc_MFCC_1_speaker_500 = ((100-Error_MFCC_1_speaker_500) * 100 )/ 100;

Acc_MFCC_5_11_speaker_500 = ((25-Error_MFCC_5_11_speaker_500) * 100 )/ 25;
Acc_MFCC_5_12_speaker_500 = ((25-Error_MFCC_5_12_speaker_500) * 100 )/ 25;
Acc_MFCC_5_13_speaker_500 = ((25-Error_MFCC_5_13_speaker_500) * 100 )/ 25;
Acc_MFCC_5_14_speaker_500 = ((25-Error_MFCC_5_14_speaker_500) * 100 )/ 25;
Acc_MFCC_5_speaker_500 = ((100-Error_MFCC_5_speaker_500) * 100 )/ 100;



%==============================MFCC W =10000=================================
%-----------SPEECH RECOGNITION------KNN & accuracy calculation---start----
Error_MFCC_1_1_speech_10000 = 0;
Error_MFCC_1_2_speech_10000 = 0;
Error_MFCC_1_3_speech_10000 = 0;
Error_MFCC_1_4_speech_10000 = 0;
Error_MFCC_1_5_speech_10000 = 0;
Error_MFCC_1_speech_10000 = 0;
Error_MFCC_5_1_speech_10000 = 0;
Error_MFCC_5_2_speech_10000 = 0;
Error_MFCC_5_3_speech_10000 = 0;
Error_MFCC_5_4_speech_10000 = 0;
Error_MFCC_5_5_speech_10000 = 0;
Error_MFCC_5_speech_10000 = 0;


%KNN start
for i = 1:100
    inx = aud_MFCC_speech_10000(1:12,i);
    speaker_label = aud_MFCC_speech_10000(13,i);
    T_speech_label = aud_MFCC_speech_10000(14,i);
    aud_data = zeros(12,75);
    
    if speaker_label == 11
        aud_data = aud_MFCC_speech_10000(1:12,26:100);
        speech_label = aud_MFCC_speech_10000(14,26:100);
    elseif speaker_label == 12
        aud_data_1 = aud_MFCC_speech_10000(1:12,1:25);
        aud_data_2 = aud_MFCC_speech_10000(1:12,51:100);
        aud_data(:,1:25) = aud_data_1;
        aud_data(:,26:75) = aud_data_2;
        speech_label_1 = aud_MFCC_speech_10000(14,1:25);
        speech_label_2 = aud_MFCC_speech_10000(14,51:100);
        speech_label(:,1:25) = speech_label_1;
        speech_label(:,26:75)= speech_label_2;
    elseif speaker_label == 13
        aud_data_1 = aud_MFCC_speech_10000(1:12,1:50);
        aud_data_2 = aud_MFCC_speech_10000(1:12,76:100);
        aud_data(:,1:50) = aud_data_1;
        aud_data(:,51:75) = aud_data_2;
        speech_label_1 = aud_MFCC_speech_10000(14,1:50);
        speech_label_2 = aud_MFCC_speech_10000(14,76:100);
        speech_label(:,1:50) = speech_label_1;
        speech_label(:,51:75)= speech_label_2;
    else 
        aud_data = aud_MFCC_speech_10000(1:12,1:75);
        speech_label = aud_MFCC_speech_10000(14,1:75);
    end
    
    %ERROR calculation for raw,1NN
    found_labels_MFCC_10000 = KNN(inx,aud_data,speech_label,1);
    if found_labels_MFCC_10000 == T_speech_label
        Error_MFCC_1_speech_10000 = Error_MFCC_1_speech_10000 + 0;
    else
        if T_speech_label == 1
        Error_MFCC_1_1_speech_10000 = Error_MFCC_1_1_speech_10000 + 1;
        elseif T_speech_label == 2
        Error_MFCC_1_2_speech_10000 = Error_MFCC_1_2_speech_10000 + 1;
        elseif T_speech_label == 3
        Error_MFCC_1_3_speech_10000 = Error_MFCC_1_3_speech_10000 + 1;
        elseif T_speech_label == 4 
        Error_MFCC_1_4_speech_10000 = Error_MFCC_1_4_speech_10000 + 1;
        else
        Error_MFCC_1_5_speech_10000 = Error_MFCC_1_5_speech_10000 + 1;
        end
        Error_MFCC_1_speech_10000 = Error_MFCC_1_1_speech_10000 + Error_MFCC_1_2_speech_10000 + Error_MFCC_1_3_speech_10000 +Error_MFCC_1_4_speech_10000+Error_MFCC_1_5_speech_10000;
    end
    
    %ERROR calculation for raw,5NN
    found_labels_MFCC_10000_5 = KNN(inx,aud_data,speech_label,5);
    if found_labels_MFCC_10000_5 == T_speech_label
        Error_MFCC_5_speech_10000 = Error_MFCC_5_speech_10000 + 0;
    else
        if T_speech_label == 1
        Error_MFCC_5_1_speech_10000 = Error_MFCC_5_1_speech_10000 + 1;
        elseif T_speech_label == 2
        Error_MFCC_5_2_speech_10000 = Error_MFCC_5_2_speech_10000 + 1;
        elseif T_speech_label == 3
        Error_MFCC_5_3_speech_10000 = Error_MFCC_5_3_speech_10000 + 1;
        elseif T_speech_label == 4 
        Error_MFCC_5_4_speech_10000 = Error_MFCC_5_4_speech_10000 + 1;
        else
        Error_MFCC_5_5_speech_10000 = Error_MFCC_5_5_speech_10000 + 1;
        end
        Error_MFCC_5_speech_10000 = Error_MFCC_5_1_speech_10000 + Error_MFCC_5_2_speech_10000 + Error_MFCC_5_3_speech_10000 +Error_MFCC_5_4_speech_10000+Error_MFCC_5_5_speech_10000;
    end
    
end
% RAW--------accuracy calculation for speech recognition
Acc_MFCC_1_1_speech_10000 = ((20-Error_MFCC_1_1_speech_10000) * 100 )/ 20;
Acc_MFCC_1_2_speech_10000 = ((20-Error_MFCC_1_2_speech_10000) * 100 )/ 20;
Acc_MFCC_1_3_speech_10000 = ((20-Error_MFCC_1_3_speech_10000) * 100 )/ 20;
Acc_MFCC_1_4_speech_10000 = ((20-Error_MFCC_1_4_speech_10000) * 100 )/ 20;
Acc_MFCC_1_5_speech_10000 = ((20-Error_MFCC_1_5_speech_10000) * 100 )/ 20;
Acc_MFCC_1_speech_10000 = ((100-Error_MFCC_1_speech_10000) * 100 )/ 100;

Acc_MFCC_5_1_speech_10000 = ((20-Error_MFCC_5_1_speech_10000) * 100 )/ 20;
Acc_MFCC_5_2_speech_10000 = ((20-Error_MFCC_5_2_speech_10000) * 100 )/ 20;
Acc_MFCC_5_3_speech_10000 = ((20-Error_MFCC_5_3_speech_10000) * 100 )/ 20;
Acc_MFCC_5_4_speech_10000 = ((20-Error_MFCC_5_4_speech_10000) * 100 )/ 20;
Acc_MFCC_5_5_speech_10000 = ((20-Error_MFCC_5_5_speech_10000) * 100 )/ 20;
Acc_MFCC_5_speech_10000 = ((100-Error_MFCC_5_speech_10000) * 100 )/ 100;

%-------SPEECH RECOGNITION------KNN & accuracy calculation----end---------

%-------SPEAKER RECOGNITION------KNN & accuracy calculation----start------

%Define Error 
Error_MFCC_1_11_speaker_10000 = 0;
Error_MFCC_1_12_speaker_10000 = 0;
Error_MFCC_1_13_speaker_10000 = 0;
Error_MFCC_1_14_speaker_10000 = 0;
Error_MFCC_1_speaker_10000 = 0;
Error_MFCC_5_11_speaker_10000= 0;
Error_MFCC_5_12_speaker_10000 = 0;
Error_MFCC_5_13_speaker_10000 = 0;
Error_MFCC_5_14_speaker_10000 = 0;
Error_MFCC_5_speaker_10000 = 0;

for i = 1:100
    inx = aud_MFCC_speaker_10000(1:12,i);
    speech_label = aud_MFCC_speaker_10000(14,i);
    T_speaker_label = aud_MFCC_speaker_10000(13,i);
    aud_data = zeros(12,80);
    
    if speech_label == 1
        aud_data = aud_MFCC_speaker_10000(1:12,21:100);
        speaker_label = aud_MFCC_speaker_10000(13,21:100);
    elseif speech_label == 2
        aud_data_1 = aud_MFCC_speaker_10000(1:12,1:20);
        aud_data_2 = aud_MFCC_speaker_10000(1:12,41:100);
        aud_data(:,1:20) = aud_data_1;
        aud_data(:,21:80) = aud_data_2;
        speaker_label_1 = aud_MFCC_speaker_10000(13,1:20);
        speaker_label_2 = aud_MFCC_speaker_10000(13,41:100);
        speaker_label(:,1:20) = speaker_label_1;
        speaker_label(:,21:80) = speaker_label_2;
    elseif speech_label == 3
        aud_data_1 = aud_MFCC_speaker_10000(1:12,1:40);
        aud_data_2 = aud_MFCC_speaker_10000(1:12,61:100);
        aud_data(:,1:40) = aud_data_1;
        aud_data(:,41:80) = aud_data_2;
        speaker_label_1 = aud_MFCC_speaker_10000(13,1:40);
        speaker_label_2 = aud_MFCC_speaker_10000(13,61:100);
        speaker_label(:,1:40) = speaker_label_1;
        speaker_label(:,41:80) = speaker_label_2;
    elseif speech_label == 4
        aud_data_1 = aud_MFCC_speaker_10000(1:12,1:60);
        aud_data_2 = aud_MFCC_speaker_10000(1:12,81:100);
        aud_data(:,1:60) = aud_data_1;
        aud_data(:,61:80) = aud_data_2;
        speaker_label_1 = aud_MFCC_speaker_10000(13,1:60);
        speaker_label_2 = aud_MFCC_speaker_10000(13,81:100);
        speaker_label(:,1:60) = speaker_label_1;
        speaker_label(:,61:80) = speaker_label_2;
    else
        aud_data = aud_MFCC_speaker_10000(1:12,1:80);
        speaker_label = aud_MFCC_speaker_10000(13,1:80);
    end
    
     %ERROR calculation for MFCC w = 10000,1NN
    found_labels_MFCC_1_10000 = KNN(inx,aud_data,speaker_label,1);
    if found_labels_MFCC_1_10000 == T_speaker_label
        Error_MFCC_1_speaker_10000 = Error_MFCC_1_speaker_10000 + 0;
    else
        if T_speaker_label == 11
        Error_MFCC_1_11_speaker_10000 = Error_MFCC_1_11_speaker_10000 + 1;
        elseif T_speaker_label == 12
        Error_MFCC_1_12_speaker_10000 = Error_MFCC_1_12_speaker_10000 + 1;
        elseif T_speaker_label == 13
        Error_MFCC_1_13_speaker_10000 = Error_MFCC_1_13_speaker_10000 + 1;
        else
        Error_MFCC_1_14_speaker_10000 = Error_MFCC_1_14_speaker_10000 + 1;
        end
        Error_MFCC_1_speaker_10000 = Error_MFCC_1_11_speaker_10000 + Error_MFCC_1_12_speaker_10000 + Error_MFCC_1_13_speaker_10000 +Error_MFCC_1_14_speaker_10000;
    end
    
     %ERROR calculation for MFCC w =10000 ,5NN
    found_labels_MFCC_5_10000 = KNN(inx,aud_data,speaker_label,5);
    if found_labels_MFCC_5_10000 == T_speaker_label
        Error_MFCC_5_speaker_10000 = Error_MFCC_5_speaker_10000 + 0;
    else
        if T_speaker_label == 11
        Error_MFCC_5_11_speaker_10000 = Error_MFCC_5_11_speaker_10000 + 1;
        elseif T_speaker_label == 12
        Error_MFCC_5_12_speaker_10000 = Error_MFCC_5_12_speaker_10000 + 1;
        elseif T_speaker_label == 13
        Error_MFCC_5_13_speaker_10000 = Error_MFCC_5_13_speaker_10000 + 1;
        else
        Error_MFCC_5_14_speaker_10000 = Error_MFCC_5_14_speaker_10000 + 1;
        end
        Error_MFCC_5_speaker_10000 = Error_MFCC_5_11_speaker_10000 + Error_MFCC_5_12_speaker_10000 + Error_MFCC_5_13_speaker_10000 +Error_MFCC_5_14_speaker_10000;
    end
end

% CC W = 10000--------accuracy calculation for speaker recognition
Acc_MFCC_1_11_speaker_10000 = ((25-Error_MFCC_1_11_speaker_10000) * 100 )/ 25;
Acc_MFCC_1_12_speaker_10000 = ((25-Error_MFCC_1_12_speaker_10000) * 100 )/ 25;
Acc_MFCC_1_13_speaker_10000 = ((25-Error_MFCC_1_13_speaker_10000) * 100 )/ 25;
Acc_MFCC_1_14_speaker_10000 = ((25-Error_MFCC_1_14_speaker_10000) * 100 )/ 25;
Acc_MFCC_1_speaker_10000 = ((100-Error_MFCC_1_speaker_10000) * 100 )/ 100;

Acc_MFCC_5_11_speaker_10000 = ((25-Error_MFCC_5_11_speaker_10000) * 100 )/ 25;
Acc_MFCC_5_12_speaker_10000 = ((25-Error_MFCC_5_12_speaker_10000) * 100 )/ 25;
Acc_MFCC_5_13_speaker_10000 = ((25-Error_MFCC_5_13_speaker_10000) * 100 )/ 25;
Acc_MFCC_5_14_speaker_10000 = ((25-Error_MFCC_5_14_speaker_10000) * 100 )/ 25;
Acc_MFCC_5_speaker_10000 = ((100-Error_MFCC_5_speaker_10000) * 100 )/ 100;

%-------SPEAKER RECOGNITION------KNN & accuracy calculation----end--------

%=========================================================================



disp('Cepstrum')
disp('Speech Recognition')
disp('1-NN')
disp('    raw  w=100 w=500 w=1000')
D11 = [Acc_raw_1_1_speech,Acc_CC_1_1_speech_100,Acc_CC_1_1_speech_500,Acc_CC_1_1_speech_10000;Acc_raw_1_2_speech,Acc_CC_1_2_speech_100,Acc_CC_1_2_speech_500,Acc_CC_1_2_speech_10000;Acc_raw_1_3_speech,Acc_CC_1_3_speech_100,Acc_CC_1_3_speech_500,Acc_CC_1_3_speech_10000;Acc_raw_1_4_speech,Acc_CC_1_4_speech_100,Acc_CC_1_4_speech_500,Acc_CC_1_4_speech_10000;Acc_raw_1_5_speech,Acc_CC_1_5_speech_100,Acc_CC_1_5_speech_500,Acc_CC_1_5_speech_10000;Acc_raw_1_speech,Acc_CC_1_speech_100,Acc_CC_1_speech_500,Acc_CC_1_speech_10000];
disp(D11)
disp('_____________________________________________________')
disp('')

disp('Cepstrum')
disp('Speech Recognition')
disp('5-NN')
disp('    raw  w=100 w=500 w=1000')
D15 = [Acc_raw_5_1_speech,Acc_CC_5_1_speech_100,Acc_CC_5_1_speech_500,Acc_CC_5_1_speech_10000;Acc_raw_5_2_speech,Acc_CC_5_2_speech_100,Acc_CC_5_2_speech_500,Acc_CC_5_2_speech_10000;Acc_raw_5_3_speech,Acc_CC_5_3_speech_100,Acc_CC_5_3_speech_500,Acc_CC_5_3_speech_10000;Acc_raw_5_4_speech,Acc_CC_5_4_speech_100,Acc_CC_5_4_speech_500,Acc_CC_5_4_speech_10000;Acc_raw_5_5_speech,Acc_CC_5_5_speech_100,Acc_CC_5_5_speech_500,Acc_CC_5_5_speech_10000;Acc_raw_5_speech,Acc_CC_5_speech_100,Acc_CC_5_speech_500,Acc_CC_5_speech_10000];
disp(D15)
disp('_____________________________________________________')
disp('')

disp('Cepstrum')
disp('Speaker Recognition')
disp('1-NN')
disp('    raw  w=100 w=500 w=1000')
D21 = [Acc_raw_1_11_speaker,Acc_CC_1_11_speaker_100,Acc_CC_1_11_speaker_500,Acc_CC_1_11_speaker_10000;Acc_raw_1_12_speaker,Acc_CC_1_12_speaker_100,Acc_CC_1_12_speaker_500,Acc_CC_1_12_speaker_10000;Acc_raw_1_13_speaker,Acc_CC_1_13_speaker_100,Acc_CC_1_13_speaker_500,Acc_CC_1_13_speaker_10000;Acc_raw_1_14_speaker,Acc_CC_1_14_speaker_100,Acc_CC_1_14_speaker_500,Acc_CC_1_14_speaker_10000;Acc_raw_1_speaker,Acc_CC_1_speaker_100,Acc_CC_1_speaker_500,Acc_CC_1_speaker_10000];
disp(D21)
disp('_____________________________________________________')
disp('')

disp('Cepstrum')
disp('Speaker Recognition')
disp('5-NN')
disp('    raw  w=100 w=500 w=1000')
D25 = [Acc_raw_5_11_speaker,Acc_CC_5_11_speaker_100,Acc_CC_5_11_speaker_500,Acc_CC_5_11_speaker_10000;Acc_raw_5_12_speaker,Acc_CC_5_12_speaker_100,Acc_CC_5_12_speaker_500,Acc_CC_5_12_speaker_10000;Acc_raw_5_13_speaker,Acc_CC_5_13_speaker_100,Acc_CC_5_13_speaker_500,Acc_CC_5_13_speaker_10000;Acc_raw_5_14_speaker,Acc_CC_5_14_speaker_100,Acc_CC_5_14_speaker_500,Acc_CC_5_14_speaker_10000;Acc_raw_5_speaker,Acc_CC_5_speaker_100,Acc_CC_5_speaker_500,Acc_CC_5_speaker_10000];
disp(D25)
disp('_____________________________________________________')
disp('')

disp('MFCC')
disp('Speech Recognition')
disp('1-NN')
disp('    raw  w=100 w=500 w=1000')
D31 = [Acc_raw_1_1_speech,Acc_MFCC_1_1_speech_100,Acc_MFCC_1_1_speech_500,Acc_MFCC_1_1_speech_10000;Acc_raw_1_2_speech,Acc_MFCC_1_2_speech_100,Acc_MFCC_1_2_speech_500,Acc_MFCC_1_2_speech_10000;Acc_raw_1_3_speech,Acc_MFCC_1_3_speech_100,Acc_MFCC_1_3_speech_500,Acc_MFCC_1_3_speech_10000;Acc_raw_1_4_speech,Acc_MFCC_1_4_speech_100,Acc_MFCC_1_4_speech_500,Acc_MFCC_1_4_speech_10000;Acc_raw_1_5_speech,Acc_MFCC_1_5_speech_100,Acc_MFCC_1_5_speech_500,Acc_MFCC_1_5_speech_10000;Acc_raw_1_speech,Acc_MFCC_1_speech_100,Acc_MFCC_1_speech_500,Acc_MFCC_1_speech_10000];
disp(D31)
disp('_____________________________________________________')
disp('')

disp('MFCC')
disp('Speech Recognition')
disp('5-NN')
disp('    raw  w=100 w=500 w=1000')
D35 = [Acc_raw_5_1_speech,Acc_MFCC_5_1_speech_100,Acc_MFCC_5_1_speech_500,Acc_MFCC_5_1_speech_10000;Acc_raw_5_2_speech,Acc_MFCC_5_2_speech_100,Acc_MFCC_5_2_speech_500,Acc_MFCC_5_2_speech_10000;Acc_raw_5_3_speech,Acc_MFCC_5_3_speech_100,Acc_MFCC_5_3_speech_500,Acc_MFCC_5_3_speech_10000;Acc_raw_5_4_speech,Acc_MFCC_5_4_speech_100,Acc_MFCC_5_4_speech_500,Acc_MFCC_5_4_speech_10000;Acc_raw_5_5_speech,Acc_MFCC_5_5_speech_100,Acc_MFCC_5_5_speech_500,Acc_MFCC_5_5_speech_10000;Acc_raw_5_speech,Acc_MFCC_5_speech_100,Acc_MFCC_5_speech_500,Acc_MFCC_5_speech_10000];
disp(D35)
disp('_____________________________________________________')
disp('')

disp('MFCC')
disp('Speaker Recognition')
disp('1-NN')
disp('    raw  w=100 w=500 w=1000')
D41 = [Acc_raw_1_11_speaker,Acc_MFCC_1_11_speaker_100,Acc_MFCC_1_11_speaker_500,Acc_MFCC_1_11_speaker_10000;Acc_raw_1_12_speaker,Acc_MFCC_1_12_speaker_100,Acc_MFCC_1_12_speaker_500,Acc_MFCC_1_12_speaker_10000;Acc_raw_1_13_speaker,Acc_MFCC_1_13_speaker_100,Acc_MFCC_1_13_speaker_500,Acc_MFCC_1_13_speaker_10000;Acc_raw_1_14_speaker,Acc_MFCC_1_14_speaker_100,Acc_MFCC_1_14_speaker_500,Acc_MFCC_1_14_speaker_10000;Acc_raw_1_speaker,Acc_MFCC_1_speaker_100,Acc_MFCC_1_speaker_500,Acc_MFCC_1_speaker_10000];
disp(D41)
disp('_____________________________________________________')
disp('')

disp('MFCC')
disp('Speaker Recognition')
disp('5-NN')
disp('    raw  w=100 w=500 w=1000')
D45 = [Acc_raw_5_11_speaker,Acc_MFCC_5_11_speaker_100,Acc_MFCC_5_11_speaker_500,Acc_MFCC_5_11_speaker_10000;Acc_raw_5_12_speaker,Acc_MFCC_5_12_speaker_100,Acc_MFCC_5_12_speaker_500,Acc_MFCC_5_12_speaker_10000;Acc_raw_5_13_speaker,Acc_MFCC_5_13_speaker_100,Acc_MFCC_5_13_speaker_500,Acc_MFCC_5_13_speaker_10000;Acc_raw_5_14_speaker,Acc_MFCC_5_14_speaker_100,Acc_MFCC_5_14_speaker_500,Acc_MFCC_5_14_speaker_10000;Acc_raw_5_speaker,Acc_MFCC_5_speaker_100,Acc_MFCC_5_speaker_500,Acc_MFCC_5_speaker_10000];
disp(D45)
disp('_____________________________________________________')
disp('')