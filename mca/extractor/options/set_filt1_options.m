function [filt1_opt] = set_filt1_options(feat_set)

  switch(feat_set)

    case 'a'      
        filt1_opt.wavelet_type = {'gabor', 'morlet'};
        filt1_opt.Q = [8 2];
        filt1_opt.boundary = 'symm';
    case {'b', 'c'}
        filt1_opt.filter_type = {'gabor_1d', 'morlet_1d'};
        filt1_opt.Q = [8 2];
    case {'d', 'e'}
        filt1_opt.filter_type = {'gabor_1d', 'morlet_1d'};
        filt1_opt.Q = [8 1];
    case 'f'
        filt1_opt.filter_type = {'gabor_1d', 'morlet_1d', 'morlet_1d'};
        filt1_opt.Q = [8 2 1];
    otherwise
        error(['Unknown feature set ', feat_set, '. Aborting']);
  end

  filt1_opt.J = T_to_J(8192*2, filt1_opt);

end
