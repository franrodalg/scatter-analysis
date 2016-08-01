function [filt2_opt, sc2_opt, ffilt2_opt, fsc2_opt] = ...
    set_filt2_options(feat_set, ex_options)

    filt2_opt = ex_options.filt1_opt;
    filt2_opt.Q = [1 1];
    filt2_opt.J = T_to_J(8192*2, filt2_opt);

    sc2_opt = ex_options.sc1_opt;

    ffilt2_opt = ex_options.ffilt1_opt;
    ffilt2_opt.J = 5;

    fsc2_opt = ex_options.fsc1_opt;

end
 
