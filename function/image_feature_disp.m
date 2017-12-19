function image_feature_disp(ref)
for i=1:numel(unique(ref.class))
    st(i).vec=[];
    stt(i).vec=[];
end
for i=1:numel(ref.class)
    st(ref.class(i)).vec=[st(ref.class(i)).vec;[ref.uqm{i}']];
    stt(ref.class(i)).vec=[stt(ref.class(i)).vec;[ref.dev{i}']];
end
ft=size(ref.uqm{1},1);
dis_1=[st(1).vec;st(2).vec];
dis_2=[stt(1).vec;stt(2).vec];
ref.class(ref.class==1)=0;ref.class(ref.class==2)=1;
dis_3=[ref.prob'*50   ref.class'];
dis=[dis_1 ones(size(dis_1,1),1)*0.5 dis_2   dis_3];dis=[dis(1:numel(find(ref.class==0)),:) ;ones(1,size(dis,2))*0.5  ;dis(numel(find(ref.class==0))+1:end,:)];
mask1=ones(size(dis));
mask1(dis==0.5)=0;
mask2=ones(size(dis));
mask2(dis==0.5)=0.2;
mask1(:,end)=0.5;
mask2(:,end)=0.5;
mask1(:,end-1)=0.2;
mask2(:,end-1)=0.5;
dis=cat(3,dis,mask1,mask2);
figure,
imshow(wextend(2,'zpd',imresize(rgb2gray(dis),9,'method','nearest'),3));