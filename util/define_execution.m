function [experiments] = define_execution(...
    interventions, conditions, feat_sets)

    experiments = all_combs(...
        interventions, conditions, feat_sets);

end


