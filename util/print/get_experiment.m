function [experiment] = get_experiment(...
    intervention, condition, feat_set, filter_type)

  global INTERVENTIONS CONDITIONS FEAT_SETS FILTER_TYPES;

  experiment = ['INTERVENTION: ', INTERVENTIONS.(intervention), '\n'];
  if ((nargin > 3) && (~strcmp(filter_type, '')))
      experiment = [experiment, ...
          'FILTER_TYPE: ', FILTER_TYPES.(filter_type), '\n'];
  end
  experiment = [experiment, ...
      'PARTITIONING CONDITION: ', CONDITIONS.(condition), '\n'];
  experiment = [experiment, ...
      'FEATURE SET: (', feat_set, ') ',...
      FEAT_SETS.(feat_set) , ' Audio Features'];

end