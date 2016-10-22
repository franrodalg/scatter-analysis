function [ ] = save_fom(fom, intervention, condition, ...
    feat_set, filter_type)

    path = get_foms_path(intervention, condition, feat_set, filter_type);
    save(path, 'fom');


end

