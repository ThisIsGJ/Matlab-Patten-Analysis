function [mu,C] = getC(name,numOfImage,numOfLowestF) % name is image name; number is the number of fecture
%step:0 get the feature vectors of the image------------
training_FV = getFeatureVector(name,1,numOfImage,numOfLowestF);
%Step:1 get the mean of the feature vectors-------------
mu = mean(training_FV,2);
%step:2 Calculate the Covariance of the feature vectors--------------
U = bsxfun(@minus,training_FV,mu);
Cb = zeros(numOfLowestF,numOfLowestF);
for n = 1:numOfImage
  u = U(:,n);
  Cbi = u * u';
  Cb = Cbi+Cb;
end
C = Cb/(numOfImage - 1);

end
