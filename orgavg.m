addpath C:\Users\add\Desktop\expGUI\bin
cd C:\Users\add\Desktop\expGUI\bin

for i11=1:994
    fol=strcat('ph',int2str(i11));
    cd(fol);
    mf=dir('f*.m');
    ph1=zeros(672,1);
    fp=fopen('avg1.m','w');
    for i=1:length(mf)
        fop=zeros(672,1);
        fop=str2num(fileread(mf(i).name));
        ph1=ph1+fop;
    end
    ph1=round(ph1/length(mf));
    fprintf(fp,'%d\n',ph1);
    fclose(fp);
    cd C:\Users\add\Desktop\expGUI\bin
end