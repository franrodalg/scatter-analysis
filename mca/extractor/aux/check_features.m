function [found] = check_features(feat_set, version)

    if(nargin < 2)
        version = 'original';
    end

    found = exist(get_features_path(feat_set, version),'file');    

end
