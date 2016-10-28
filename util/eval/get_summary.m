function [summary] = get_summary(experiments, norm_accs)

  summary = '';

  for ii = 1:length(norm_accs)
        
    experiment = get_experiment(experiments{ii,:});
    accuracy = sprintf('Normalised Accuracy (Mean Recall): %0.2f', ...
        norm_accs(ii));
    summary = [summary, experiment, '\n', accuracy, '%%\n\n'];
        
  end
  
end

