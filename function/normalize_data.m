function total_data_n=normalize_data(total_data)
for i=1:size(total_data,2)
    if(sign(min(total_data(:,i)))<0)
        total_data_n=total_data+abs(min(total_data));
        total_data_n=total_data_n./max(abs(total_data_n));
    else
        total_data_n=(total_data./max(abs(total_data)));
    end
end
