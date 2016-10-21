function [ found ] = check_src( version )

    global PATHS;

    if(strcmp(version, 'filtered'))
        path = PATHS.gtzan_filt;
    else
        path = PATHS.gtzan;
    end
    
    found = exist(path, 'dir');
    if(found)
        found = (length(dir(path)) > 2);
    end

end

