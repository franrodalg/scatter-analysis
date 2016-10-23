function [ path ] = get_predictions_path(intervention, ...
    condition, feat_set, mode, filter_type)

  if ((nargin > 3) && ~strcmp(filter_type, ''))
    intervention = [intervention '_' filter_type];
  end

  global PATHS;
    
  filename = [intervention '_' condition '_' feat_set];
    
  if(strcmp(mode, 'excerpts'))
    path = [PATHS.pred_excerpts, '/', filename];
  else
    path = [PATHS.pred_frames, '/', filename];
  end
    
end

