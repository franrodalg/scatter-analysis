function [classes] = get_classes(class_ids)

    class_ids = sort(unique(class_ids));
    
    class_names = {'blues','classical', 'country', 'disco', 'hiphop',...
        'jazz', 'metal', 'pop', 'reggae', 'rock'};
    
    classes = {class_names{class_ids}};

end

