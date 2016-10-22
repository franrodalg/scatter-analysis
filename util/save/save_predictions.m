function [ ] = save_predictions(preds, intervention, condition, ...
    feat_set, mode, filter_type)

    path = get_predictions_path(...
        intervention, condition, feat_set, mode, filter_type);
    save(path, 'preds');


end

