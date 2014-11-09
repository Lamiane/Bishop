%short program applying theory from Bishop 1.2.4
%requires gauss.m

numbers = [2, 5, 10, 20, 50, 100, 200, 500, 1000, 2000, 5000, 10000, 100000, 1000000]; % sizes of the datasets created
A = []; % those vectors will be used later for plotting
B = [];
C = [];
D = [];
mean = 20; % mean and standard deviation of a gaussian used to create a dataset
std_dev = 5; 

for i = 1:length(numbers) % for each dataset size
  N = numbers(i);
  X_x = randn(1,N)*std_dev-mean; % data points are randomly choosen given a normal distribution with mean and variance = std_dev^2
  
  mi_ml = (1/N) *sum(X_x); % Bishop 1.55
  sig2_ml = 1/N * sum((X_x - mi_ml).^2); % Bishop 1.56
  sig2_mlunb = (N/(N-1))*sig2_ml; % Bishop 1.59

  %vectors will be used later for plotting
  A(i) = i;
  B(i) = mi_ml;
  C(i) = sig2_ml;
  D(i) = sig2_mlunb;
  
  %plotting sth similar to figure 1.15
  resolution = 500;
  gauss_x = linspace(-10*std_dev-mean,10*std_dev-mean,resolution);
  figure(i)
  hold on
  scatter(X_x, zeros(1, N), 'b');
  plot(gauss_x, gauss(mi_ml, sig2_ml, gauss_x), 'r');
  scatter(X_x, gauss(mi_ml, sig2_ml, X_x), 'r');
  plot(gauss_x, gauss(mi_ml, sig2_mlunb, gauss_x), 'g');
  scatter(X_x, gauss(mi_ml, sig2_mlunb, X_x), 'g');
  hold off

end

figure(length(numbers)+1)
hold on
scatter(A, B, 'b') % mean is blue
scatter(A, C, 'r') % sigma is red
scatter(A, D, 'g') % unbiased sigma is green
hold off
