function [] = save_features(features, indices, objects, ...
    feat_set, version, filter_type)

    path = get_features_path(feat_set, version, filter_type);
    save(path, 'features', 'indices', 'objects');

end

