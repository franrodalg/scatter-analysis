% To run this script first edit the files 'options.m' and
% 'paths.m' in this same folder! 

clear all;

%% Set up
options;
paths;
run(fullfile('util/set_up.m'));

%% Computation

start_execution(experiments);
