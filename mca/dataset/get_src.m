function [ src ] = get_src(version)

    global PATHS;

    if(strcmp(version, 'filtered'))
        path = PATHS.gtzan_filt;
    else
        path = PATHS.gtzan;
    end
    
    src = gtzan_src(path);
    
    
end

