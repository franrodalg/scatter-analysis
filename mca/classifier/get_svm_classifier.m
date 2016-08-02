function [ classifier ] = get_svm_classifier( ...
    features, indices, objects, train_set, feat_set, options)

    classifier.type = 'svm';
    
    aux.features = features;
    aux = svm_calc_kernel(aux, 'gaussian', 'square',...
        1:8:size(features,2));
    
    svm_options = set_classifier_options(...
        feat_set, options.literal);
    
    aux.src.classes = get_classes([objects(:).class]);
    aux.src.objects = objects;
    aux.indices = indices;
    [svm_options.C, svm_options.gamma] = get_svm_parameters(...
        aux, train_set, svm_options);
    
    model = svm_train(db, train_set, svm_options);
    
    classifier.kernel = aux.kernel;
    classifier.model = model;
    classifier.options = svm_options;
    
end

