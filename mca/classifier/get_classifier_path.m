function [path] = get_classifier_path( intervention, condition, feat_set)

    global PATHS;
    
    if(strcmp(intervention, 'c'))
        alg = 'bdt';
    else
        alg = 'svm';
    end
    
    filename = [condition, '_', feat_set, '.mat'];
    path = [PATHS.classifiers, alg, '/', filename];

end

