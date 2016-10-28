function [] = save_summary(summary)

  global PATHS;
  
  filename = [PATHS.summary 'summary_' datestr(now, 'yy_mm_dd') '.txt'];

  fid = fopen(filename, 'wt');
  fprintf(fid, summary);
  fclose(fid);

end

