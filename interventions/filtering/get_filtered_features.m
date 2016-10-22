function [features, indices] = get_filtered_features(...
    feat_set, filter_type, options)

    if(options.reuse_feats && ...
      check_features(feat_set, 'filtered', filter_type))
      [features, indices, ~] = ...
        get_old_features(feat_set, 'filtered', filter_type);
    else
      
      if(~options.reuse_filtered || ~check_src('filtered', filter_type))
          filter_src(filter_type);
      end
      src = get_src('filtered', filter_type);
      objects = src.objects;
      
      [features, indices] = compute_features(feat_set, src);
      if(options.save_feats_filtered)
          save_features(features, indices, objects,...
            feat_set, 'filtered', filter_type);
      end
    end
