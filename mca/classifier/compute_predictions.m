function [pred, pred_frame] = compute_predictions(...
    classifier, features, indices, intervention, condition)

    [~, test_set] = get_folds(condition);

    if(strcmp(intervention, 'c'))
        pred_frame = predict_bdt(classifier, features, indices,...
            test_set);
    else
        pred_frame = predict_svm(classifier, features, indices,...
            test_set);
    end
    
    
    num_frames = length(indices{1});

    pred = zeros(length(pred_frame) / num_frames, 1);

    for jj = 1:length(pred)

        pred(jj) = mode(...
            pred_frame((jj-1)*num_frames+1:(jj)*num_frames));

    end
    
end

