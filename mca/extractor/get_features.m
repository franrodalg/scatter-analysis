function [ features, indices, objects ] = ...
    get_features(intervention, condition, feat_set, filter_type, options)

    %1.- Get original features

    [features, indices, objects] = get_original_features(feat_set, options);

    if(strcmp(intervention, 'f'))
    %2.- Get filtered features
        
        [features_filt, indices_filt] = get_filtered_features(...
            feat_set, filter_type, options);

    %3.- Join features

        [features, indices] = join_features(condition,...
            features, features_filt, indices, indices_filt);

    end

end

