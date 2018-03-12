function [slope_i] = extractSlope(signalData)

% the signal data should be a voltage trace from a patch clamp recording.
% This function will identify where the dip in voltage occurs. This can be
% used to identify the initial slope and fit an exponential function.

%%%%% HARD CODE %%%%%%
threshScale = 3.5;


% Calculate differences in the signal
d = diff(signalData);

% The threshold for current injection is set at x3.5 of the SD
sd = std(d);
m = mean(d);

thresh = m + sd*threshScale;


% Find the first instance where the signalData difference crosses the
% threshold
slope_i_cand = find(d > thresh);

slope_i = slope_i_cand(1);