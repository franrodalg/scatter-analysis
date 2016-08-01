function [C, gamma] = get_svm_parameters(db, train_set, svm_options)

  [dev_err_grid,C_grid,gamma_grid] = ...
  svm_adaptive_param_search(db, train_set, [], svm_options);

  [~,ind] = min(mean(dev_err_grid{end},2));
  C = C_grid{end}(ind);
  gamma = gamma_grid{end}(ind);


end

