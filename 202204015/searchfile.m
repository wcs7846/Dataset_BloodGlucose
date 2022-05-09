function [ file_array ] = searchfile( content , filetype)
%%SEARCHFILE:this function is used to search files in the content
%{ 
 Copyright(C),UESTC,?School?of?Information?and?Communication?Engineering,?IDIP
 detail
 Input:  content    --> a struct type of content(from dir function)
         filetype   --> the type of file
 Output: file_array --> a array of filename
%}
% preinstalled parameters
if nargin == 0
    error('please enter at least 1 parameter!');
elseif nargin == 1
    filetype = 'txt';
end
num = numel(content);
file_array = {};
% check input
if num == 0
    return;
end
tc = strfind(filetype, '.'); % check the input filetype is right or no
if tc ~= []
    filetype = filetype(tc,:);
end
% check all elements
tn = 1;
for n = 1:num
    tmp_Name = content(n).name;
    % remove '.' and '..'
    if strcmp(tmp_Name, '.')
        continue;
    elseif strcmp(tmp_Name, '..')
        continue;
    end
    
    loc = strfind(tmp_Name, '.');
    if ~isempty(loc) && numel(loc) > 1
        loc = loc(numel(loc));
    end
    realtype = tmp_Name(loc+1:length(tmp_Name));
    if strcmp(realtype, filetype)
        file_array{tn} = {tmp_Name}; % C/C++(push_back())
        tn = tn + 1;
    end
end
 