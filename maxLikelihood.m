function P = maxLikelihood(testFV,numOfLowestF,mu_Star,C_Star,mu_Alien,C_Alien,mu_Butterfly,C_Butterfly,mu_Face,C_Face)

%no arrow, star7_1... , toonhead
px=[];
%Step 4 -Calculate the prior--------
weight_star = 25/217;
px_Star = Bayes(testFV,weight_star,mu_Star,C_Star,numOfLowestF);
px = [px px_Star];

weight_alien = 42/217;
px_Alien = Bayes(testFV,weight_alien,mu_Alien,C_Alien,numOfLowestF);
px = [px px_Alien];

weight_butterfly = 50/217;
px_Butterfly = Bayes(testFV,weight_butterfly,mu_Butterfly,C_Butterfly,numOfLowestF);
px = [px px_Butterfly];

weight_face = 100/217;
px_Face = Bayes(testFV,weight_face,mu_Face,C_Face,numOfLowestF);
px = [px px_Face];

result = max(px);

if result == px_Star
    P = [1 0 0 0];
elseif result == px_Alien
    P = [0 1 0 0];
elseif result == px_Butterfly
    P = [0 0 1 0];
elseif result == px_Face
    P = [0 0 0 1];   
end    
    

end