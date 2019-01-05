%=========================================================================
%=========================================================================
%
% START FILLING-IN FOR REGULAR CREDIT HERE
%
%=========================================================================
%=========================================================================

close all; clear all;
% Precision values from 5 sessions
p1 = [0.25 0.55 0.70]; % query image = elephant
p2 = [0.50 0.70 0.80]; % F1
p3 = [0.65 0.85 0.90]; % sunset
p4 = [0.40 0.85 0.85]; % sailing boat
p5 = [0.30 0.60 0.60]; % monkey
rounds = 1:3;

% Plot (Feel free to use other kinds of plots - like bar plots etc)
plot(rounds, p1, 'b*-', rounds, p2, 'go-', rounds, p3, 'rx-', rounds, p4, 'cs-', rounds, p5, 'ms-');
grid on;
title('Precision vs Feedback Round');
xlabel('Feedback Round');
ylabel('Precision');
legend('elephant','F1','sunset','sailing boat','monkey','Location','southeast');
xlim([1 3]);
ylim([0 1]);
set(gca,'XTick', rounds);
saveas(gcf,'mp1','jpeg');

%=========================================================================
%=========================================================================
%
% START FILLING-IN FOR EXTRA CREDIT HERE
%
%=========================================================================
%=========================================================================

% Uncomment lines below for extra credit
% clear all; close all;
% cbirMP
% 
% pvec = [];
% p = [];
% done = false;
% while ~done
%     pvec = [pvec p];    
%     done = input('Enter 1 to exit, 0 to continue: ');
%     done = logical(done);
% end
% close all;
% plot(pvec);
% xlim([1 3]); ylim([0 1]); 
% set(gca,'XTick',[1:3]); % or xticks([1:3]);
% grid on;
%     
