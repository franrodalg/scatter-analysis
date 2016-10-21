function [ path ] = get_predictions_path(intervention, ...
    condition, feat_set, mode)

    global PATHS;
    
    filename = [intervention '_' condition '_' feat_set];
    
    if(strcmp(mode, 'excerpts'))
        path = [PATHS.pred_excerpts, '/', filename];
    else
        path = [PATHS.pred_frames, '/', filename];
    end
    
end

