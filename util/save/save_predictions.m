function [ ] = save_predictions(preds, intervention, condition, ...
    feat_set, mode, filter_type)

  if ((nargin < 6) || strcmp(filter_type, ''))
    path = get_predictions_path(...
          intervention, condition, feat_set, mode);
  else
    path = get_predictions_path(...
          intervention, condition, feat_set, mode, filter_type);
  end
    
  save(path, 'preds');

end

