%% Intervention experiments to execute
% 'p' for partitioning;
% 'c' for classifier;
% 'f' for filtering;
% e.g., interventions = {'p','c','f'};

interventions = {'p', 'c', 'f'};

%% Filter type in Filtering Intervention
% 'bw' for Butterworth (used in ISMIR 2016)
% 'fb' for IRR Filterbank
% e.g., filter_type = 'bw';

filter_type = 'fb';


%% Partitioning conditions to test
% 'r' for random stratification;
% 'f' for fault filtering;
% e.g., interventions = {'r','f'};

conditions = {'r', 'f'};

%% Scattering audio features to extract
% 'a' for delta-MFCC;
% 'b' for First-layer Time Scattering features;
% 'c' for Second-layer Time Scattering features;
% 'd' for Time and Frequency Scattering features;
% 'e' for Time and Frequency Scattering features with Adaptive Bandwidth;
% 'f' for Third-layer Time Scattering features;
% e.g., feat_sets = {'a', 'b', 'c', 'd', 'e', 'f'};

feat_sets = {'b'};

%% Use the same options as Andén and Mallat
% 1 for using same options; 0 otherwise.

literal = 1;

%% Save computed audio features from original excerpts

save_feats = 1;

%% Save computed audio features from filtered excerpts

save_feats_filtered = 1;

%% Save trained classifiers

save_classifiers = 1;

%% Save class predictions at frame level

save_pred_frame = 1;

%% Reuse previously computed audio features

reuse_feats = 1;

%% Reuse previously trained classifiers

reuse_classifiers = 1;

%% Reuse previously filtered excerpts

reuse_filtered = 1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
