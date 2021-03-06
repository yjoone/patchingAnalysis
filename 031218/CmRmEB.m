%% identify current injected and get average values for voltage
% edyta's script
cInject = round(data1(4008,:,1)/1000)*1000;
cInject_u = unique(cInject);
cInject_u_len = length(cInject_u);

for i = 1:cInject_u_len
    cInject_temp = cInject(1,i);
    trial_temp = find(cInject == cInject_temp);
    Data_c = data1(:,trial_temp,1);
    Data_v = data1(:,trial_temp,2);
meanData_c(:,i) = mean(Data_c,2);
meanData_v(:,i) = mean(Data_v,2);
std_v(:,i) = std(Data_v,0,2);
end

%% trace rejection/ quality control






%% fit the exponential function to the mean of the voltage trace.

% peak to fit data offset is set at 5 ms, which is 100 data points
offset = 100;


for j = 1:2
    vData = meanData_v(:,j);
    
    % get the filter coefficients 
    [b,a] = butter(10,[0.1]); % Wn = 0.1 

    % apply filter
    vData_f = filtfilt(b,a,vData); % trace_f is filtered trace

    % check the new filtered trace
    figure; plot(vData_f);

    %% fit it with exp2 function

    % extract only the 200ms trace based on the figure
    trace_fit = vData_f((4000+offset):(4000+offset+4000));

    % create an x variable for the fitting function input
    x = 0:(200/4000):200; % this should go from 0 to 200ms with same number of points in between as trace_fit

    % run fit
    [fitobject,gof,output] = fit(x',trace_fit,'exp2');

    figure; plot(fitobject,x,trace_fit) % plot the fitting
end


%% compute rejection criteria for each trial
for i = 1:2:20
[fitobject,gof,output] = fit(x',data1(4100:8100,i,2),'exp2');
res = output.residuals;
res_std = res./std_v_f;
max(abs(res_std))
end


% figure;
% for j = 1:length(trial_temp)
% plot(meanData_c(:,trial_temp),2);    
% title(['Current inject trace for ' num2str(i) 'pA']);
% ylabel('pA');
% xlabel('time');
% end
 


% figure;
% subplot (2,1,1);
%     for j = 1:length(trial_temp)
%         plot(meanData(:,trial_temp(j),2),C(j));
%         hold on
%     end
% voltage_meanData = median (meanData (53000:55000,1));
% peak_voltage (i) = voltage_meanData-baseline_meanData;
% baseline(i)= baseline_meanData;
% figure (i);
% subplot (2,1,1);
% plot (meanData(:,1)); 
% hold on;
% subplot (2,1,2);
% plot (meanData(:,1),'b');