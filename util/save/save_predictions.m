function [ ] = save_predictions(preds, intervention, condition, ...
    feat_set, mode, filter_type)

  if ((nargin > 5) && ~strcmp(filter_type, ''))
    path = get_predictions_path(...
          intervention, condition, feat_set, mode, filter_type);
  else
    path = get_predictions_path(...
          intervention, condition, feat_set, mode);
  end
    
  save(path, 'preds');

end

