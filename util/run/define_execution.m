function [experiments] = define_execution(...
    interventions, conditions, feat_sets, filter_types)

  experiments = all_combs(...
    interventions, conditions, feat_sets);

end


