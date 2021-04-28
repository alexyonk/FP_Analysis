%**************** Single Color Detrending for Fiber Photometry*************
%                   Created by AY on 4/28/2021
%                   Last Updated on 4/28/2021
%        For any issues or bugs, please contact alex.yonk2@gmail.com
%Note: This code is dependent upon the output from OceanOptics software

clear;
%Change directory to current folder and select data file
[path] = uigetdir;
cd(path);
file = uigetfile;
FullFile = xlsread(file);

%Convert time from UNIX to ms and remove unnecessary rows
%NOTE = This section needs to be removed once the UNIX issue is resolved
if FullFile(2,2) == 0
    for i = 2:size(FullFile,1) - 1
        Time(i,1) = (40*i) - 40;
    end
end

Mins = (Time/1000)/60;

%Calculate median value of signal and combine with time data
medianGreen = median(FullFile(2:end,398:514),2);
Data = [Time medianGreen];

%Calculate Line of Best Fit
BestFitG = polyfit(Time(:,1),medianGreen(:,1),2);

%Calculate Trendline and Detrend signal
TLG = ((BestFitG(1,1)*(Time(:,1).^2)) + (BestFitG(1,2)*Time(:,1)) + (BestFitG(1,3)));
DetrendGreen = Data(:,2) - TLG;

%Calcualte Delta F/F
meanBaseline = mean(DetrendGreen);
medianBaseline = median(DetrendGreen);
madBaseline = mad(DetrendGreen);
stdBaseline = std(DetrendGreen);

%Note: Polynomial is badly conditioned. Need to increase the order
for i = 1:height(medianGreen)
    DFGreen(i,1) = (DetrendGreen(i,1) - meanBaseline) / meanBaseline;
end

%Calculate MAD Z Score
for i = 1:height(medianGreen)
    ZGreenMAD(i,1) = (DetrendGreen(i,1) - medianBaseline) / madBaseline;
end

%Calculate Z Score
for i =1:height(medianGreen)
    ZGreenMean(i,1) = (DetrendGreen(i,1) - meanBaseline) / stdBaseline;
end

%Plot DFGreen, MAD Z Score, and Z Score in a subplot
figure;subplot(2,2,1);
plot(Mins,ZGreenMAD,'g');
ylabel('MAD Z Score');
title('Green MAD Z Score');
xlabel('Time (in mins)');

subplot(2,2,2);
plot(Mins,ZGreenMean,'g');
title('Green Z Score');
ylabel('Z Score');
xlabel('Time (in mins)');

subplot(2,2,[3 4]);
plot(Mins,DFGreen,'g');
title('Green Delta F/F');
ylabel('Delta F/F');
xlabel('Time (in mins)');