function [] = run_experiment(intervention, condition, feat_set)

    global INTERVENTIONS CONDITIONS FEAT_SETS;
    global OPTIONS;
    
    display(['INTERVENTION: ', INTERVENTIONS.(intervention)]);
    display(['PARTITIONING CONDITION: ', CONDITIONS.(condition)]);
    display(['FEATURE SET: (', feat_set, ') ',...
        FEAT_SETS.(feat_set) , ' Audio Features']);
    fprintf('\n');
    
    display('Obtiaining classifier...');
    classifier = get_classifier(...
        intervention, condition, feat_set, OPTIONS);
    display('Classifier obtained!');
    fprintf('\n');
    
    display('Computing predictions...');
    [pred, pred_frame] = ...
        predict(classifier, intervention, condition, feat_set, OPTIONS);
    display('Predictions computed!');
    fprintf('\n');
    
    display('Saving predictions...');
    save_predictions(pred, intervention, condition, feat_set);
    
    if(OPTIONS.save_pred_frame)
        save_predictions(...
            pred_frame, intervention, condition, feat_set, 'frame');
    end
    display('Predictions saved!');
    fprintf('\n');
    
    
end

