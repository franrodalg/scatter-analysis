fprintf('\n**********\n')
fprintf('Adding the necessary folders to Matlab path')
fprintf('\n**********\n');

run([scatnet_path, 'addpath_scatnet.m']);
addpath([libsvm_path, 'matlab']);

mfilepath=fileparts(which(mfilename));
addpath(genpath(fullfile(mfilepath,'/../')));
