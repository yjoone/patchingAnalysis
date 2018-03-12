% script for current injection sorting and average

% load the data
load('/Users/JimKwon/Library/Containers/com.apple.mail/Data/Library/Mail Downloads/082C39F8-0817-4667-8F9D-8EDFD92940CD/traceData.mat');

% visualize inspection of data
% figure; plot(data1(:,2,1));
% figure; plot(data1(:,2,2));
% figure; plot(data1(:,3,1));

% get the current injected to a variable
cInject = round(data1(3e4,:,1)/100)*100;
cmin = min(cInject);
cmax = max(cInject);

for i = cmin:100:cmax
    ci = find(cInject == i);
    meanData = mean(data1(:,ci,2),2);
    
    % plot it
    figure;
    plot(meanData);
    title(['Current inject trace for ' num2str(i) ' pA']);
    ylabel('pA')
    xlabel('time')
    
end


% alternative approach of using unique
cInject = round(data1(3e4,:,1)/100)*100;
cInject_u = unique(cInject);
cInject_u_len = length(cInject_u);

for i = 1:cInject_u_len
    cInject_temp = cInject_u(1,i);
    trial_temp = find(cInject == cInject_temp);
    meanData = mean(data1(:,trial_temp,2),2);
    
    % plot it
    figure;
    plot(meanData);
    title(['Current inject trace for ' num2str(cInject_u(i)) ' pA']);
    ylabel('pA')
    xlabel('time')
end
    