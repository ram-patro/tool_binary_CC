function [total_data,total_data_n,total_class,features]=load_data_eighthr()
load eighthr_class
load eighthr_data
total_data=eighthr_data;
total_class=eighthr_class;
total_data_n=normalize_data(total_data);
features=size(total_data,2);