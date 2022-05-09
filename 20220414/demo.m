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
tmp_con = [24.2, 24.2, 24.2, 22.0, 22.0, 22.0, 14.3, 14.3, 14.3, 14.5, 14.5, 14.5,...
    21.5, 21.5, 21.5, 21.9, 21.9, 21.9, 16.5, 16.5, 16.5, 23.9, 23.9, 23.9, 23.9, 11.7,...
    11.7, 11.7, 16.4, 16.4, 16.4, 17.8, 17.8, 17.8, 22.7, 22.7, 22.7, 0, 0, 0,...
    24.2, 24.2, 24.2, 24.2, 22.0, 22.0, 22.0, 14.3, 14.3, 14.3, 21.5, 21.5, 21.5]*18;
% 这批数据采集的时候有点问题，信号相位没有对齐，需要分开为2类，分别处理
class1_order = [4,5,13,14,15,26,27,28,30,31,32,33,35,36,37,39,40,44,45,46,47,48,49,50,51,52,53];
class2_order = 1:length(tmp_con); class2_order(class1_order) = [];

data = [];
for n = 1:Ndata
    fName = sprintf('scope_%d.csv', n-1);
    
    c = importfile(fName, 3, 1002);
    
%     loc1 = strfind(fName, 'g');
%     tmp_str =  fName.extractBetween(loc1+1, strlength(fName)-4);
     % first column == second; second column == volta
%     dataset(str2num(tmp_str.char)) = {c};
    
    % used to debug
    data = [data, c(:,2)];
end
ref_signal = data(:, 39); % 水
% class1中第16,17为水
class1_data = data(:,class1_order); class1_con = tmp_con(class1_order);
remove_order = []; 
tmp_con(remove_order) = []; class1_data(:,remove_order)=[];

class2_data = data(:,class2_order); class2_con = tmp_con(class2_order);

data = class1_data';tmp_con = class1_con; % 目前只有第一类的数据可以用
showdata = data';
% testdata = data(17,:);
% save('testdata2', 'testdata');
% save('real-data2-my', 'tmp_con', 'dataset');
save('real-data3', 'tmp_con', 'data');
