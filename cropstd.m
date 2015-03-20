addpath C:\Users\add\Desktop\expGUI
addpath C:\Users\add\Desktop\LBP\proj\feret\FERET\montages-jpg\id_jpg
cd C:\Users\add\Desktop\LBP\proj\feret\FERET\montages-jpg\id_jpg
close all;
clear all;
allPics=dir('*.jpg');
k1=1;
c11=zeros(30,40);
s2=[];
cd C:\Users\add\Desktop\expGUI\crop
for i1=1:994
    bd=zeros(642,1);
    filename=allPics(i1).name;
    k1=1;
    fno=1;
    f2=strcat('ph',int2str(i1));
    mkdir(f2);
    f3=strcat('C:\Users\add\Desktop\expGUI\bin\ph',int2str(i1));
    f4=strcat('C:\Users\add\Desktop\expGUI\test\ph',int2str(i1));
    mkdir(f4);
    mkdir(f3);
     p=imread(filename);
     [c d]=size(p);
     for i=0:64:(d/3)-1
         for j=0:96:c-1
             rect=[i j 64 96];
             p1=imcrop(p,rect);
             p2=rgb2gray(p1);
             clear p21;
             s1=0;
                  data3=p2(31:60,11:50);
                   data4=255-data3;
                   if(data4~=c11)
                       [a b]=size(p2);
                         syms r s;
                         a1=a-1;
                         b1=b-1;
                         bdi=1;
                         fid=0;
                         fid1=0;
                         if(fno==1)
                            pat=strcat('C:\Users\add\Desktop\expGUI\test\','ph',int2str(i1),'\f',int2str(fno),'.m');
                           %pat1=strcat('C:\Users\add\Desktop\expGUI\bin\','ph',int2str(i1),'\f',int2str(fno),'.m');
                           %fid1=fopen(pat1,'w');
                         else
                             pat=strcat('C:\Users\add\Desktop\expGUI\bin\','ph',int2str(i1),'\f',int2str(fno),'.m');
                         end
                        fid=fopen(pat,'w'); 
                        fno=fno+1;
                        
                         for i11=2:3:a1
                            for j11=2:3:b1
                              x =[p2(i11-1,j11)  p2(i11-1,j11-1) p2(i11,j11-1) p2(i11+1,j11-1) p2(i11+1,j11) p2(i11+1,j11+1) p2(i11,j11+1) p2(i11-1,j11+1)];
                              x= x-p2(i11,j11);
                              temp=0;
                              for k=1:8
                               if(x(k) > 0) 
                                  x(k)=1;
                               else
                               x(k)=0;
                               end
                               x11=sum(x);
                               temp=temp+((2^(k-1))*x(k));
                              end
                              bd(bdi)=temp;
                              bdi=bdi+1;
                              fprintf(fid,'%d \n',temp);
                              %fprintf(fid1,'%d\n',temp);
                              r=j11;
                              s=i11;
                                for k=2:100
                                    if( r > 3 )
                                     if( s > 3 )
                                            r=j11-3;
                                            s=i11-3;
                                     else
                                    r=j11-3;
                                     end
                                    else if( s > 3 )
                                            s=i11-3;
                                        end
                                    end
                                end
                                for k=1:8
                                if((r==2)||(s==2))
                                       if(x11>4)
                                           p5(i11,j11)=1;
                                       else
                                           p5(i11,j11)=0;
                                       end
                                else
                                   p5(i11,j11)=x(k);
                                end
                                end
                         end
                         end
                    if(k1==1)
                        imwrite(p2,[f2,'\' strcat(int2str(k1),'.jpg')]);
                        imwrite(p2,[f4,'\' strcat(int2str(k1),'.jpg')]);
                        imwrite(p5,[f4,'\' strcat(int2str(k1),'.bmp')]);
                    else
                        imwrite(p2,[f2,'\' strcat(int2str(k1),'.jpg')]);
                        imwrite(p5,[f3,'\' strcat(int2str(k1),'.bmp')]);
                    end
                        
                    k1=k1+1;
                    fclose(fid);
                    %close(fid1);
                    clear fid;
                   % clear fid1;
                   end
         end
     end
end
cd C:\Users\add\Desktop\expGUI\

% %multiplexing the test img for test n bin
addpath C:\Users\add\Desktop\expGUI\bin
cd C:\Users\add\Desktop\expGUI\test
for i4=1:994
    fol=strcat('ph',int2str(i4));
    cd(fol);
    dirl=dir('f*.m');
    if(length(dirl)>0)
        mf=str2num(fileread('f1.m'));
        cd('C:\Users\add\Desktop\expGUI\bin');
        fp=fopen(strcat('ph',num2str(i4),'\f1.m'),'w');
        fprintf(fp,'%d \n',mf);
        fclose(fp);
        clear mf;
    end
    cd C:\Users\add\Desktop\expGUI\test
 end