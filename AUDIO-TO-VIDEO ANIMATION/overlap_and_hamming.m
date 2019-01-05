function [ signal_frame_matrix ] = overlap_and_hamming( raw_signal , window_size )

    % overlap factor 10 %
    overlap_factor = 0.1 ;
    s = size(raw_signal);
    length = s(1,2);
    
    % frame shift
   frame_shift = window_size*0.9 ;
   signal_frame_matrix = zeros(  floor(length/frame_shift)-1 , window_size) ;

   for i = 1:floor(length/frame_shift)-1
      
      tmp = raw_signal(1,  1 + (i-1)*floor(frame_shift) : window_size + (i-1)*floor(frame_shift) );
       signal_frame_matrix(i,:) = tmp.*hamming(window_size)';
   end
end

