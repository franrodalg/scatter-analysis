function [y] = filter_fb(x, fs)

  Dhigh = designfilt('highpassiir', 'StopbandFrequency', 19, ...
  'PassbandFrequency', 20, 'StopbandAttenuation', 60, ...
  'PassbandRipple', 1, 'SampleRate', fs);

  y = filter(Dhigh, x);

end
