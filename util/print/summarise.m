function [] = summarise(experiments, norm_accs)

  global OPTIONS;

  summary = get_summary(experiments, norm_accs);
  
  show_summary(summary);
  
  if OPTIONS.save_summary
    save_summary(summary);
  end

end

