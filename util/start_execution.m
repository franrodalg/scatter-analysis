function [] = start_execution(experiments)

    fprintf('\n**********\n');
    fprintf('STARTING EXECUTION OF EXPERIMENTS');
    fprintf('\n**********\n');

    num_experiments = size(experiments);
    num_experiments = num_experiments(1);
    
    norm_accs = zeros(1, num_experiments);
    
    for ii = 1:num_experiments
        
      fprintf('\n**********\n');
      fprintf('Starting experiment %d of %d ', ii, num_experiments);
      fprintf('\n**********\n');
        
      norm_accs(ii) = run_experiment(experiments{ii,:});
        
    end

    fprintf('\n**********\n');
    fprintf('FINISHING EXECUTION OF EXPERIMENTS');
    fprintf('\n**********\n');
    
    fprintf('\n**********\n');
    fprintf('SUMMARY OF RESULTS');
    fprintf('\n**********\n');
    
    show_summary(experiments, norm_accs);
    
end
