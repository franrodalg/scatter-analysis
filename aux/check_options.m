interventions_allowed = {'p', 'c', 'f'};
interventions = check_option(...
    'Intervention Experiments', interventions, interventions_allowed);

conditions_allowed = {'r', 'f'};
conditions = check_option(...
    'Partitioning Conditions', conditions, conditions_allowed);

feat_sets_allowed = {'a', 'b', 'c', 'd', 'e', 'f'};
feat_sets = check_option(...
    'Feature Sets', feat_sets, feat_sets_allowed);


display('All options correct.');