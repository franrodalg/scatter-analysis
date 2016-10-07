Analysis of Scattering-Based MCA Systems
Version 0.0.3
October 2016

Contact: Francisco Rodríguez-Algarra (f.rodriguezalgarra@qmul.ac.uk)

* LICENSING AND ATTRIBUTION INFORMATION

Copyright (c) 2013 Stéphane Mallat, Laurent Sifre, Joakim Andén, Michel Kapoko,
Edouard Oyallon, and Vincent Lostanlen.
Copyright (c) 2016 Francisco Rodríguez-Algarra, and Bob L. Sturm.

For licensing information see the file named LICENSE.

This code is mainly based on the code provided with the following paper:
J. Andén, and S. Mallat, "Deep Scattering Spectrum",
IEEE Transactions on Signal Processing, vol. 62, pp. 4114-4128, 2014.

If you use this code, please cite the following paper:
F. Rodríguez-Algarra, B. L. Sturm, and H. Maruri-Aguilar,
"Analysing Scattering-Based Music Content Analysis Systems: Where's the Music?",
in Proc. 17th International Society of Music Information Retrieval Conference (ISMIR'16),
New York, NY, USA, Aug. 2016.

* CHANGELOG

Version 0.0.3

- Fixed bugs:
 - Automatic creation of folders
 - Selection of filter type

Version 0.0.2

- Fixed bugs:
  - Correct number of arguments in get_filt_features call
  - Number of experiments to run correctly calculated
  - Feature sets 'd' and 'f' swaped in get_extractor

- New option: filtering intervention with filterbank

* USAGE

This code requires the following libraries:
- ScatNet v0.2
- Compact LIBSVM v0.1
Both libraries can be obtained in: http://www.di.ens.fr/data/software/

It also requires the GTZAN music dataset, available at:
http://opihi.cs.uvic.ca/sound/genres.tar.gz

To execute the experiments, first edit the files paths.m and options.m with the
paths to the folders in your own system and the required execution options,
respectively. Then, run the script scatter_analysis.m in Matlab or scatter_analysis.sh
in a Unix terminal.

* WARNING

At the moment of releasing this code, ScatNet library still uses AUREAD and/or WAVREAD
functions to read audio files, which are not supported in the most recent versions of Matlab.
This means it might be necessary to use an old version of Matlab to run our code
(for instance, Matlab2014a). Another option would be to edit ScatNet feature extractor
replacing the probematic calls with AUDIOREAD.
