function [ classifier ] = get_bdt_classifier(features, indices,...
    objects, train_set)

    classifier.type = 'bdt';

    num_frames = length(indices{1});

    %%% 1.- Create features matrix with proper shape and type

    features = features';

    %%% 2.- Create ground truth array

    labels  = [objects(:).class];

    %%% 3.- Train set indices

    train_ind = [indices{train_set}];

    %%% 4.- Train set eatures

    train_feats = features(train_ind, :);

    %%% 5.- Train set ground truth

    train_labels = kron(labels(train_set), ones(num_frames, 1)');

    %%% 6.- Train model

    classifier.model = fitctree(train_feats, train_labels);


end

