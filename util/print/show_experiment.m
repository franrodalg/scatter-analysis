function [] = show_experiment(intervention, condition, feat_set, filter_type)

  global INTERVENTIONS CONDITIONS FEAT_SETS FILTER_TYPES;

  display(['INTERVENTION: ', INTERVENTIONS.(intervention)]);
  if ~(strcmp(filter_type, ''))
      display(['FILTER_TYPE: ', FILTER_TYPES.(filter_type)]);
  end
  display(['PARTITIONING CONDITION: ', CONDITIONS.(condition)]);
  display(['FEATURE SET: (', feat_set, ') ',...
  FEAT_SETS.(feat_set) , ' Audio Features']);

end

