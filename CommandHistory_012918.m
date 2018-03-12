doc fit
sftool
fh = gcf;
fh = gcf
x = 1:10
x = 1:10;
ah = get(fh,'children');
ah = get(fh,'children')
datahandle = get(ah,'children');
dataHandle = get(ah,'children'); % get data handles
xData = get(dataHandle{2,1},'xdata');
yData = get(dataHandle{2,1},'ydata');
get(dataHandle{1,1},'string')
figure; plot(xdata,ydata)
figure; plot(xData,yData)
doc diff
help diff
y_diff = diff(y);
y_diff = diff(yData);
figure; plot(y_diff)
figure; plot(xData(1:end-1),y_diff)
figure; plot(xData,y_diff)
mean(y_diff)
std(y_diff)
thresh = mean(y_diff) + std(y_diff_*3.5
thresh = mean(y_diff) + std(y_diff*3.5)
thresh = mean(y_diff) + std(y_diff)
thresh = mean(y_diff) + std(y_diff*3)
doc find
x
find(x > 5)
slope_i = find(y_diff > thresh);
slope_i = find(y_diff > thresh)
slope_i = find(y_diff > thresh);
xData(16001)
yData(15990:16010)
drop_i = slope_i(1,1);
samplingRate = 20e3
xDrop = xData(drop_i+20:drop_i+220);
yDrop = yData(drop_i+20:drop_i+220);
figure; plot(xDrop,yDrop)
doc fit
doc mle
g = fittype('a*x^b);
g = fittype('a*x^b')
doc fittype
doc plot
cftool
xDrop_new = xData(drop_i:drop_i+200);
yDrop_new = yData(drop_i:drop_i+200);
xDrop_new = xData(drop_i:drop_i+600);
yDrop_new = yData(drop_i:drop_i+600);
yDrop_new = yData(drop_i:drop_i+6000);
xDrop_new = xData(drop_i:drop_i+6000);
xDrop_new = xData(drop_i:drop_i+300);
yDrop_new = yData(drop_i:drop_i+300);
xDrop_new = 1:300;
xDrop_new = 1:301;
yDrop_new = yData(drop_i+21:drop_i+220);
xDrop_new = 1:200;
doc cftool
b =      0.1436
a =      -43.58
x = 1:70e3;
y = a*x^b;
y = a*x.^b;
figure; plot(x,y)
t = xData(drop_i:drop_i+70000-1);
figure; plot(t,y)
hold on
plot(xData,yData,'r')
a =      -70.18
b =    0.001348
a =      -76.36
b =   0.0009723
c =        19.6
d =    -0.02982
y = a*exp(b*x)+c*exp(d*x);
figure; plot(t,y)
y = a*exp(b.*x)+c*exp(d.*x);
figure; plot(t,y)
figure; plot(x,y)
a
b
c
d
g = fittype('a*exp(b*x) + c*exp(d*x)')
doc fit
fito = fit(xDrop_new,yDrop_new,g);
fito = fit(xDrop_new',yDrop_new',g);
figure; plot(fito)
get(fito)
ce = coeffvalues(fito)
format long
ce = coeffvalues(fito)
a = -70.18
b =    0.001348
y = a*exp(b*x);
figure; plot(x,y)
figure; plot(y,z)
figure; plot(y,x)
figure; plot(x,y)
x = 1:40e3;
y = a*exp(b*x);
figure; plot(x,y)
set(gca,'ylim',[0 -200])
set(gca,'ylim',[-200 0])
set(gca,'ylim',[-500 0])
yDrop_new = yData(drop_i+21:drop_i+120);
yDrop_new = yData(drop_i:drop_i+60);
xDrop_new = 1:61;
a =      -50.66
b =      0.1007
y = a*exp(b*x);
y = a*x.^b;
figure; plot(x,y)
figure; plot(t,y)
x = 1:40e3;
x = 800:0.05:4e3;
figure; plot(x,y)
y = a*x.^b;
figure; plot(x,y)
hold on; plot(xData,yData,'r')
x = 1:40e3;
y = a*x.^b;
t = xData(drop_i:drop_i+40e3-1);
figure; plot(t,y)
hold on; plot(xData,yData,'r')
title('Fit 3ms period with power function')
title('Fit 10ms period with power function')
vDiff = yData(drop_i:drop_i+40e3-1) - y;
figure; plot(t,vDiff)
title('Difference in mV raw vs Fit 3ms period with power function')