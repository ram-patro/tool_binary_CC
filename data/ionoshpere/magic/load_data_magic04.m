function [total_data,total_data_n,total_class,features]=load_data_magic04()
load magic04_class
load magic04_data
total_data=magic04_data;
total_class=magic04_class;
total_data_n=normalize_data(total_data);
features=size(total_data,2);