function [total_data,total_data_n,total_class,features]=load_data_glass()
load glass_class
load glass_data
total_data=glass_data;
total_class=glass_class;
total_data_n=normalize_data(total_data);
features=size(total_data,2);