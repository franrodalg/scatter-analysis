function [train,test] = create_folds(condition)
% 'r' for Random Stratification
% 'f' for Fault Filtering

switch condition
  case 'f'
    testname = 'test_fault.txt';
    trainname = 'train_fault.txt';
    validname = 'valid_fault.txt';
  case 'r'
    testname = 'test_random.txt';
    trainname = 'train_random.txt';
    validname = 'valid_random.txt';
end

genrelabels = {'blues','classical','country','disco','hiphop','jazz','metal','pop','reggae','rock'};

mfilepath=fileparts(which(mfilename));
folds_path = [mfilepath '/folds/'];

% read in test partition

fid = fopen([folds_path testname]);
C = textscan(fid,'%s');
testdata = zeros(length(C{:}),1);
for cc=1:length(C{:})
  genremult = (find(strncmp(C{1}(cc),genrelabels,3))-1)*100;
  exnum = str2num(C{1}{cc}(end-5:end-4));
  testdata(cc) = genremult+exnum+1;
end
fclose(fid);

% read in valid partition
fid = fopen([folds_path validname]);
C = textscan(fid,'%s');
validdata = zeros(length(C{:}),1);
for cc=1:length(C{:})
  genremult = (find(strncmp(C{1}(cc),genrelabels,3))-1)*100;
  exnum = str2num(C{1}{cc}(end-5:end-4));
  validdata(cc) = genremult+exnum+1;
end
fclose(fid);

% read in train partition
fid = fopen([folds_path trainname]);
C = textscan(fid,'%s');
traindata = zeros(length(C{:}),1);
for cc=1:length(C{:})
  genremult = (find(strncmp(C{1}(cc),genrelabels,3))-1)*100;
  exnum = str2num(C{1}{cc}(end-5:end-4));
  traindata(cc) = genremult+exnum+1;
end
fclose(fid);

testbool = zeros(1000,1); testbool(testdata) = 1;
trainbool = zeros(1000,1); trainbool(validdata) = 1; trainbool(traindata) = 1;

test = logical(testbool);
train = logical(trainbool);
