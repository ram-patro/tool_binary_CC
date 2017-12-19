function [total_data,total_data_n,total_class,features]=load_data_clean1()
load clean1_class
load clean1_data
total_data=clean1_data;
total_class=clean1_class;
total_data_n=normalize_data(total_data);
features=size(total_data,2);