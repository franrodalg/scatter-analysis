function [ ] = save_predictions(preds, intervention, condition, ...
    feat_set, mode)

    path = get_predictions_path(intervention, condition, feat_set, mode);
    save(path, 'preds');


end

