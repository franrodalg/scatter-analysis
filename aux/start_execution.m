function [] = start_execution(experiments)

    fprintf('\n**********\n');
    fprintf('STARTING EXECUTION OF EXPERIMENTS');
    fprintf('\n**********\n');

    num_experiments = length(experiments);
    
    for ii = 1:num_experiments
        
        fprintf('\n**********\n');
        fprintf('Starting experiment %d of %d ', ii, num_experiments);
        fprintf('\n**********\n');
        
        run_experiment(experiments{ii,:});
    end

    fprintf('\n**********\n');
    fprintf('FINISHING EXECUTION OF EXPERIMENTS');
    fprintf('\n**********\n');
    
end