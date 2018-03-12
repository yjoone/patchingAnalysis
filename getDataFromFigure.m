% open figure file first

fh = gcf; % get the figure handle
ah = get(fh,'children'); % get the axes handle
dataHandle = get(ah,'children'); % get data handles

xData = get(dataHandle{2,1},'xdata');
yData = get(dataHandle{2,1},'ydata');