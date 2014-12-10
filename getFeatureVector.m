function FVMatrix = getFeatureVector(name,start_numOfImage,end_numOfImage,numOfLowestF)

imagedir = 'images/';

if exist(imagedir, 'dir') == 0
    disp('Error: Image directory set incorrectly');
    return;
end

FVMatrix0 = [];
for a = start_numOfImage:end_numOfImage
    
    %Step:1 -load image-------------------------
    imageName = [name num2str(a,'%03d') '.gif'];
    im = imread([imagedir imageName]);
    im = logical(im); %Convert the original intensity values into logical 1s and 0s

    %Step:2-chain-code--------------------------
    c = chainCode(im);

    %Step:3-chain-code to angle--------------------------
    angles = c(3,:)*(2*pi/8) ; 

    %Step:4-Fourier Transform of angle--------------------------
    anglesFFT = fft(angles); 

    %Step:5-Low pass filtering--------------------------
    N = numOfLowestF; %number of lowest frequencies to keep -  filter 
    filter = zeros(size(angles)); 

    filter(1:N) = 1; 
    filter(end-N+2:end) = 1;
    filteredFFT = anglesFFT .* filter; % Apply the filter by scalar multipliacation

    %Step:6-Absulut the value--------------------------
    FV = abs(filteredFFT)/100;   % The feature vector
    FV2 = FV(1:N);        
    FVMatrix0 = [FVMatrix0;FV2]; 
end
    FVMatrix = transpose(FVMatrix0);
end