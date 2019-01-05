
datadir = '/Users/mingqindai/Documents/MATLAB/mp7';
ANNresults = importdata('ANNresults.mat');
results  = ANNresults;
img  = imread('mouth.jpg');

import_data = importdata('ECE417_MP5_AV_Data.mat');
%read in ANN train data
AV_train = import_data.av_train;
avTrainingDat = AV_train;
% av_train_aud = AV_train.audio;
% av_train_vis = AV_train.visual;
%read in 
AV_validate = import_data.av_validate;
avValidateData = AV_validate;
% av_validate_aud = AV_validate.audio;
% av_validate_vis = AV_validate.visual;
%read in silencemodel
silenceModel = import_data.silenceModel;
%read in test data
test_aud = import_data.testAudio;
[N,T] = size(test_aud);

%read in mesh
mesh_data = importdata('mesh.txt');
mesh_vertices = mesh_data(2:67);
mesh_triangles = mesh_data(69:194);

vertices_mtx = zeros(33,2);
L = mesh_data(1);
for i = 1:33
vertices_mtx(i,1) = mesh_vertices(2*i-1);
vertices_mtx(i,2) = mesh_vertices(2*i);
end
inVertX = vertices_mtx(:,1);
inVertY = vertices_mtx(:,2);

triangles_mtx = zeros(42,3);
M = mesh_data(68);
for i = 1:42
    triangles_mtx(i,1) = mesh_triangles(3*i-2);
    triangles_mtx(i,2) = mesh_triangles(3*i-1);
    triangles_mtx(i,3) = mesh_triangles(3*i);
end

vertices = {};
triangles = {};

vertices{1} = L;
for i = 1:33
    vertices{i+1} = vertices_mtx(i,:);
end

triangles{1} = M;
for i = 1:42
    triangles{i+1} = triangles_mtx(i,:);
end

neutral_w = 0;
neutral_h1 = 0;
neutral_h2 = 0;
fScale = 1;

%warp the image
nuetral_image = warpimg( img , inVertX', inVertY' , triangles , 0, 0, 0);

% write the video
 mkdir('image');
 vid_output = VideoWriter('mp7.avi');
 open(vid_output);
 %figure ;
%for i = 1:size(results,2)
    for i  = 1:100
    i
    w = results(1,i) ;
    h1 = results(2,i);
    h2 = results(3,i);
    
    num = sprintf('%04d',i);
    img_filename = ['image\test_' num '.jpg'];
    
    if w == 0 & h1 ==0 & h2 ==0
        imshow(uint8(nuetral_image));
        imwrite(uint8(nuetral_image) , img_filename)
    else
        output_img = warpimg( img , inVertX', inVertY' , triangles , w, h1, h2);
        imshow(uint8(output_img));
        imwrite(uint8(output_img) , img_filename)
    end
    
    % Write each frame to the file.
     Frame_now = getframe;
     writeVideo(vid_output,Frame_now);
end
    % Close the file.
% close(vidObj);