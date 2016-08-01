function [ features, indices] = join_features(condition,...
    features_original, features_filt,...
    indices_original, indices_filt)
    
    [~, test_set] = get_folds(condition);
    
    features = features_original;
    indices = indices_original;
    
    features(:, [indices{test_set}]) =...
        features_filt(:, [indices_filt{test_set}]);

end

