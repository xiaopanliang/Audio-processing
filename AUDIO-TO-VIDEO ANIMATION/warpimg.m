function [tmp_im] = warpimg( im , vertices_x, vertices_y , triangles, w, h1, h2)
%UNTITLED4 Summary of this function goes here

% get the defromed mesh
[retVertX, retVertY] = interpVert(vertices_x, vertices_y, 0, 0, 0, w, h1, h2, 1);

tmp_im = zeros(size(im)) ;

% generate the warp image pixel by pixel
for jj = 1:size(im,1)
    for ii = 1:size(im,2)
        % examine which traingle it belongs
        for kk = 2:triangles{1}+1
        
            tmp = triangles{kk};
            boundary_points = ones(3,3);
            boundary_points(1,:) = retVertX(tmp) ;
            boundary_points(2,:) = retVertY(tmp) ;
            
            inner = [ii, jj, 1]' ;
            lambda = boundary_points\inner ;
            
            if min(lambda) >= 0
                point_x = vertices_x(tmp)*lambda ;
                point_y = vertices_y(tmp)*lambda ;
                
                % bilinear interpolation
                ratio_x = point_x-floor(point_x);
                ratio_y = point_y-floor(point_y);
                tmp_x = ratio_x*im(floor(point_y) , floor(point_x)) + (1-ratio_x)*im(floor(point_y) , ceil(point_x));
                tmp_y = ratio_x*im(ceil(point_y) , floor(point_x)) + (1-ratio_x)*im(ceil(point_y) , ceil(point_x));
                
                tmp_im(jj,ii) = ratio_y*tmp_x + (1-ratio_y)*tmp_y;
                tmp_im = uint8(tmp_im);
                break;
            end
        end
    end
end




end

