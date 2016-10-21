function[pred_frame] = predict_bdt(classifier, features, indices,...
    test_set)
    
    %%% 1.- Create features matrix with proper shape and type

    features = features';

    %%% 2.- Test set indices

    test_ind = [indices{test_set}];

    %%% 3.- Test set features

    test_feats = features(test_ind, :);
    
    %%% 4.- Predictions per frame

    pred_frame = predict(classifier.model, test_feats);

    
end