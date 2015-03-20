addpath C:\Users\add\Desktop\expGUI\
cd C:\Users\add\Desktop\expGUI\
close all;
clear all;
r1=[];
emp=0;
k111=zeros(96,64);
f11=str2num(fileread('C:\Users\add\Desktop\expGUI\test\ph557\f1.m'));
imshow('C:\Users\add\Desktop\expGUI\test\ph557\1.jpg');
x = [0.6698 0.5851];
y = [0.2593 0.3492];
% Create the textarrow object: 
txtar =  annotation('textarrow',x,y,'String','Input','FontSize',14);

for m=1:994
    cd(strcat('C:\Users\add\Desktop\expGUI\bin\ph',int2str(m)));
    hi=str2num(fileread('avg1.m'));
     f1=int2str(hi(1));
     if(strcmp(f1,'NaN'))
         emp=emp+1;
     end
        r2=corr2(f11,hi);
        r1=[r1 r2];
end



[a b]=sort(r1,'descend');
 c=a(1);
 d=b(emp+1);
 e=b(emp+2);
 cd(strcat('C:\Users\add\Desktop\expGUI\bin\ph',int2str(d)));
 
 
 pwd
 
 dirl=dir('*.bmp');
 r4=[];
 dirll=dir(strcat('C:\Users\add\Desktop\expGUI\crop1\ph',int2str(d),'\*.jpg'));
 
 if(length(dirll)==0)
    figure;
    imshow(k111);
    x = [0.5098 0.5851];
    y = [0.2593 0.3492];
    % Create the textarrow object: 
    txtar =  annotation('textarrow',x,y,'String','No samples.','FontSize',14);   
 else
     for k=1:length(dirl)
         str=strcat('C:\Users\add\Desktop\expGUI\bin\ph',int2str(d));
         cd(str);
         fil1=str2num(fileread(strcat('f',int2str(k+1),'.m')));
         r3=corr2(f11,fil1);
         r4=[r4 r3];
    end
    [c1 d1]=sort(r4,'descend');
    fl=strcat('C:\Users\add\Desktop\expGUI\crop1\ph',int2str(d),'\',int2str(d1(1)+1),'.jpg');
    figure;
    imshow(fl);
    x = [0.6698 0.5851];
    y = [0.2593 0.3492];
    % Create the textarrow object: 
    txtar =  annotation('textarrow',x,y,'String','Output-1','FontSize',14);   
 end
 
 
 cd(strcat('C:\Users\add\Desktop\expGUI\bin\ph',int2str(e)));
 
 pwd
 
 dir2=dir('*.bmp');
 r4=[];
 dir21=dir(strcat('C:\Users\add\Desktop\expGUI\crop1\ph',int2str(e),'\*.jpg'));
 if(length(dir21)==0)
    figure;
    imshow(k111);
    x = [0.5098 0.5851];
    y = [0.2593 0.3492];
    % Create the textarrow object: 
    txtar =  annotation('textarrow',x,y,'String','No samples.','FontSize',14);   
 else
     for k1=1:length(dir2)
         str=strcat('C:\Users\add\Desktop\expGUI\bin\ph',int2str(e));
         cd(str);
         fil1=str2num(fileread(strcat('f',int2str(k1+1),'.m')));
         r3=corr2(f11,fil1);
         r4=[r4 r3];
    end
    [c1 d1]=sort(r4,'descend');
    f2=strcat('C:\Users\add\Desktop\expGUI\crop1\ph',int2str(e),'\',int2str(d1(1)+1),'.jpg');
    figure;
    imshow(f2);
    x = [0.6698 0.5851];
    y = [0.2593 0.3492];
    % Create the textarrow object: 
    txtar =  annotation('textarrow',x,y,'String','Output-2','FontSize',14);   
 end
cd C:\Users\add\Desktop\expGUI\