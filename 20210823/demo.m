%% Copyright(C),UESTC, School of Information and Communication Engineering, IDIP
% This script is designed to implement the measure function
% Author: MarkLHF(website: https://github.com/wcs7846)
% Date: 2020-7-3
close all;clear;
% 单位为mmol每分升
%
select_p = '.\';
tmp = dir(select_p);
fileName = searchfile(tmp, 'csv');

%% load data
Ndata = length(fileName);
dataset = cell(Ndata, 1); tmp_con = zeros(Ndata, 1);
% unit: mmol/L = 18 mg/dL
tmp_con = [0,0,0,1.3,1.3,1.3,4.4,4.4,4.4,5.1,5.1,5.1,6.1,6.1,6.1,7.4,7.4, ...
    8.5,8.5,8.5,9.2,9.2,9.2,9.9,9.9,9.9,10.2,10.2,10.2,12.1,12.1,12.1,13.5, ...
    13.5,14.1,14.1,14.1,15.2,15.2,15.2,16.4,16.4,16.4,17.0,17.0,17.0,18.8, ...
    18.8,18.8,19.3,19.3,19.3,19.9,19.9,19.9]*18;
remove_order = [1,12,23,34,45,52,53,54,55]; tmp_con(remove_order) = [];
data = [];
for n = 1:Ndata
    fName = string(fileName{n}{1});
    
    c = importfile(fName, 3, 1002);
    
    loc1 = strfind(fName, 'g');
    tmp_str =  fName.extractBetween(loc1+1, strlength(fName)-4);
     % first column == second; second column == volta
    dataset(str2num(tmp_str.char)) = {c};
    
    % used to debug
    data = [data, c(:,2)];
end
data = data';
testdata = data(17,:);
save('testdata', 'testdata');
save('real-data2-my', 'tmp_con', 'dataset');
save('real-data2', 'tmp_con', 'data');
