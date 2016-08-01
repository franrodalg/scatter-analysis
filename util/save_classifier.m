function [] = save_classifier(classifier,...
    intervention, condition, feat_set)

    path = get_classifier_path(intervention, condition, feat_set);
    save(path, 'classifier');

end