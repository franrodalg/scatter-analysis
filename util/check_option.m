function [ intersection ] = check_option(option_name, options, allowed)

intersection = intersect(options, allowed);
if(~isempty(setdiff(options, intersection)))
    error(['Non-allowed options requested (', option_name,'). ',...
        'Edit the file set_options.m appropriately before executing again']);
end

end

