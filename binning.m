function [Age Y_bin Y_std N]=binning(X,Y,W) 
%

%INPUTS:
%X = N x 1 vector, X is age 
%Y = N x 1 vector, Y is the binning target, for instance, temperature
%W = 1 x 1 vector, W is the length of the binning window

%OUTPUTS:
% Age (m x 1) is the median age in each bin
% Y_bin (m x 1) is the average of Y values in each bin
% Y_std(m x 1) is the standard devitaion of Y_bin in each bin
% N(m x 1) is the number of data points in each bin

%%
% determine the first value of the length of the binned data
t=W/2*floor(X(1)/(W/2));
j=0;
% determine the length of the binned data
m=(W/2*floor(X(end)/(W/2))+W-t)/(W/2);  
for i=1:m
   
    row=find(X>=t&X<=t+W);
    j=j+1;
    N(j)=length(row);
    Age(j)=t+W/2;
    Y_bin(j)=mean(Y(row));
    
    Y_std(j)=std(Y(row));
    t=t+W/2;
end
Age=Age';
Y_bin=Y_bin';
Y_std=Y_std';
N=N';