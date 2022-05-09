%% Copyright(C),UESTC, School of Information and Communication Engineering, IDIP
% This script is designed to implement the measure function
% Author: MarkLHF(website: https://github.com/wcs7846)
% Date: 2020-7-3
close all;clear;
% 单位为mmol每分升
%
select_p = '.\';
tmp = dir(select_p);
fileName = searchfile(tmp, 'txt');

%% load data
Ndata = length(fileName);
dataset = []; tmp_con = zeros(Ndata, 1);
for n = 1:Ndata
    fName = string(fileName{n}{1});
    
    fileID  = fopen(strcat(select_p,'\', fName));
    c = textscan(fileID , '%f');c = c{1};
    fclose(fileID);
    
    dataset = [dataset; c'];  % each row is a data
    % get the concentration
    loc1 = strfind(fName, '-');
    if ~isempty(loc1) && numel(loc1) > 1
        loc1 = loc1(numel(loc1));
    end
    loc2 = strfind(fName, '.');
    if ~isempty(loc2) && numel(loc2) > 1
        loc2 = loc2(numel(loc2));
    end
    tmpName = char(fName);
    tmp_con(n) = str2num(tmpName(loc1+1:loc2-1));
    % 1 mmol/L = 18 mg/dL = 180 mg/L = 0.18 g/L
    tmp_con(n) = tmp_con(n) * 180; % mg/L
end
% re-order
tt = [tmp_con, (1:numel(tmp_con))'];
tt = sortrows(tt, 1);
tmp_con = tt(:,1); data = dataset(tt(:,2),:);

save('real-data', 'tmp_con', 'data');
