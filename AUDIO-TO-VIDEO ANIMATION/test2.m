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
import_data = importdata('ECE417_MP5_AV_Data.mat');

AV_train = import_data.av_train;
avTrainingDat = AV_train;

AV_validate = import_data.av_validate;
avValidateData = AV_validate;

silenceModel = import_data.silenceModel;

[mapping] = ECE417_MP5_train ( avTrainingDat, avValidateData, silenceModel, 100, 'train_result.mat' );

% find visual features from audio features
test_aud = import_data.testAudio;

%load('train_result.mat');

% pass the test
[results] = ECE417_MP5_test (test_aud, silenceModel, mapping ) ;

% % warp the image
% nuetral_image = warpimg( im , vertices_x, vertices_y , triangles , 0, 0, 0);
% 
% % write the video
%  mkdir('image');
%  vidObj = VideoWriter('mp5.wmv');
%  open(vidObj);
%  figure ;
% for ii = 1:size(results,2)
%     ii
%     tmp = results(:,ii);
%     w = tmp(1) ;
%     h1 = tmp(2);
%     h2 = tmp(3);
%     
%     num = sprintf('%04d',ii);
%     file_name = ['image\test_' num '.jpg'];
%     
%     if w == 0 & h1 ==0 & h2 ==0
%         imshow(uint8(nuetral_image));
%         imwrite(uint8(nuetral_image) , file_name)
%     else
%         output_image = warpimg( im , vertices_x, vertices_y , triangles , w, h1, h2);
%         imshow(uint8(output_image));
%         imwrite(uint8(output_image) , file_name)
%     end
%     
%     % Write each frame to the file.
%      currFrame = getframe;
%      writeVideo(vidObj,currFrame);
% end
%     % Close the file.
% % close(vidObj);