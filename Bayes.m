function p = Bayes(testFV,weight,mu_class,C_class,numOfFilter)  

invC_class= inv(C_class);

putIn = bsxfun(@minus,testFV,mu_class);
nFact = (2*pi)^(numOfFilter/2)*det(C_class)^(1/2);
p = log(exp(-0.5*(putIn)'*invC_class*(putIn))/nFact)+log(weight);

  
end

