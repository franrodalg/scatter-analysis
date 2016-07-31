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