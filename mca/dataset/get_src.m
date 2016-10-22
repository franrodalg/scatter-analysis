function [ src ] = get_src(version, filter_type)

    global PATHS;

    if(strcmp(version, 'filtered'))
        path = [PATHS.gtzan_filt '/' filter_type];
    else
        path = PATHS.gtzan;
    end
    
    src = gtzan_src(path);
    
    
end

