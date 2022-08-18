clc; clear; close all;

% ��������
syms x y;

f(x) = sin(x);
g(x, y) = cos(x)^2 + sin(y);

df(x) = diff(f(x), 2) % ����׵�
dg(x, y) = diff(g(x, y), x) + diff(g(x, y), y) % ��ƫ����


% ������ֵ���������ı��ʽ
x = 0;
y = pi/6;

f_x = subs(f(x))
df_x = subs(df(x))

g_xy = subs(g(x, y))
dg_xy = subs(dg(x, y))


% ��������ֵ
eval([vectorize(f_x)]) % eval([vectorize(f(x))])
eval([vectorize(df_x)])
eval([vectorize(g_xy)])
eval([vectorize(dg_xy)])
