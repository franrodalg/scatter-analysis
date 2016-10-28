function [norm_acc] = run_experiment(...
    intervention, condition, feat_set, filter_type)

    global OPTIONS;
    
    if nargin < 4
      filter_type = '';
    end

    show_experiment(...
        get_experiment(intervention, condition, feat_set, filter_type));
    fprintf('\n\n');
    
    display('Obtaining audio features...')
    [features, indices, objects] = get_features(...
      intervention, condition, feat_set, filter_type, OPTIONS);
    display('Features obtained!');
    fprintf('\n');
    
    display('Obtaining classifier...');
    classifier = get_classifier(features, indices, objects,...
      intervention, condition, feat_set, OPTIONS);
    display('Classifier obtained!');
    fprintf('\n');
    
    display('Testing classifier...');
    [pred, pred_frame] = compute_predictions(classifier, features, ...
      indices, intervention, condition);
    display('Classifier tested!');
    fprintf('\n');
    
    display('Saving predictions...');
    save_predictions(pred, intervention, condition, feat_set, ...
      'excerpts', filter_type);
    
    if(OPTIONS.save_pred_frame)
      save_predictions(...
        pred_frame, intervention, condition, feat_set, ...
        'frames', filter_type);
    end
    display('Predictions saved!');
    fprintf('\n');
    
    %% FoM Computation
    
    display('Computing FoM...');
    
    [~, test_gt] = get_gt(condition);
    
    fom = get_fom(test_gt, pred);
    norm_acc = fom(end) * 100;
    fprintf('Normalised accuracy (Mean Recall): %0.2f%%\n', norm_acc);
    
    display('FoM computed!');
    
    if(OPTIONS.save_foms)
      display('Saving FoM...');  
      save_fom(...
          fom, intervention, condition, feat_set, filter_type);
      display('FoM saved!');
      fprintf('\n');
    end
    
end

