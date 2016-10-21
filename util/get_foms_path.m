function [ path ] = get_foms_path(intervention, condition, feat_set)

    global PATHS;
    
    filename = [intervention '_' condition '_' feat_set];
    path = [PATHS.foms, '/', filename];
    
end

