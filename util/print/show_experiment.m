function [] = show_experiment( intervention, condition, feat_set)

  global INTERVENTIONS CONDITIONS FEAT_SETS;

  display(['INTERVENTION: ', INTERVENTIONS.(intervention)]);
  display(['PARTITIONING CONDITION: ', CONDITIONS.(condition)]);
  display(['FEATURE SET: (', feat_set, ') ',...
  FEAT_SETS.(feat_set) , ' Audio Features']);

end

