function [features, indices] = ...
    get_old_features(feat_set, version)

    path = get_features_path(feat_set, version);
    
    aux = load(path);
    features = aux.features;
    indices = aux.indices;

end

