function [x y N] = getdataF(fname)
%This function reads A and B vectors from an input file
%Usage [A B] = GETDATA (FNAME)
% A and B are the output vectors 

if nargin<1
    fname='input.txt';
end;

fid = fopen(fname);
% GN - genuine Number, IN - imposter Number
N = fscanf(fid, '%g', [1 1]);

x=zeros(1,N);
y=zeros(1,N);

for i=1:N
    % if island number and x,y coords are given in the file
    % island = fscanf(fid, '%f', [1 3]);
    % x(i)=island(1,2);  y(i)=island(1,3);
    
    % if only x,y coords are given in the file
    island = fscanf(fid, '%f', [1 2]);
    x(i)=island(1,1);  y(i)=island(1,2);  
end;

fclose(fid);
