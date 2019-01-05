function run
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

% train the neural network
 load('ECE417_MP5_AV_Data.mat') ;
ECE417_MP5_train ( av_train, av_validate, silenceModel, 200, 'train_result.mat' );

% % read the audio
load('train_result.mat');
testAudio = wavread('test.wav') ;
 
% generate the ceptrum
overlaped_frames = overlap_and_hamming( testAudio' , 1634 );
[ cepstrum_matrix ] = Cepstrum_calculate( overlaped_frames ,60);

% pass the test
[results] = ECE417_MP5_test ( cepstrum_matrix, silenceModel, mapping ) ;

% warp the image
nuetral_image = warpimg( im , vertices_x, vertices_y , triangles , 0, 0, 0);

% write the video
 mkdir('image');
 vidObj = VideoWriter('mp5.wmv');
 open(vidObj);
 figure ;
for ii = 1:size(results,2)
    ii
    tmp = results(:,ii);
    w = tmp(1) ;
    h1 = tmp(2);
    h2 = tmp(3);
    
    num = sprintf('%04d',ii);
    file_name = ['image\test_' num '.jpg'];
    
    if w == 0 & h1 ==0 & h2 ==0
        imshow(uint8(nuetral_image));
        imwrite(uint8(nuetral_image) , file_name)
    else
        output_image = warpimg( im , vertices_x, vertices_y , triangles , w, h1, h2);
        imshow(uint8(output_image));
        imwrite(uint8(output_image) , file_name)
    end
    
    % Write each frame to the file.
     currFrame = getframe;
     writeVideo(vidObj,currFrame);
end
    % Close the file.
close(vidObj);