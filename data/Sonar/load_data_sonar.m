function [total_data,total_data_n,total_class,features]=load_data_sonar()
load sonar_class
load sonar_data
total_data=sonar_data;
total_class=sonar_class;
total_data_n=normalize_data(total_data);
features=size(total_data,2);