global PATHS;

PATHS.scatnet = scatnet_path;
PATHS.libsvm = libsvm_path;

PATHS.gtzan = gtzan_path;

if exist('gtzan_filt_path', 'var')
  PATHS.gtzan_filt = gtzan_filt_path;
end

if exist('feats_path', 'var')
  PATHS.feats = feats_path;
end

if exist('feats_filt_path', 'var')
  PATHS.feats_filt = feats_filt_path;
end

if exist('classifiers_path', 'var')
  PATHS.classifiers = classifiers_path;
end

PATHS.pred_excerpts = pred_excerpts_path;

if exist('pred_frames_path', 'var')
  PATHS.pred_frames = pred_frames_path;
end

if exist('foms_path', 'var')
  PATHS.foms = foms_path;
end
