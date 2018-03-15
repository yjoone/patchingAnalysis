% This script is to follow 1994 Guy major paper


% peak to fit data offset is set at 5 ms, which is 100 data points
offset = 100;


%% compute the delta Vm


%% get rid of base line and filter
% baseline is set at 200ms and it is a constant


%% get average (C)
data_p = data1(:,1:2:11,2);
data_n = data1(:,2:2:11,2);

data_p_delta = data_p - mean(data_p,2);
data_n_delta = data_n - mean(data_n,2);

dataAvg_p = mean(data_p,2);
dataAvg_n = mean(data_n,2);

%% filter the data



%% compute SE (D)
se_p = std(data_p,[],2)/sqrt(length(data_p));
se_n = std(data_n,[],2)/sqrt(length(data_n));

%% plot the average trace for visual inspection in semi-log plot (E)
% inspect visually
dataAvg_n_delta = abs(dataAvg_n - mean(dataAvg_n));
dataAvg_p_delta = abs(dataAvg_p - mean(dataAvg_p));

figure; semilogy(dataAvg_n_delta); set(gca,'xlim',[4e3 8e3]);
figure; semilogy(dataAvg_p_delta); set(gca,'xlim',[4e3 8e3]);


%% rejection
[~,plen] = size(data_p);

% get the filter coefficients
[b,a] = butter(10,[0.1]); % Wn = 0.1


for i = 1:plen
    vData = data_p_delta(:,i);
    
    %% fit exponential function
    
    % apply filter
    vData_f = filtfilt(b,a,vData); % trace_f is filtered trace
    
    % check the new filtered trace
    % figure; plot(vData_f);
    %% fit it with exp2 function
    
    % extract only the 200ms trace based on the figure
    trace_i = ((4000+offset):(4000+offset+4000));
    trace_fit = vData_f(trace_i);
    
    % create an x variable for the fitting function input
    x = 0:(200/4000):200; % this should go from 0 to 200ms with same number of points in between as trace_fit

    % run fit
    [fitobject,gof,output] = fit(x',trace_fit,'exp2');
    
    figure; plot(fitobject,x,trace_fit) % plot the fitting
    
    res = output.residuals;
    res_se = res./se_p(trace_i);
    max(abs(res_se))
    
end

