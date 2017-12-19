function [total_data,total_data_n,total_class,features]=load_data_parkinsons()
load parkinsons_class
load parkinsons_data
total_data=parkinsons_data;
total_class=parkinsons_class;
total_data_n=normalize_data(total_data);
features=size(total_data,2);