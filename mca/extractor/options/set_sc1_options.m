function [sc1_opt] = set_sc1_options(feat_set)

  switch(feat_set)

    case {'a', 'b'}      
        sc1_opt.M = 1;
    case {'c', 'd',  'e'}
        sc1_opt.M = 2;
    case 'f'
        sc1_opt.M = 3;
    otherwise
        error(['Unknown feature set ', feat_set, '. Aborting']);
  end

end
