# neureka-challenge
Ready to use MATLAB scripts for EEG data (published by [TUH](https://www.isip.piconepress.com/projects/tuh_eeg/html/downloads.shtml)) used in [neureka challenge](https://neureka-challenge.com/).

## Getting Started

### Prerequisites
Format of the recordings in this dataset is **EDF (European Data Format)**. In order to convert and import the recordings into MATLAB workspace please download [edfread](https://www.mathworks.com/matlabcentral/fileexchange/31900-edfread) function and make sure you added it to MATLAB search path.

### Installing
Just download and put **_challenge_** folder to your working directory. Make sure you also added it to MATLAB search path.

### Running the Tests
There are two example **_.m_** files in the challenge folder.

Run **read_example.m** file to make sure reading functions running well. Also you can see plot of montage EEG signals with seizure events indicated with red line.

Run **write_example.m** file to make sure writing functions running well. If there is no problem, after you run it, you can see **prediction.txt** file created under your working folder. It should have 1 seizure event in it.

### Author
Fatih Altındiş

### Acknowledgements
1- EEG data is provided by [TUH](https://www.isip.piconepress.com/projects/tuh_eeg/html/downloads.shtml)

2- [edfread](https://www.mathworks.com/matlabcentral/fileexchange/31900-edfread) function of [Brett Shoelson](https://www.mathworks.com/matlabcentral/profile/authors/845693-brett-shoelson) is used to convert EDF files to MAT 

