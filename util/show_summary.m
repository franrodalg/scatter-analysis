function [] = show_summary( experiments, norm_accs)

  for ii = 1:length(norm_accs)
        
    fprintf('Feature Set: %s\n', experiments{ii,3});
    fprintf('Intervention: %s\n', experiments{ii,1});
    fprintf('Partitioning Condition: %s\n', experiments{ii,2});
    fprintf('Normalised Accuracy (Mean Recall): %0.2f%%\n', norm_accs(ii));
    fprintf('\n');
        
  end

end

