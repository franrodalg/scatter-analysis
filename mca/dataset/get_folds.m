function [train_set, test_set] = get_folds(condition)  

  [train_set, test_set] = create_folds(condition);
  train_set = find(train_set)';
  test_set = find(test_set)';

end
