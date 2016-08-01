function [features, indices, objects] = get_original_features(...
    feat_set, options)

    if(options.reuse_feats && ...
      check_features(feat_set, 'original'))
      [features, indices] = ...
        get_old_features(feat_set, 'original');
    else
       
      src = get_src('original');
      objects = src.objects;
      
      [features, indices] = compute_features(feat_set, src);
      if(options.save_feats)
          save_features(features, indices, objects,...
            feat_set, 'original');
      end
    end


end

