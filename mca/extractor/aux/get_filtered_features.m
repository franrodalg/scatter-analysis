function [features, indices] = get_filtered_features(...
    feat_set, options)

    if(options.reuse_feats && ...
      check_features(feat_set, 'filtered'))
      [features, indices, ~] = ...
        get_old_features(feat_set, 'filtered');
    else
      
      if(~options.reuse_filtered || ...
              ~check_src('filtered'))
          filter_src();
      end
      src = get_src('filtered');
      objects = src.objects;
      
      [features, indices] = compute_features(feat_set, src);
      if(options.save_feats_filtered)
          save_features(features, indices, objects,...
            condition, feat_set);
      end
    end