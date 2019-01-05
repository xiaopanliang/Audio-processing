ANNresults = importdata('ANNresults.mat');
im  = imread('mouth.jpg');

import_data = importdata('ECE417_MP5_AV_Data.mat');
test_aud = import_data.testAudio;

% function run
im = imread('mouth.jpg');
% figure ;
% imshow(im);
[vertices , triangles]  = read_mesh_file ;
vertices_x = zeros(1,vertices{1}) ;
vertices_y = zeros(1,vertices{1}) ;
for ii = 1:vertices{1}
    tmp_vertices = vertices{ii+1} ;
    vertices_x(1,ii) = tmp_vertices(1);
    vertices_y(1,ii) = tmp_vertices(2);
end