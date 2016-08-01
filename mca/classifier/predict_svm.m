function [pred_frame] = predict_svm(classifier,...
    features, indices, test_set)

    model = classifier.model;
    num_classes = model.nr_class;
    full_test_kernel = model.svm_options.full_test_kernel;
    
    test_feats = features(:, indices{test_set});
    
    sv_coef = zeros(model.totalSV, ...
        num_classes*(num_classes-1)/2, ...
        'like',  features);

	pairs = [];
    r = 1;
    for n1 = 1:num_classes
      for n2 = n1+1:num_classes
        pairs = [pairs [n1; n2]];

        class1_SVs = 1+sum(model.nSV(1:n1-1)):sum(model.nSV(1:n1));
        class2_SVs = 1+sum(model.nSV(1:n2-1)):sum(model.nSV(1:n2));

        sv_coef(class1_SVs,r) = model.sv_coef(class1_SVs,n2-1);
        sv_coef(class2_SVs,r) = model.sv_coef(class2_SVs,n1);
        r = r+1;
      end
    end
    
    norm2 = sum(abs(features(...
        :,kernel.kernel_set(model.SVs))).^2,1);
    
    
    if model.Parameters(2) == 0			% linear kernel
      % Linear kernel was calculated in LIBSVM; recalculate it here.
      K = test_feats'*model.SVs.';
    elseif model.Parameters(2) == 2		% Gaussian kernel
      % Gaussian kernel was calculated in LIBSVM; recalculate it here.
      norm1 = sum(abs(test_feats).^2,1);
      model.SVs=full(model.SVs);
      norm2 = sum(abs(model.SVs.').^2,1);
      norm2=full(norm2);
      K = bsxfun(@plus,norm1.',norm2)-...
        2*test_feats'*model.SVs.';
      K = exp(-model.Parameters(4)*K);
    elseif full_test_kernel && ...
      (model.Parameters(2) == 4 || ...
      model.Parameters(2) == 5 || ...
      model.Parameters(2) == 6 || ...
      model.Parameters(2) == 7)
      % Kernel was precalculated, but for testing, we have to recalculate it.
      % This can be necessary if the set of kernel vectors is restricted.

      if strcmp(kernel.kernel_type,'linear')
        % Calculate the linear kernel of the testing vector with respect to the 
        % support vectors.
        K = test_feats'*features(:,kernel.kernel_set(model.SVs));
      elseif strcmp(kernel.kernel_type,'gaussian')
        % Same for Gaussian kernel, except that we don't multiply by gamma and 
        % exponentiate here. This is done later, as in the precalculated case.
        norm1 = sum(abs(test_feats).^2,1);
        K = bsxfun(@plus,norm1.',norm2)-...
          2*test_feats'*features(:,kernel.kernel_set(model.SVs));
      else
        error('unknown kernel type');
      end
    elseif model.Parameters(2) == 4	|| model.Parameters(2) == 6
    elseif model.Parameters(2) == 5 || model.Parameters(2) == 7
    end

    if (model.Parameters(2) == 4 && ...
            strcmp(kernel.kernel_type,'gaussian')) || ...
      model.Parameters(2) == 6 || model.Parameters(2) == 7
      % If we have a Gaussian kernel, we need to multiply by gamma
      % and exponentiate.
      K = exp(-model.Parameters(4)*K);
    end
    
    dec = bsxfun(@minus,K*sv_coef,model.rho.');

    % Prepare the votes matrix, which will contain the votes assigned to each 
    % class for each testing vector.
    votes = zeros(size(dec,1), num_classes);
    
    for r = 1:size(pairs,2)
      % For each pair, calculate the "winners" and add one to their tally.
      n1 = pairs(1,r);
      n2 = pairs(2,r);

      votes(dec(:,r)>=0,n1) = votes(dec(:,r)>=0,n1)+1;
      votes(dec(:,r)<0,n2) = votes(dec(:,r)<0,n2)+1;
    end

    % Assign the class to that with the largest number of votes.
    [~,pred_frame] = max(votes,[],2);

    
end

