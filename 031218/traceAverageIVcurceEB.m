% script for current injection sorting and average

C = 'rgbk';

% % % approach of using unique
cInject = round(data1(3e4,:,1)/100)*100;
cInject_u = unique(cInject);
cInject_u_len = length(cInject_u);

for i = 1:cInject_u_len
    cInject_temp = cInject_u(1,i);
    trial_temp = find(cInject == cInject_temp);
    meanData = mean(data1(:,trial_temp,2),2);
    
baseline_meanData = median(meanData(2000:6000,1));
voltage_meanData = median (meanData (53000:55000,1));
peak_voltage (i) = voltage_meanData-baseline_meanData;
baseline(i)= baseline_meanData;
figure;
subplot (2,1,1);
    for j = 1:length(trial_temp)
        plot(data1(:,trial_temp(j),2),C(j));
        hold on
    end
% plot (data1(:,:,2)); want to see only traces that got pick up for
% averages; ask Jim
hold on;
subplot (2,1,2);
plot (meanData(:,1),'b');
end


    figure;
    plot(meanData);
    title(['Current inject trace for ' num2str(i) 'pA']);
    ylabel('pA');
    xlabel('time');




