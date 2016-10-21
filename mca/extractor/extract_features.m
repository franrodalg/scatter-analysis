function [ features, indices ] = extract_features( src, extractor )

  db = prepare_database(src, extractor);
  db.features = single(db.features);
  
  features = db.features;
  indices = db.indices;

end

