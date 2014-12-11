function out = getInterpValue(tin, data, t)
% out = getInterpValue(tin, data, t)
% This function interpolates a time series at time tin using a weighted,
% i.e. shaped filter
%       INPUT:
%           tin - time to be estimated at
%           data - data to be filtered
%           t - time stamps for each datapoint
%       OUTPUT:
%           out - estimate of data at time tin
    out = 0;
    win_size = 3;
    
    %get all data points to use for filter
    int = find(t>tin,1,'first');
    indrange = max([1,int-win_size]):min([size(data,1),int+win_size]);
    
    %get weights
    alpha = 25;
    weights = 1./( alpha^2 .*(t(indrange)-tin).^2 +1);
    weights = weights/sum(weights);
    out = weights' * data(indrange,:);
    
    
    
    
end