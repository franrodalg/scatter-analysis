function [train_gt, test_gt] = get_gt(condition)

  gt = repmat(1:10, 100, 1);
  gt = gt(:);
  
  [train, test] = get_folds(condition);
  
  train_gt = gt(train);
  test_gt = gt(test);

end

