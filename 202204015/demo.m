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
tmp_con = [0, 0, 0, 16.5, 16.5, 16.5, 4.2, 4.2, 4.2, 14.05, 14.05, 14.05,...
    5.6, 5.6, 5.6, 10.1, 10.1, 10.1, 7.2, 7.2, 7.2, 6.23, 6.23, 6.23, ...
    8.73, 8.73, 8.73, 23.9, 23.9, 23.9, 23.9, 16.4, 16.4, 16.4, 16.4, 16.4,...
    14.3, 14.3, 14.3, 14.3, 22.7, 22.7, 22.7, 22.7, 11.7, 11.7, 11.7, 11.7,...
    11.7, 17.8, 17.8, 17.8, 21.9, 21.9, 21.9, 21.9, 14.5, 14.5, 14.5, 14.5,...
    14.5 ]*18;
remove_order = [38,45,46,57,58]; tmp_con(remove_order) = [];
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
data(:,remove_order)=[];

data = data';showdata = data';
% testdata = data(17,:);
% save('testdata2', 'testdata');
% save('real-data2-my', 'tmp_con', 'dataset');
save('real-data4', 'tmp_con', 'data');
