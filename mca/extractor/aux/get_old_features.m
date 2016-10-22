function [features, indices, objects] = ...
    get_old_features(feat_set, version, filter_type)

    path = get_features_path(feat_set, version, filter_type);
    
    aux = load(path);
    features = aux.features;
    indices = aux.indices;
    objects = aux.objects;

end

