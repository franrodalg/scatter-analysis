function [] = filter_src(filter_type)

if(nargin < 1)
  filter_type = 'bw';
else
  filter_type = 'fb';
end

global PATHS;

filtered_folder = PATHS.gtzan_filt;
dataset_folder = PATHS.gtzan;

categories = dir(dataset_folder);

for k = length(categories):-1:1
    
    % remove non-folders
    if ~categories(k).isdir
        categories(k) = [ ];
        continue
    end

    % remove folders starting with .
    fname = categories(k).name;
    if fname(1) == '.'
        categories(k) = [ ];
    end
end

for ii=1:length(categories)
  
  category = categories(ii).name;  
    
  fprintf('Filtering %s files.\n', category);
    
  category_folder = [dataset_folder category];
  excerpts = dir(category_folder);
  
  for k = length(excerpts):-1:1
      
    % remove files starting with .
    fname = excerpts(k).name;
    if fname(1) == '.'
        excerpts(k) = [ ];
    end
   
  end
  
  mkdir(filtered_folder, category);
  
  for jj = 1:length(excerpts)
  
    fprintf('File %d of %d.\n', jj, length(excerpts));
  
    filename =  excerpts(jj).name;
    excerpt_path = [category_folder '/' filename];
    [x, fs] = audioread(excerpt_path);
    
    if(strcmp(filter_type, 'bw'))
      y = filter_bw(x, fs);
    else if(strcmp(filter_type, 'fb'))
      y = filter_fb(x, fs);
    else
      error('Unknown filter type');
    end
    
    [~, filename, ~] = fileparts(filename);
    
    path = [filtered_folder category '/' filename '.wav'];
    audiowrite(path, y, fs);
  end
  
end
    

end

