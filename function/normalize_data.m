function total_data_n=normalize_data(total_data)
for i=1:size(total_data,2)
    if(sign(min(total_data(:,i)))<0)
        total_data_n(:,i)=total_data(:,i)+abs(min(total_data(:,i)));
        total_data_n(:,i)=total_data_n(:,i)./max(abs(total_data_n(:,i)));
    else
        total_data_n(:,i)=(total_data(:,i)./max(abs(total_data(:,i))));
    end
end
