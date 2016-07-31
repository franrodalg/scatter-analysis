function [classifier] = ...
    get_classifier(intervention, condition, feat_set, options)

  if(options.reuse_classifiers && ...
      check_classifier(intervention, condition, feat_set))
      classifier = get_old_classifier(intervention, condition, feat_set);
  else
      classifier = train_classifier(intervention, condition, feat_set,...
          options);
      if(options.save_classifiers)
          save_classifier(classifier, intervention, condition, feat_set);
      end
  end
end

