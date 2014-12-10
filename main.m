function answer = main()

for n = 1:24
    numOfLowestF = n;

    % training 
    [mu_Star,C_Star] = getC('Star',25,numOfLowestF);
    [mu_Alien,C_Alien] = getC('Alien',42,numOfLowestF);
    [mu_Butterfly,C_Butterfly]= getC('Butterfly-a',50,numOfLowestF);
    [mu_Face,C_Face] = getC('Face',100,numOfLowestF);

    %testing
    result_table = zeros(4,4);

    test_Star_M = getFeatureVector('Star',26,50,numOfLowestF);
    for i = 1:25
       testFV = test_Star_M(:,i);
       result = maxLikelihood(testFV,numOfLowestF,mu_Star,C_Star,mu_Alien,C_Alien,mu_Butterfly,C_Butterfly,mu_Face,C_Face);
       result_table(1,:) = result_table(1,:) + result;

    end

    test_Alien_M = getFeatureVector('Alien',43,84,numOfLowestF);
    for i = 1:42
       testFV = test_Alien_M(:,i);
       result = maxLikelihood(testFV,numOfLowestF,mu_Star,C_Star,mu_Alien,C_Alien,mu_Butterfly,C_Butterfly,mu_Face,C_Face);
       result_table(2,:) = result_table(2,:) + result;

    end

    test_Butterfly_M = getFeatureVector('Butterfly-a',51,100,numOfLowestF);
    for i = 1:50
       testFV = test_Butterfly_M(:,i);
       result = maxLikelihood(testFV,numOfLowestF,mu_Star,C_Star,mu_Alien,C_Alien,mu_Butterfly,C_Butterfly,mu_Face,C_Face);
       result_table(3,:) = result_table(3,:) + result;

    end

    test_Face_M = getFeatureVector('Face',101,199,numOfLowestF);
    for i = 1:99
       testFV = test_Face_M(:,i);
       result = maxLikelihood(testFV,numOfLowestF,mu_Star,C_Star,mu_Alien,C_Alien,mu_Butterfly,C_Butterfly,mu_Face,C_Face);
       result_table(4,:) = result_table(4,:) + result;

    end
  
    accuracy_rate = (result_table(1,1)+result_table(2,2)+result_table(3,3)+result_table(4,4))/(25+42+50+99)
    answer = result_table
end
  
       
end