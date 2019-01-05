
ANNresults = importdata('ANNresults.mat');
results = ANNresults;
datadir = '/Users/mingqindai/Documents/MATLAB/mp7';

img = imread('mouth.jpg');

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
% inVertX = vertices_mtx(:,1);
% inVertY = vertices_mtx(:,2);
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

neutral_w = 0;
neutral_h1 = 0;
neutral_h2 = 0;
fScale = 1;

% warp the neutral image
ntl_img = warpping(img, neutral_w, neutral_h1, neutral_h2, vertices_mtx', triangles , fScale);

% write the video
 mkdir(datadir,'image');
 directory = [datadir,'/image/'];
 writer = VideoWriter('test.avi');
 open(writer);
 %figure ;
for i = 1:size(results,2)
    i
    w = results(1,i) ;
    h1 = results(2,i);
    h2 = results(3,i);

    num = sprintf('%04d',i);
    new_filename = ['test_' num '.jpg'];
    
    if w == 0 && h1 ==0 && h2 ==0
        imshow(ntl_img);
        imwrite(ntl_img, [directory,new_filename]);
    else
        warpped_img = warpping(img, w, h1, h2, vertices_mtx', triangles, fScale);
        imshow(warpped_img);
        imwrite(warpped_img, [directory,new_filename]);
    end
    
    % Write each frame to the file.
     frame = getframe;
     writeVideo(writer,frame);
end
    % Close the file.
close(writer);



