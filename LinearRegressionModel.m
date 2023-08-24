% In the first line of the code, the data script provides us the 4 x 2 matrix. The
% second line creates the first column from the data matrix, and the third line
% creates the second column from the matrix. Thus, we have xvec and yvec to
% represent each line

data=[-1 0;0 0;0 1;1 1]
xvec=data(:,1)
yvec=data(:,2)

% The matrix W has a four by one matrix where the first column is the original
% xvec function and the second column is the four by one column of all ones.

W = [xvec, ones(size(xvec))] % 1st column is x data

% The optimal avec can be obtained from (W *W)\(W’*yvec) because we got the
% normal equation to be a slope equation of y = x*(½) + ½.

%% Plotting Squares Error
avec = (W'*W)\(W'*yvec) % normal equation (system)
figure(1);
plot(xvec,yvec,'x') % plotting data
hold on;
plot(xvec,polyval(avec,xvec)) 
E = norm(yvec-W*avec)^2 % squared error


%% Plotting Cubic Regression Model
fexact = @(x) x^3-x^2+2*x+0.5;
xvec2 = 3*rand(100,1)-1;
yvec2 = arrayfun(fexact,xvec2)+0.3*randn(size(xvec2));

figure(2);
plot(xvec2,yvec2,'x');
hold on; 

W2 = [xvec2.^3,xvec2.^2,xvec2,ones(size(xvec2))];
avec2 = (W2'*W2)\(W2'*yvec2)
plot(xvec2,polyval(avec2,xvec2),'o')