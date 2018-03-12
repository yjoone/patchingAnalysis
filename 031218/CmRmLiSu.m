% capacitance Cm Rm

filename ='C:\Users\user\Desktop\EMORY COLLAGE\NEUROSAGE\2018\2018-01-05_NS\2018-01-05 Slice1c2Alter.hdf5';
h5= ns_open_file(filename, true);
[data, info] = ns_read_data (h5, 3:2:20, 2);

%% filter
% binomial coefficient filter
h = [1/2 1/2];
binomialCoeff = conv(h,h);
for n = 1:7
    binomialCoeff = conv(binomialCoeff,h);
end

baseline = mean(data(4012:4014,:), 1);
data_norm = data - repmat(baseline, length(data),1) + mean(baseline);

data_filt = filtfilt(binomialCoeff, 1, data_norm);

data_mean = mean(data_filt, 2);
data_std = std(data_filt,1,2);
data_envelop = [data_mean, data_std] * [1 1; +2.1 -2.1];

figure; hold on;
plot(info.t, data_filt);
plot(info.t, data_mean, 'k', 'linewidth', 2);
plot(info.t, data_envelop, 'k--', 'linewidth', 1);

%% === to do . modify the curve fitting part
fit_part= 205*info.rate : 525*info.rate;
f = fit(info.t(fit_part) , data_mean(fit_part)- (-76),'exp2');

%% find time constant
fitted_curve_y = f(info.t) + baseline_ampa;
thres_37 = baseline_ampa + amplitude_ampa*0.375;
cross_point_37 = find( diff((fitted_curve_y >= thres_37)*direction) == -1);
time_const= (cross_point_37 - x_peak_ampa)/info.rate;