%% load in the data

figure; plot(data1(:,1,2)) % plot the raw trace to check if it's the right trace
trace = data1(:,1,2); % unload the trace to another variable

%% filter

% get the filter coefficients 
[b,a] = butter(10,[0.1]); % Wn = 0.1 

% apply filter
trace_f = filtfilt(b,a,trace); % trace_f is filtered trace

% check the new filtered trace
figure; plot(trace_f);

%% fit it

% extract only the 200ms trace based on the figure
trace_fit = trace_f(4084:4084+4000);

% create an x variable for the fitting function input
x = 0:(200/4000):200; % this should go from 0 to 200ms with same number of points in between as trace_fit

% run fit
[fitobject,gof,output] = fit(x',trace_fit,'exp2');

figure; plot(fitobject,x,trace_fit) % plot the fitting


%      General model Exp2:
%      f2(x) = a*exp(b*x) + c*exp(d*x) based on matlab document. 

% get coefficients
format long % change the format so that small values can be read from the command window
coeffs = coeffvalues(fitobject);

% within coeffs, second value will be tau0 and fourth value will be tau1