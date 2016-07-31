function [classifier] = ...
    get_old_classifier(intervention, condition, feat_set)

    path = get_classifier_path(intervention, condition, feat_set);
    
    classifier = load(path);
    classifier = classifier.classifier;


end

