function [] = show_summary( experiments, norm_accs)

  for ii = 1:length(norm_accs)
        
    show_experiment(experiments{ii,:});
    fprintf('Normalised Accuracy (Mean Recall): %0.2f%%\n', norm_accs(ii));
    fprintf('\n');
        
  end

end

