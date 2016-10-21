function [classifier] = train_classifier(...
    features, indices, objects, intervention, condition, ...
    feat_set, options)

    [train_set, ~] = get_folds(condition);
    
    if(strcmp(intervention, 'c'))
        classifier = get_bdt_classifier(features, ...
            indices, objects, train_set);
    else
        classifier = get_svm_classifier(features, ...
            indices, objects, train_set, feat_set, options);
    end

end

