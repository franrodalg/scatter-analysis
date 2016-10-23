function [features, indices, objects] = ...
    get_old_features(feat_set, version, filter_type)

    if (nargin < 3)
      path = get_features_path(feat_set, version);
    else
      path = get_features_path(feat_set, version, filter_type);
    end
    
    aux = load(path);
    features = aux.features;
    indices = aux.indices;
    objects = aux.objects;

end

