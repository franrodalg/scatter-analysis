function fom = get_fom(gt, pred)

%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%
% Compute figures of merit: confusions, recalls, precisions,
%   F-scores, and normalized accuracy (average recall)
% 
%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%
% Bob L. Sturm (b.sturm@qmul.ac.uk) -- 20151006
% Centre for Digital Music
% School of Electronic Engineering and Computer Science
% Queen Mary University of London
% Mile End Road London E1 4NS 
% United Kingdom
% https://highnoongmt.wordpress.com
%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%=%

  numclasses = length(unique(gt));
  numtestsamples = length(gt);

  fom = zeros(numclasses+1,numclasses+1);

  % calculate confusions, columns are true, rows are predicted
  for ii=1:numtestsamples
    fom(pred(ii),gt(ii)) = ...
      fom(pred(ii),gt(ii)) + 1;
  end

  % calculate summary statistics
  recall = zeros(numclasses,1);
  precision = zeros(numclasses,1);
  Fscore = zeros(numclasses,1);
  for ii=1:numclasses
    recall(ii) = fom(ii,ii)/sum(fom(:,ii));
    precision(ii)  = fom(ii,ii)/sum(fom(ii,:));
    Fscore(ii) = 2*recall(ii)*precision(ii)/(recall(ii)+precision(ii));
  end

  Fscore(isnan(Fscore)) = 0;

  % normalize columns
  for ii=1:numclasses
    fom(:,ii) = fom(:,ii)/sum(fom(:,ii));
  end

  % put in other statistics
  fom(1:end-1,end) = precision;
  fom(end,1:end-1) = Fscore';
  fom(end,end) = mean(recall);

end