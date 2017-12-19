clear
close all
clc

load eighthr
bin=eighthr<=max(max(eighthr));
binsum=sum(bin,2);
locs=find(binsum<72);
eighthr(locs,:)=[];
eighthr_data=eighthr;
save eighthr_data eighthr_data