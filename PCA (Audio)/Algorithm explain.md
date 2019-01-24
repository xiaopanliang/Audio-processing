#pca
#@dataMat: original matrix
#@topNfeat: the number of dimension we want to keep    
def pca(dataMat,topNfeat=4096):
    #Calculate mean for every column
    meanVals=mean(dataMat,axis=0)
    #original matrix - mean matrix
    meanRemoved=dataMat-meanVals
    #Calculate covvariance matrix, rowvar=0 means divided by (n-1) instead n which is non-biased
    #n is the number of sample which is the number of column
    covMat=cov(meanRemoved,rowvar=0)
    #eigen value and eigen vector
    eigVals,eigVects=linalg.eig(mat(conMat))
    eigValInd=argsort(eigVals)
    #Take the maximum n dimensions's index
    eigValInd=eigValInd[:-(topNfeat+1):-1]
    #Only preserve the index for maximum n dimensions
    redEigVects=eigVects[:,eigValInd]
    #Convert a new matrix space
    lowDDataMat=meanRemoved*redEigVects
    #Re-construct the original matrix space
    reconMat=(lowDDataMat*redEigVects.T)+meanVals
    #We use lowDDataMat for application, reconMat is just for verifying how good the lowDDataMat is
    return lowDDataMat,reconMat
    
    
    
    Thanks to http://blog.csdn.net/maoersong/article/details/21823397 for the math induction
