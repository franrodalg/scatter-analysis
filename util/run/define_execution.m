function [experiments] = define_execution(...
    interventions, conditions, feat_sets, filter_types)

  if(nargin < 4)
    experiments = all_combs(interventions, conditions, feat_sets);
  else
    filtering = strcmp(interventions, 'f');
    if any(filtering)
      experiments_no_filtering = all_combs(...
          interventions(~filtering), conditions, feat_sets, {''});
      experiments_filtering = all_combs(...
          {'f'}, conditions, feat_sets, filter_types);
      experiments = [experiments_no_filtering; experiments_filtering];
    else
      experiments = all_combs(interventions, conditions, feat_sets);
    end
  end
  
end


