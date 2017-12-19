function total_data_n=normalize_data(total_data)
for i=1:size(total_data,2)
    if(sign(min(total_data(:,i)))<0)
        total_data_n=total_data+abs(min(total_data));
        total_data_n=total_data_n./max(abs(total_data_n));
    else
        total_data_n=(total_data./max(abs(total_data)));
    end
end
% figure,
% subplot(1,2,1);plot(total_data(:,1),total_data(:,2),'*');xlim([min(total_data(:,1)) max(total_data(:,1))]);ylim([min(total_data(:,2)) max(total_data(:,2))]);
% title('original data');xlabel('feature 1');ylabel('feature 2');
% subplot(1,2,2);plot(total_data_n(:,1),total_data_n(:,2),'*');xlim([min(total_data_n(:,1)) max(total_data_n(:,1))]);ylim([min(total_data_n(:,2)) max(total_data_n(:,2))]);
% title('normalised data');xlabel('feature 1');ylabel('feature 2');