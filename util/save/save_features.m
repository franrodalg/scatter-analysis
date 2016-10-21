function [] = save_features(features, indices, objects,...
    feat_set, version)

    path = get_features_path(feat_set, version);
    save(path, 'features', 'indices', 'objects');

end

