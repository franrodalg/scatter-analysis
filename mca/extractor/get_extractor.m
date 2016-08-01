function [extractor] = get_extractor(feat_set, N, ex_options)

  switch(feat_set)

    case 'a'
      
      filters = filter_bank(N, ex_options.filt1_opt);
      extractor = {@(x)(feval(@(x)(...
        [x;...
        circshift(x, [0 +1]); ...
        circshift(x, [0 -1])]),...
        format_scat(log_scat(...
          spec_freq_average(x, filters, ex_options.sc1_opt)))))};
            
    case {'b', 'c', 'd'}
      
      Wop = wavelet_factory_1d(N, ex_options.filt1_opt,...
        ex_options.sc1_opt);
      extractor = {@(x)(format_scat(log_scat(...
        renorm_scat(scat(x, Wop)))))};

    case {'e', 'f'}

      Wop1 = wavelet_factory_1d(N, ex_options.filt1_opt, ex_options.sc1_opt);      
      fWop1 = wavelet_factory_1d(...
        128, ex_options.ffilt1_opt, ex_options.fsc1_opt);

      scatt_fun1 = @(x)(log_scat(renorm_scat(scat(x, Wop1))));
      fscatt_fun1 = @(x)(func_output(@scat_freq, 2, scatt_fun1(x), fWop1));
      feature_fun1 = @(x)(format_scat(fscatt_fun1(x)));

      switch(feat_set)

        case 'd'

          extractor = {feature_fun1};

        case 'e'

          Wop2 = wavelet_factory_1d(...
            N, ex_options.filt2_opt, ex_options.sc2_opt);
          fWop2 = wavelet_factory_1d(...
            32, ex_options.ffilt2_opt, ex_options.fsc2_opt);
          
          scatt_fun2 = @(x)(log_scat(renorm_scat(scat(x, Wop2))));
          fscatt_fun2 = @(x)(func_output(@scat_freq, 2, scatt_fun2(x), fWop2));
          feature_fun2 = @(x)(format_scat(fscatt_fun2(x)));

          extractor = {feature_fun1, feature_fun2};

      end  

    for k = 1:length(extractor)
      fprintf('testing feature #%d...', k);
      tic;
      sz = size(extractor{k}(randn(N, 1)));
      aa = toc;
      fprintf('Ok (%.2fs) (size [%d, %d])\n', aa, sz(1), sz(2));
    end

    otherwise
        error(['Unknown feature set ', feat_set, '. Aborting']);
  end

end
