

datadir = '/Users/mingqindai/Documents/MATLAB/mp7';
mkdir(datadir,'image');
img = imread('mouth.jpg');

num = sprintf('%04d',1);
new_filename = ['test_' num '.jpg'];

directory = [datadir,'/image/'];
imwrite(img , [directory,new_filename]);

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



