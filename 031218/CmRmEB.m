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
std_v = std(Data_v,0,2);
end
figure;
for j = 1:length(trial_temp)
plot(meanData_c(:,trial_temp),2);    
title(['Current inject trace for ' num2str(i) 'pA']);
ylabel('pA');
xlabel('time');
 end
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