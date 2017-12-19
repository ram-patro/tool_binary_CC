function [data,class]=svm2mat(s)
fid = fopen(s);
i=1;skip=[];
while ~feof(fid) % not end of the file 
       s = fgetl(fid); % get a line 
       s1=[];  j=1;
       while (j<=length(s))
             while( s(j)~=' ' && j<length(s))    
                   s1=[s1 s(j)];
                   j=j+1;   
             end  
             j=j+1;   
             s1=[s1 ' '];              
             while ( (j<length(s)) && (s(j)~=':') )   
                    j=j+1;   
             end             
             j=j+1;   
       end
        s2=str2num(s1) ;
        if (i==1)
            yy=zeros(1,length(s2));
        end
        if(size(yy,2)==size(s2,2))
            yy=[yy ; s2];
        else
           skip=[skip i];
        end
        i=i+1;      
end
%numel(skip)
yy(1,:)=[];
y=yy;
class=grp2idx(y(:,1));
data=y(:,2:end);

