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
Ndata = 70+1; % scope_0~70 is data
dataset = cell(Ndata, 1); tmp_con = zeros(Ndata, 1);
% unit: mmol/L = 18 mg/dL
tmp_con = [0,0,0,5.25,5.25,5.25,13.5,13.5,13.5,14.4,14.4,14.4,7.9,7.9,7.9,...
    13.5,13.5,13.5,6.3,6.3,6.3,6.3,3.63,3.63,3.63,3.63,18.0,18.0,18.0,18.0,...
    4.2,4.2,4.2,4.2,1.7,1.7,1.7,1.7,1.7,9.2,9.2,9.2,7.2,7.2,7.2,5.36,5.36,5.36...
    1.1,1.1,1.1,1.1,9.4,9.4,9.4,12.5,12.5,12.5,12.5,12.5,2.2,2.2,2.2,21.7,21.7,...
    21.7,21.7,21.7,0,0,0]*18;
remove_order = [44,45,53,54,55,69,70,71]; tmp_con(remove_order) = [];
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
save('real-data5', 'tmp_con', 'data');
%% 导入几个有趣的干扰信号
% scope_st0 和 scope_st1为无水，空管情况下信号;
% scope_st2 和 scope_st3为无水，底部有少量耦合剂;
data_other = [];
for n = 1:4
    fName = sprintf('scope_st%d.csv', n-1);
    
    c = importfile_other(fName, 3, 1002);
    data_other = [data_other, c(:,2)];
end
data_other = data_other';showdata_other = data_other';
save('real-data_other1', 'data_other');