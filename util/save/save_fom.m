function [ ] = save_fom(fom, intervention, condition, ...
    feat_set, filter_type)

  if ((nargin < 4) || strcmp(filter_type, ''))
    path = get_foms_path(intervention, condition, feat_set);
  else
    path = get_foms_path(intervention, condition, feat_set, filter_type);
  end
  
  save(path, 'fom');

end

