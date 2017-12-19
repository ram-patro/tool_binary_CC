function [train_data,train_data_n,train_class,test_data,test_data_n,test_class,dim]=divide_data(total_data,total_data_n,total_class,per)
if(per~=100)
    total(1).mat=[];
    total(2).mat=[];
    for i=1:size(total_data,1)
        total(total_class(i)).mat=[total(total_class(i)).mat;total_data(i,:)];
    end
    sz1=size(total(1).mat,1);
    sz2=size(total(2).mat,1);
    locs1=randperm(sz1,sz1);locs1_tr=locs1(1:floor((sz1/100)*per));locs1_tst=locs1(floor((sz1/100)*per)+1:end);
    locs2=randperm(sz2,sz2);locs2_tr=locs2(1:floor((sz2/100)*per));locs2_tst=locs2(floor((sz2/100)*per)+1:end);
    train_data(1).mat=total(1).mat(locs1_tr,:);
    train_data(2).mat=total(2).mat(locs2_tr,:);
    train_class=[ones(1,size(train_data(1).mat,1)) ones(1,size(train_data(2).mat,1))*2];
    test_data=[total(1).mat(locs1_tst,:);total(2).mat(locs2_tst,:)];
    test_class=[ones(numel(locs1_tst),1);ones(numel(locs2_tst),1)*2]; 
    dim=[numel(locs1_tr) numel(locs2_tr) numel(locs1_tst) numel(locs2_tst)];

    totaln(1).mat=[];
    totaln(2).mat=[];
    for i=1:size(total_data,1)
        totaln(total_class(i)).mat=[totaln(total_class(i)).mat;total_data_n(i,:)];
    end
    train_data_n(1).mat=totaln(1).mat(locs1_tr,:);
    train_data_n(2).mat=totaln(2).mat(locs2_tr,:);
    test_data_n=[totaln(1).mat(locs1_tst,:);totaln(2).mat(locs2_tst,:)];
else
train_data(1).mat=total_data(total_class==1,:);
train_data(2).mat=total_data(total_class==2,:);
train_data_n(1).mat=total_data_n(total_class==1,:);
train_data_n(2).mat=total_data_n(total_class==2,:);
train_class=[ones(1,size(train_data(1).mat,1)) ones(1,size(train_data(2).mat,1))*2];
test_data=total_data;
test_data_n=total_data_n;
test_class=total_class;
dim=[numel(find(test_class==1)) numel(find(test_class==2)) numel(find(test_class==1)) numel(find(test_class==2))];
end