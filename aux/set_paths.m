% Modify the following variables to include locations
% of relevant folders in your own system.

%% Libraries

% Path to Scatnet library
% e.g., scatnet_path = [pwd, '/../libraries/scatnet-0.2/'];
scatnet_path = '';


% Path to LibSVM
% e.g., libsvm_path = [pwd, '/../libraries/libsvm-compact-0.1/'];
libsvm_path = '';


%% Datasets

% Path to original GTZAN recordings,
% e.g., gtzan_path = [pwd, '/../datasets/gtzan/'];
gtzan_path = '';


% Path to filtered GTZAN recordings,
% e.g., gtzan_filt_path = [pwd, '/../datasets/gtzan_filt/'];
% Only mandatory if filtering intervention is to be run.
% If the folder does not exist, the

gtzan_filt_path = '';


%% Intermediate computations

% Path to original GTZAN recordings audio features,
% e.g., feats_path = [pwd, '/../intermediate/features/gtzan/'];
% Only mandatory if 'int_features' option enabled.
% If the folder does not exist, the script will create it.

feats_path = '';


% Path to filtered GTZAN recordings audio features
% e.g., feats_filt_path = [pwd, '/../intermediate/features/gtzan_filt/'];
% Only mandatory if 'save_features' option is enabled
% and filtering intervention is to be run.
% If the folder does not exist, the script will create it.

feats_filt_path = '';


% Path to previously stored classifiers or where to store
% the newly trained ones,
% e.g., features_path = [pwd, '/../intermediate/classifiers/'];
% Only mandatory if 'save_classifiers' and/or 'reuse_classifiers'
% options are enabled.
% If the folder does not exist, the script will create it.

classifiers_path = '';


%% Results

% Folder to store prediction results in full GTZAN excerpts,
% e.g., pred_excerpts_path = [pwd, '/../results/pred_excerpts'];
% If folder does not exist, the script will create it.

pred_excerpts_path = '';


% Folder to store frame-based prediction results,
% e.g., pred_excerpts_path = [pwd, '/../results/pred_frames'];
% Only mandatory if 'save_pred_frames' option is enabled

pred_frames_path = '';
