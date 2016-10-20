function [] = start_execution(experiments)

    fprintf('\n**********\n');
    fprintf('STARTING EXECUTION OF EXPERIMENTS');
    fprintf('\n**********\n');

    num_experiments = size(experiments);
    num_experiments = num_experiments(1);
    
    for ii = 1:num_experiments
        
      fprintf('\n**********\n');
      fprintf('Starting experiment %d of %d ', ii, num_experiments);
      fprintf('\n**********\n');
        
      norm_acc(ii) = run_experiment(experiments{ii,:});
        
    end

    fprintf('\n**********\n');
    fprintf('FINISHING EXECUTION OF EXPERIMENTS');
    fprintf('\n**********\n');
    
    fprintf('\n**********\n');
    fprintf('SUMMARY OF RESULTS');
    fprintf('\n**********\n');
    
    for ii = 1:num_experiments
        
        fprintf('Feature Set: %s\n', experiments{ii,3});
        fprintf('Intervention: %s\n', experiments{ii,1});
        fprintf('Partitioning Condition: %s\n', experiments{ii,2});
        fprintf('Normalised Accuracy (Mean Recall): %0.2f%%\n', norm_acc(ii));
        fprintf('\n');
        
    end
    
end
