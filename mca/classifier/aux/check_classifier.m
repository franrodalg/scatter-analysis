function [ found ] = check_classifier(intervention, condition, feat_set)

    found = exist(get_classifier_path(intervention, condition, feat_set),...
        'file');    

end

