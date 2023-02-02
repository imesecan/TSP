function [res Order x y] = tsp(nmx,x,y,fig)
%
% Question:                  TSP problem
%   Matlab implemetation: by Ibrahim Mesecan
%   This program solves the TRAVELING SALESMAN PROBLEM. It 
%   uses Gradient descent algorithm together with 2-opt 
%   method. All the paramaters are optinal, where 
%   NMX is the MAX number of islands, if not given program 
%   uses the default value (100). The program can be called 
%   with pre installed X,Y coordinates, where x and y are the 
%   cartesian coordinates of the islands. Or if they are not 
%   given the program can read the data from file or assign 
%   random island positions. 
%   FIG is the figure number, on which the islands will be drawn
%   RES is the shortest distance found
%   ORDER is the order of the shortest distance found

    clc;
    cs=1;            % Circle size
    Max = 100;       % Max number of islands
    if nargin>=1,  Max = nmx; end;

    % if coordinates are not given take them randomly
    % or read them from file
    if nargin<=1
        [x y] = getdata(Max, Max);     % Take them randomly
        [x y Max] = getdataF();      % Read from File
    end
    
    Order = 2:Max;  % Initial island order
    Order(Max)=1;
    
    if nargin<3, % if figure number isn't given
        fig=1; 
    end;

	% Draw the initial graph
    
	
    % Calculate and show the initial order
	dist2 = round(DrawTsp(x, y, Order, cs, fig), 2);
    title(['Initial Total distance is ' num2str(dist2)]);
    drawnow;
    fprintf('Initial distance is %10.3f\n', dist2);
	ord1=Order; ord3=Order;
    ord2=Order; ord4=Order;
    tic
	t=1.0; jj=0; 
    while (t>0.001)
        jj=jj+1;
        [dist1 Order ]= tryOnce(x, y, Order, Max, t, 2500);
        dist2 = round(DrawTsp(x, y, Order, cs, fig+1), 2);        
        title(['Run:' num2str(jj) ', Total distance is ' num2str(dist2)]);
        drawnow;
        t =t * 0.8; 
    end
    
    toc
    res = round(DrawTsp(x, y, Order, cs, fig+1), 2);
    title(['Run:' num2str(jj) ', Total distance is ' num2str(res)]);
