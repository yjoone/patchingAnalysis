

% extract slope information
[drop_i] = extractSlope(signalData);

xDrop = xData(drop_i+20:drop_i+220);
yDrop = yData(drop_i+20:drop_i+220);

cftool