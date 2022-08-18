% ����̩��չ���ĺ����£�https://www.zhihu.com/question/25627482

clc; clear; close all;

% ��������
syms x x0;

f(x) = sin(x);

% Tylaor: g(x) = a0 + a1*x^2 + a2*x^3 + a3*x^4 + ...
g_x0 = f(x0);

% ��̬����̩��չ��
% g(x) = g_x0 + diff(f(x0), 1)*(x - x0)/factorial(1) + diff(f(x0), 2)*(x - x0)^2/factorial(2) + diff(f(x0), 3)*(x - x0)^3/factorial(3)

% ��̬����̩��չ��, ע�⣬����û�п����������Ҫ���ǣ��뿴����ԭ��
gx_list = [];
g(x) = g_x0;
M = 20; % ̩��չ���Ľ���
for m=1:M
    g(x) = g(x) + diff(f(x0), m)*(x - x0)^m/factorial(m);
    gx_list = [gx_list; g(x)];
end


% ����չ�����ֵ
N = 200;
x = linspace(0, 10*pi, N);

% ȡ��ͬ�ĳ�ֵ��̩��չ����λ�õ㣩��̩��չ����Ч������һ��
% x0 = 0;
x0 = x(round(N/2));

f_x = zeros(N, 1);
g_x = zeros(N, 1);

figure(1)
for m = 1:M
    f_x = eval([f(x)]);
    g_x_now = gx_list(m);
    g_x = eval([g_x_now]);

    plot(x, f_x, 'r--', 'linewidth', 1.0)
    hold on;
    plot(x, g_x, 'b', 'linewidth', 1.2)
    hold off;
    legend({'f(x)', 'g(x)'})
    ylim([-3.0, 3.0])
    xlim([min(x)-5, max(x)+5])

    % ����gif
    F=getframe(gcf);
    I=frame2im(F);
    [I, map]=rgb2ind(I,256);

    if m == 1
        imwrite(I,map,'./pic/Taylor.gif','gif','Loopcount',inf,'DelayTime',0.2);
    else
        imwrite(I,map,'./pic/Taylor.gif','gif','WriteMode','append','DelayTime',0.2);
    end

    pause(0.1)
end
