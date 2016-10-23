function [ path ] = get_foms_path(...
    intervention, condition, feat_set, filter_type)

  if ((nargin > 3) && ~strcmp(filter_type, ''))
    intervention = [intervention '_' filter_type];
  end

  global PATHS;
    
  filename = [intervention '_' condition '_' feat_set];
  path = [PATHS.foms, '/', filename];
    
end

