%% 
clc;clear;close all;
%% 说明
% 1. 目前只是将水的光声信号幅度作为标尺，统一每一次实验中水的光声信号强度；
% 2. 对不同次实验的数据比例问题没有进行统一。
%% 加载第一次实验
% 浓度列表如下：
% tmp_con = [0,0,0,1.3,1.3,1.3,4.4,4.4,4.4,5.1,5.1,5.1,6.1,6.1,6.1,7.4,7.4, ...
%     8.5,8.5,8.5,9.2,9.2,9.2,9.9,9.9,9.9,10.2,10.2,10.2,12.1,12.1,12.1,13.5, ...
%     13.5,14.1,14.1,14.1,15.2,15.2,15.2,16.4,16.4,16.4,17.0,17.0,17.0,18.8, ...
%     18.8,18.8,19.3,19.3,19.3,19.9,19.9,19.9]*18;
% remove_order = [1,12,23,34,45,52,53,54,55]; tmp_con(remove_order) = [];
% 第1,2个数据为水,以此作为基础归一化其他浓度的峰值.
load real-data2
maxValue = max(data, [], 2); Normalization_water = mean(maxValue(1:2));
data = data/Normalization_water; % 即水的信号峰值都是1
maxValue = max(data, [], 2); % update the maxValue

tmp_data = data; ttmp_con = tmp_con;
%% 加载第二次实验
% 浓度列表如下：
load real-data3
% tmp_con = [22,22,21,5,21.5,21.5,11.7,11.7,11.7,16.4,16.4,17.8,17.8,...
%     22.7,22.7,22.7,0,0,24.2,22,22,22,14.3,14.3,14.3,21.5,21.5,21.5]*18;
% remove_order = [1,2,3]; tmp_con(remove_order) = [];
% 第16,17个数据为水,以此作为基础归一化其他浓度的峰值.
maxValue = max(data, [], 2); Normalization_water = mean(maxValue(16:17));
data = data/Normalization_water;
maxValue = max(data, [], 2); % update the maxValue

data = [tmp_data; data]; tmp_con = [ttmp_con, tmp_con];

tmp_data = data; ttmp_con = tmp_con;
%% 加载第三次实验
% 浓度列表如下：
load real-data4
% tmp_con = [0, 0, 0, 16.5, 16.5, 16.5, 4.2, 4.2, 4.2, 14.05, 14.05, 14.05,...
%     5.6, 5.6, 5.6, 10.1, 10.1, 10.1, 7.2, 7.2, 7.2, 6.23, 6.23, 6.23, ...
%     8.73, 8.73, 8.73, 23.9, 23.9, 23.9, 23.9, 16.4, 16.4, 16.4, 16.4, 16.4,...
%     14.3, 14.3, 14.3, 14.3, 22.7, 22.7, 22.7, 22.7, 11.7, 11.7, 11.7, 11.7,...
%     11.7, 17.8, 17.8, 17.8, 21.9, 21.9, 21.9, 21.9, 14.5, 14.5, 14.5, 14.5,...
%     14.5 ]*18;
% remove_order = [38,45,46,57,58]; tmp_con(remove_order) = [];
% 第1,2,3个数据为水,以此作为基础归一化其他浓度的峰值.
maxValue = max(data, [], 2); Normalization_water = mean(maxValue(1:3));
data = data/Normalization_water;
maxValue = max(data, [], 2); % update the maxValue

data = [tmp_data; data]; tmp_con = [ttmp_con, tmp_con];

tmp_data = data; ttmp_con = tmp_con;
%% 加载第四次实验
% 浓度列表如下：
load real-data5
% tmp_con = [0,0,0,5.25,5.25,5.25,13.5,13.5,13.5,14.4,14.4,14.4,7.9,7.9,7.9,...
%     13.5,13.5,13.5,6.3,6.3,6.3,6.3,3.63,3.63,3.63,3.63,18.0,18.0,18.0,18.0,...
%     4.2,4.2,4.2,4.2,1.7,1.7,1.7,1.7,1.7,9.2,9.2,9.2,7.2,7.2,7.2,5.36,5.36,5.36...
%     1.1,1.1,1.1,1.1,9.4,9.4,9.4,12.5,12.5,12.5,12.5,12.5,2.2,2.2,2.2,21.7,21.7,...
%     21.7,21.7,21.7,0,0,0]*18;
% remove_order = [44,45,53,54,55,69,70,71]; tmp_con(remove_order) = [];
% 第1,2,3个数据为水,以此作为基础归一化其他浓度的峰值.
maxValue = max(data, [], 2); Normalization_water = mean(maxValue(1:3));
data = data/Normalization_water;
maxValue = max(data, [], 2); % update the maxValue

data = [tmp_data; data]; tmp_con = [ttmp_con, tmp_con];
show_data = data';
save('real-data_total', 'tmp_con', 'data');