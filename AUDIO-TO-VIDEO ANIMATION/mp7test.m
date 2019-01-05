

%============================read in data=================================
import_data = importdata('ECE417_MP5_AV_Data.mat');
%read in ANN train data
datadir = '/Users/mingqindai/Documents/MATLAB/mp7';
AV_train = import_data.av_train;
avTrainingDat = AV_train;

%read in av_validate
AV_validate = import_data.av_validate;
avValidateData = AV_validate;

%read in silencemodel
silenceModel = import_data.silenceModel;

%read in test data
test_aud = import_data.testAudio;
[N,T] = size(test_aud);

%read in mesh
mesh_data = importdata('mesh.txt');
mesh_vertices = mesh_data(2:67);
mesh_triangles = mesh_data(69:194);

%save vertices in cell (1x34)
vertices = {};
vertices_mtx = zeros(33,2);
L = mesh_data(1);
for i = 1:33
vertices_mtx(i,1) = mesh_vertices(2*i-1);
vertices_mtx(i,2) = mesh_vertices(2*i);
end
vertices{1} = L;
for i = 1:33
    vertices{i+1} = vertices_mtx(i,:);
end

%save triangles in cell(1x43)
triangles = {};
triangles_mtx = zeros(42,3);
M = mesh_data(68);
for i = 1:42
    triangles_mtx(i,1) = mesh_triangles(3*i-2);
    triangles_mtx(i,2) = mesh_triangles(3*i-1);
    triangles_mtx(i,3) = mesh_triangles(3*i);
end
triangles{1} = M;
for i = 1:42
    triangles{i+1} = triangles_mtx(i,:);
end

%=============================train ANN===================================

[mapping] = ECE417_MP5_train (avTrainingDat, avValidateData, silenceModel, 100, 'train_result.mat' );

%==============Pass test audio to find visual features=====================

[results] = ECE417_MP5_test (test_aud, silenceModel, mapping);

%=============warp mouth image and make video frame by frame===============

neutral_w = 0;
neutral_h1 = 0;
neutral_h2 = 0;
fScale = 1;
img = imread('mouth.jpg');

ntl_img = warpping(img, neutral_w, neutral_h1, neutral_h2, vertices_mtx', triangles , fScale);

% generate the video
mkdir(datadir,'image');
directory = [datadir,'/image/'];

writer = VideoWriter('test.avi');
open(writer);

for i = 1:size(results,2)
    i
    w = results(1,i) ;
    h1 = results(2,i);
    h2 = results(3,i);

    num = sprintf('%04d',i);
    new_filename = ['test_' num '.jpg'];
    
    warpped_img = warpping(img, w, h1, h2, vertices_mtx', triangles, fScale);
    imshow(warpped_img);
    imwrite(warpped_img, [directory,new_filename]);
    
    % Write each frame to the file.
     frame = getframe;
     writeVideo(writer,frame);
end
    % Close the file.
close(writer);
