%% Scatnet

if isequal(scatnet_path, '')
    error_path('Scatnet');
elseif ~exist(scatnet_path, 'dir')
    error_path('Scatnet', scatnet_path);
else
    display('Scatnet folder found.');
end
    
%% LibSVM

if isequal(libsvm_path, '')
    error_path('LibSVM');
elseif ~exist(libsvm_path, 'dir')
    error_path('LIBSVM', libsvm_path);
else
    display('LibSVM folder found.');
end

%% GTZAN

if isequal(gtzan_path, '')
    error_path('GTZAN');
elseif ~exist(gtzan_path, 'dir')
    error_path('GTZAN', gtzan_path);
else
    display('GTZAN dataset folder found.');
end

%% GTZAN filtered

if(ismember('f', conditions))
    if isequal(gtzan_filt_path, '')
        error_path('GTZAN Filtered');
    elseif ~exist(gtzan_filt_path, 'dir')
        [s, mess, messid] = mkdir(gtzan_filt_path);
        if(s)
            display('GTZAN filtered dataset folder created.');
        else
            error(['GTZAN filtered folder could not be created ' ...
                'in the requested location. ' ...
                'Please select an available one and edit paths.m.'])
        end
    else
        display('GTZAN filtered dataset folder found.');
    end
end

%% GTZAN features

if(save_feats || reuse_feats)
    if isequal(feats_path, '')
        error_path('Audio features');
    elseif ~exist(feats_path, 'dir')
        [s, mess, messid] = mkdir(feats_path);
        if(s)
            display('GTZAN audio features folder created.');
        else
            error(['GTZAN audio features folder could not be created ' ...
                'in the requested location. ' ...
                'Please select an available one and edit paths.m.'])
        end
    else
        display('GTZAN audio features folder found.');
    end
end

%% GTZAN filtered features

if(ismember('f', conditions) && save_feats_filtered)
    if isequal(feats_filt_path, '')
        error_path('Filtered audio features');
    elseif ~exist(feats_filt_path, 'dir')
        [s, mess, messid] = mkdir(feats_filt_path);
        if(s)
            display('GTZAN filtered audio features folder created.');
        else
            error(['GTZAN filtered audio features folder ' ...
                'could not be created ' ...
                'in the requested location. ' ...
                'Please select an available one and edit paths.m.'])
        end
    else
        display('GTZAN filtered audio features folder found.');
    end
end

%% Classifiers

if(save_classifiers || reuse_classifiers)

  if isequal(classifiers_path, '')
    error_path('Classifiers');
  elseif ~exist(classifiers_path, 'dir')
    [s, mess, messid] = mkdir(classifiers_path);
    if(s)
      display('Classifiers folder created.');
    else
      error(['Classifiers folder could not be created ' ...
        'in the requested location. ' ...
        'Please select an available one and edit paths.m.'])
    end
  else
    display('Classifiers folder found.');
  end

  if ~exist([classifiers_path , 'svm/'], 'dir')
    [s, mess, messid] = mkdir([classifiers_path, 'svm/']);
    if(s)
      display('SVM Classifiers folder created.');
    else
      error(['SVM Classifiers folder could not be created ' ...
        'in the requested location. ' ...
        'Please select an available one and edit paths.m.'])
    end
  else
    display('SVM Classifiers folder found.');
  end

  if (~exist([classifiers_path , 'bdt/'], 'dir') && ...
      (ismember('c', interventions)))
    [s, mess, messid] = mkdir([classifiers_path, 'bdt/']);
    if(s)
      display('BDT Classifiers folder created.');
    else
      error(['BDT Classifiers folder could not be created ' ...
       'in the requested location. ' ...
       'Please select an available one and edit paths.m.'])
    end
  else
    display('BDT Classifiers folder found.');
  end
end

%% Results

if isequal(pred_excerpts_path, '')
    error_path('Results');
elseif ~exist(pred_excerpts_path, 'dir')
    success = mkdir(pred_excerpts_path);
    if(success)
        display('Results folder successfully created.')
    else
        error('Results folder could not be created.');
    end
else
    display('Results folder found.');
end

%% Results frame level

if(pred_frames_path)
    if isequal(pred_frames_path, '')
        error_path('Results at frame level');
    elseif ~exist(pred_frames_path, 'dir')
        [s, mess, messid] = mkdir(pred_frames_path);
        if(s)
            display('Results at frame level folder created.');
        else
            error(['Results at frame level folder could not be created ' ...
                'in the requested location. ' ...
                'Please select an available one and edit paths.m.'])
        end
    else
        display('Results at frame level folder found.');
    end
end
