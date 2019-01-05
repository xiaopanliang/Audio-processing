function [vertices , triangles]  = read_mesh_file(  ) 
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

fid = fopen('mesh.txt');
file_content = {} ;
index = [] ;
while 1
            tline = fgetl(fid);
            if ~ischar(tline), break, end
%             disp(tline)
            
            tmp = [] ;
            remain = [] ;
            
            if numel(tline) ~= 0
                [token, remain] = strtok(tline);
                tmp(end+1) = str2num(token);
            end
            
            while numel(remain) ~= 0
                if numel(remain) == 1 & double(remain) == 9
                    break;
                end
                [token, remain] = strtok(remain);
                tmp(end+1) = str2num(token);
            end
            
            if numel(tmp) ~= 0
                file_content{end+1} = tmp ;
                 if numel(tmp) == 1
                    index(end+1) = numel(file_content) ;
                 end
            end
            
end
vertices = file_content(1:index(2)-1) ;
triangles = file_content(index(2):end) ;
fclose(fid);
        
end

