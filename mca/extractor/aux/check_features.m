function [found] = check_features(feat_set, version, filter_type)

    if(nargin < 2)
        version = 'original';
        filter_type = '';
    end

    found = exist(get_features_path(feat_set, version, filter_type), 'file');    

end
