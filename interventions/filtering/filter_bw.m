function [y] = filter_bw(x, fs)

  [N, Wn] = buttord(40/(fs/2), 20/(fs/2), 1, 30);
  [B_high, A_high] = butter(N, Wn, 'high');
  y = filter(B_high, A_high, x);

end
