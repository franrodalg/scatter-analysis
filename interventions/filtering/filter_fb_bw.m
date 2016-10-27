function [y] = filter_fb_bw(x, fs)

  Dhigh = designfilt('highpassiir', 'StopbandFrequency', 20, ...
  'PassbandFrequency', 40, 'StopbandAttenuation', 30, ...
  'PassbandRipple', 1, 'SampleRate', fs);

  y = filter(Dhigh, x);

end
