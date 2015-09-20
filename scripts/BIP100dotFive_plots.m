% Script for FreeMat 4.0
%
% Plot the diagram of majority dependent maximum step bi-weekly adjustments that can occur on top of the default growth rate

clear all; close all;

x = [55,60,65,70,75,80,90];
y = 2.^[[1, 3, 8, 20, 42, 71, 135]./512];

figure;

plot(x,log(((y.^26-1)*100))/log(10),'*-');
grid on;
xlabel('Miner Vote Majority (%)');
ylabel('Change per year (percent or factor) in addition to the default growth rate');
title('Max. possible Change of BlockSizeLimit on top of Default Growth, depending on Vote Majority (percentage in log scale)');

str = '3.16%|10%|31.6%|100%|x 4.16|x 11.0|x 32.6|x 317|';
set(gca,'YTickLabel', str);

sizefig(900,550)
