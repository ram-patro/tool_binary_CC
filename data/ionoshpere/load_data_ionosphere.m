function [total_data,total_data_n,total_class,features]=load_data_ionosphere()
load ionosphere_class
load ionosphere_data
ionosphere_data(:,2)=[];
total_data=ionosphere_data(:,2:end);
total_class=ionosphere_class;
total_data_n=normalize_data(total_data);
features=size(total_data,2);