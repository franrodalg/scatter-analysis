function [path] = get_features_path(feat_set, version)

    global PATHS;
    if(strcmp(version, 'filtered'))
        folder = PATHS.feats_filt;
    else
        folder = PATHS.feats;
    end
    
    filename = [feat_set, '.mat'];
    path = [folder,'/', filename];

end

