function [ ] = save_fom(fom, intervention, condition, ...
    feat_set)

    path = get_foms_path(intervention, condition, feat_set);
    save(path, 'fom');


end

