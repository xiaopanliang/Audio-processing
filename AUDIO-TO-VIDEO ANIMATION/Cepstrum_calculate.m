function [ twelve_coefficient_matrix ] = Cepstrum_calculate( frame_matirx ,Cepstrum_coefficient_num)

    s = size(frame_matirx);
    length = s(1,1);
    
    twelve_coefficient_matrix = zeros(Cepstrum_coefficient_num,length);
    % calulate 12 coefficient for each frame
    for i = 1:length
        tmp = real(ifft(log(abs(fft(frame_matirx(i,:)))))) ;
        %tmp = rceps(frame_matirx(i,:));
        % take the first twelve coeffecient
        twelve_coefficient_matrix( :, i) = tmp(1,1:Cepstrum_coefficient_num)' ;
    end
    
    
    

end

