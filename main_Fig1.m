%% Pareto frontier
clear; clc;

N = 64;

Sing = [N;           N+N*(N-1)*(gamma(1.5))^4];
Tree = [2*N-1;       N^2];
Full = [N*(N+1)/2;   N^2];

NG = [2,4,8,16];
Fore = [N*(2-1./NG); N.*NG+(N./NG).*(N./NG-1).*(gamma(NG+0.5)./gamma(NG)).^4];

NG = [4,8,16];
Grou = [N*(NG+1)./2; N.*NG+(N./NG).*(N./NG-1).*(gamma(NG+0.5)./gamma(NG)).^4];

G = N:-1:1;
Fron = [N:2*N-1;     G - 1 + (N-G+1).^2 + (G-1).*(G-2).*(gamma(1.5)).^4 + 2*(G-1).*(gamma(N-G+1.5).*gamma(1.5)./gamma(N-G+1)).^2];

%% Linear scale
figure('defaulttextinterpreter','latex',...
       'defaultAxesTickLabelInterpreter','latex',...
       'defaultLegendInterpreter','latex');
scatter(Sing(1),Sing(2),'filled','DisplayName','Single-connected RIS');
hold on;

scatter(Tree(1),Tree(2),'filled','DisplayName','Tree-connected RIS');
scatter(Fore(1,:),Fore(2,:),'filled','DisplayName','Forest-connected RISs');

aa = area([Fron(1,:),Full(1)],[Fron(2,:),Full(2)],'FaceAlpha',0.2,'DisplayName','Feasible region');
uistack(aa, 'bottom');

grid on;
xlabel('Circuit complexity');
ylabel('Average received signal power');
legend('location','southeast','FontSize',12);
plots=get(gca, 'Children');
legend(plots([2,1,3,4]));

text(Fore(1,1)-4,Fore(2,1),'$N/G=2$','FontSize',12,'HorizontalAlignment','right')
text(Fore(1,2)-3,Fore(2,2),'$N/G=4$','FontSize',12,'HorizontalAlignment','right')
text(Fore(1,3)-2,Fore(2,3),'$N/G=8$','FontSize',12,'HorizontalAlignment','right')
text(Fore(1,4)-1.5,Fore(2,4),'$N/G=16$','FontSize',12,'HorizontalAlignment','right')

ax = gca;
ax.XTick = N:N/8:2*N;
ax.XLim = [N 2*N];
ax.YLim = [2400 4200];
set(gca, 'GridLineStyle', ':','GridAlpha', 0.5);
set(gcf, 'Color', [1,1,1]);
set(gca, 'LineWidth',1);
set(gca, 'fontSize',12);

%% Log scale
figure('defaulttextinterpreter','latex',...
       'defaultAxesTickLabelInterpreter','latex',...
       'defaultLegendInterpreter','latex');
scatter(Sing(1),Sing(2),'filled','DisplayName','Single-connected RIS');
hold on;

scatter(Tree(1),Tree(2),'filled','DisplayName','Tree-connected RIS');
scatter(Fore(1,:),Fore(2,:),'filled','DisplayName','Forest-connected RISs');

aa = area([Fron(1,:),Full(1)],[Fron(2,:),Full(2)],'FaceAlpha',0.2,'DisplayName','Feasible region');
uistack(aa, 'bottom');

scatter(Full(1),Full(2),'filled','DisplayName','Fully-connected RIS');
scatter(Grou(1,:),Grou(2,:),'filled','DisplayName','Group-connected RISs');

set(gca, 'XScale', 'log');
grid on;

xlabel('Circuit complexity');
ylabel('Average received signal power');
legend('location','southeast','FontSize',12);
plots=get(gca, 'Children');
legend(plots([2,1,4,3,5,6]));

text(Fore(1,1)*1.05,Fore(2,1),'$N/G=2$','FontSize',12)
text(Fore(1,2)/1.05,Fore(2,2),'$N/G=4$','FontSize',12,'HorizontalAlignment','right')
text(Fore(1,3)/1.05,Fore(2,3),'$N/G=8$','FontSize',12,'HorizontalAlignment','right')
text(Fore(1,4)/1.05,Fore(2,4),'$N/G=16$','FontSize',12,'HorizontalAlignment','right')
text(Grou(1,1)*1.05,Grou(2,1),'$N/G=4$','FontSize',12)
text(Grou(1,2)*1.05,Grou(2,2),'$N/G=8$','FontSize',12)
text(Grou(1,3)*1.05,Grou(2,3),'$N/G=16$','FontSize',12)

ax = gca;
ax.XTick = [100,200,500,1000,2000];
ax.YLim = [2400 4200];
set(gca, 'GridLineStyle', ':','GridAlpha', 0.5);
set(gcf, 'Color', [1,1,1]);
set(gca, 'LineWidth',1);
set(gca, 'fontSize',12);