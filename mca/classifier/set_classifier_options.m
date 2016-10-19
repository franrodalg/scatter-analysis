function [options] = set_classifier_options(feat_set, literal)

  options.kernel_type = 'gaussian';
  options.C = 2.^[0:4:8];
  options.gamma = 2.^[-16:4:-8];
  options.search_depth = 3;

  % Currently not in use. Optimal results with full_test_kernel = 1
  if(literal)
    switch(feat_set)
      case('f')
        %options.full_test_kernel = 0;
        options.full_test_kernel = 0;
      otherwise 
        options.full_test_kernel = 1;
    end
  else
    options.full_test_kernel = 1;
  end

end
