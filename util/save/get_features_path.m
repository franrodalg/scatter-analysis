function [path] = get_features_path(feat_set, version, filter_type)

    global PATHS;
    if(strcmp(version, 'filtered'))
        folder = [PATHS.feats_filt '/' filter_type];
    else
        folder = PATHS.feats;
    end
    
    filename = [feat_set, '.mat'];
    path = [folder,'/', filename];

end

