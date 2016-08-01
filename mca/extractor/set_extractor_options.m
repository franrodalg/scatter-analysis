function [ex_options] = set_extractor_options(feat_set)

  % filter 1 options

  ex_options.filt1_opt = set_filt1_options(feat_set);
  ex_options.sc1_opt = set_sc1_options(feat_set);

  % frequency filter 1 options

  freq_filt_exps = {'d', 'e'};

  if(~isempty(find(ismember(...
          freq_filt_exps, feat_set),1)))

    [ex_options.ffilt1_opt, ex_options.fsc1_opt] = ...
      set_ffilt1_options(feat_set);
  end

  % secondary filters options

  sec_filt_exps =  {'e'};

  if(~isempty(find(ismember(...
          sec_filt_exps, feat_set),1)))

    [ex_options.filt2_opt, ex_options.sc2_opt, ...
      ex_options.ffilt2_opt, ex_options.fsc2_opt] = ...
        set_filt2_options(feat_set, ex_options);

  end

end
