function [features, indices] = compute_features(feat_set, src)

  N = 5*2^17;
 
  % set the appropriate options for the particular feature set

  ex_options = set_options(feat_set);

  % extract features using the computed options

  extractor = get_extractor(feat_set, N, ex_options);
  
  [features, indices] = extract_features(src, extractor);
  
end
