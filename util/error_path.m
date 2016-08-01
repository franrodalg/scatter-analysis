function [] = error_path(folder, path)
%ERROR_PATH displays error and exits execution if path to folder is wrongly defined.
    
    if(nargin < 2)
        msg = [folder, ' folder path undefined. '];
    else
        msg = [folder, ' folder path (''', path ,''') unexisting. '];
    end
    
    
    error([msg, ' Please define it correctly in paths.m']);
end

