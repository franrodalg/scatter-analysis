function [] = save_features(features, indices, objects, ...
    feat_set, version, filter_type)

    if ~strcmp(version, 'filtered')
      path = get_features_path(feat_set, 'version');
    else
      path = get_features_path(feat_set, version, filter_type);
    end
    
    save(path, 'features', 'indices', 'objects');

end

