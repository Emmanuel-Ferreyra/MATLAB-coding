%% Preparing your data to develop a neural net
%% using the nntool comand in MATLAB
%% As shown in https://youtu.be/icNFe2a8s-c
%% Disclaimer: Not authoship is claimed all is public
%% available from MATLAB website and other common sources

%% Initialise Variables
filename = 'Users/emmanuel/CE889/nntrainingdata.csv';
delimiter = ',';
startRow = 2;

%% Format for each line of text:
% note that all columns are double (%f)
formatSpec = '%f%f%f%f%[^\n\r]';

%% Open the text file, (csv in this case):
fileID = fopen (filename, 'r');

%% Reead columns of data according to the format:
dataArray = textscan (fileID, ...
                    formatSpec, ...
                    'Delimiter' , ...
                    delimiter, ...
                    'TextType', ...
                    'string', ...
                    'EmptyValue', ...
                    NaN, ...
                    'HeaderLines', ...
                    startRow-1 , ...
                    'ReturnOnError', ...
                    false, ...
                    'EndOfLine', ...
                    '\r\n');
                
% Close the file:
fclose (fileID);

%% Post procesing steps
 % Please note that you might want to add your random selection of
 % training, testing and validation steps for your data.
 
%% Create output variables
% I will just focus on generating the target data and the input data only.
% But you guys will decide how to partition your data as indicated above.

nntrainingdata = table (dataArray {1:end-1} , ...
    'VariableNames', ...
    {'Left_distance_reading', 'Front_distance_reading' , ...
    'Left_motor_speed', 'Right_motor_speed'});

input1 = dataArray {1:end-1};
input2 = dataArray {2:end-1};
inputs = [input1, input2];
size = size(inputs);
random_number = round (size(1).*rand(1));
sample = inputs (random_number, :);

% Now just making the input matrix in the form of m x n; where m = number
% of inputs and n is the total number of observations.
inputs = inputs';

% Now focusing on the target outputs:
output1 = dataArray {3:end-1};
output2 = dataArray {4:end-1};
targets = [output1, output2];

% Similarly, now making the target matrix in the form of mxn:
targets = targets';

% Generate a sample for simulation purposes:
sample = sample';

% Finally, we just clean the temporary variables:
clearvars filename delimiter startRow formatSpec fileID dataArray ans ...
    input1 input2 output1 output2 size random_number;

