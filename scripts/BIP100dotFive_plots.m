%---------------------------------------------------------------------------------------------------
% Script for FreeMat 4.0 (Matlab clone with GPLv2 license)
% Download for all operating systems: http://freemat.sourceforge.net/download.html
%
%---------------------------------------------------------------------------------------------------
clear all; close all;

%% ----- Parameters: -----

% Majority values:
x = [55,60,65,70,75,80,90];

% Default bi-weekly step adjustment factor:
d = 2^(8/512);

% Maximum bi-weekly step adjustment factors relative to the default "d":
y = 2.^[[1, 3, 8, 20, 42, 71, 135]./512];


%%---------------------------------------------------------------------------------------------------
%% ----- Plot Part 1: Plot the diagram of majority dependent maximum step bi-weekly adjustments that
%%       can occur on top of the default growth rate
figure;

plot(x,log(((y.^26-1)*100))/log(10),'*-');
grid on;
xlabel('Miner Vote Majority (%)');
ylabel('Change per year (percent or factor) in addition to the default growth rate');
title('Max. possible Change of BlockSizeLimit on top of Default Growth, depending on Vote Majority (percentage in log scale)');

str = '3.16%|10%|31.6%|100%|x 4.16|x 11.0|x 32.6|x 317';
set(gca,'YTickLabel', str);

sizefig(900,550)

%%---------------------------------------------------------------------------------------------------
%% ----- Plot Part 2: Plot Growth Curves
ymin = d ./ y;
ymax = d * y;

t = [0:0.1:15];
time = t+2016;

figure;
grid on; hold on;
semilogy(time, (d^26).^t,'r','linewidth',4);
semilogy(time, (ymin(1)^26).^t,'b','linewidth',2);
semilogy(time, (ymin(2)^26).^t,'c','linewidth',2);
semilogy(time, (ymin(3)^26).^t,'g','linewidth',2);
semilogy(time, (ymin(4)^26).^t,'m','linewidth',2);
semilogy(time, (ymin(5)^26).^t,'y','linewidth',2);
semilogy(time, (ymin(6)^26).^t,'b','linewidth',2);
semilogy(time, (ymin(7)^26).^t,'c','linewidth',2);
semilogy(time, (1.177).^t,'k-.','linewidth',2);
semilogy(time, (1.414).^t,'k--','linewidth',2);
semilogy(time, (ymax(1)^26).^t,'b','linewidth',2);
semilogy(time, (ymax(2)^26).^t,'c','linewidth',2);
semilogy(time, (ymax(3)^26).^t,'g','linewidth',2);
semilogy(time, (ymax(4)^26).^t,'m','linewidth',2);
semilogy(time, (ymax(5)^26).^t,'y','linewidth',2);
semilogy(time, (ymax(6)^26).^t,'b','linewidth',2);
semilogy(time, (ymax(7)^26).^t,'c','linewidth',2);
xlabel('Year');
ylabel('Block size Limit [MByte]');
title('Possible Block Size Limit Evolutions');
tmp=num2str((d^26-1)*100,'%0.1f');
legend(['Default (',tmp,'% p.a.)'],'55% vote majority','60% vote majority','65% vote majority','70% vote majority','75% vote majority',...
    '80% vote majority','90% vote majority','17.7% p.a. (BIP-(103?))','41.4% p.a. (BIP-101)' 'location','east');

sizefig(1600,550)

a=axis;
axis([a(1) a(2) 1e-2 1e2])
set(gca,'YTickLabel', '0.01|0.1|1|10|100');
