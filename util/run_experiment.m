function [] = run_experiment(intervention, condition, feat_set)

    global INTERVENTIONS CONDITIONS FEAT_SETS;
    global OPTIONS;
    
    display(['INTERVENTION: ', INTERVENTIONS.(intervention)]);
    display(['PARTITIONING CONDITION: ', CONDITIONS.(condition)]);
    display(['FEATURE SET: (', feat_set, ') ',...
        FEAT_SETS.(feat_set) , ' Audio Features']);
    fprintf('\n');
    
    display('Obtaining audio features...')
    [features, indices, objects] = get_features(...
        intervention, condition, feat_set, OPTIONS);
    display('Features obtained!');
    fprintf('\n');
    
    display('Obtaining classifier...');
    classifier = get_classifier(features, indices, objects,...
        intervention, condition, OPTIONS);
    display('Classifier obtained!');
    fprintf('\n');
    
    display('Testing classifier...');
    [pred, pred_frame] = compute_predictions(classifier, features, ...
        indices, intervention, condition);
    display('Classifier tested!');
    fprintf('\n');
    
    display('Saving predictions...');
    save_predictions(pred, intervention, condition, feat_set, 'excerpts');
    
    if(OPTIONS.save_pred_frame)
        save_predictions(...
            pred_frame, intervention, condition, feat_set, 'frames');
    end
    display('Predictions saved!');
    fprintf('\n');
    
    
end

