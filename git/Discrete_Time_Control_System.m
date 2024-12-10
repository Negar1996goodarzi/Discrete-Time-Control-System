close all
clear all
clc


%% Part 1
close all
clear all
clc



A = [0.9863, 0.0528; -0.1189, 1.1680];
B = [0.0024; 0.0628];
Q = [2, 0; 0, 1];
R = 2;
H = [2, 0; 0, 0];

% Horizon
N = 3;
M = N + 1;

P = cell(1, M);
F = cell(1, M);
J = cell(1, M);
U = cell(1, N);
X = cell(1, M);


% Initial value
P{1} = H;
X{1} = [0.1; 0.1];

for K = 1:N
    % Calculate F(N-K)
    F{N-K+1} = -inv(R + B' * P{K} * B) * B' * P{K} * A;

    % Calculate P(K)
    P{K+1} = (A + B * F{N-K+1})' * P{K} * (A + B * F{N-K+1}) + F{N-K+1}' * R * F{N-K+1} + Q;
end

for K = 1:N
    U{K} = F{K} * X{K};
    X{K+1} = A * X{K} + B * U{K};
    J{K} = 0.5 * X{K}' * P{K+1} * X{K};
end

% Plotting X values
x1_values = cellfun(@(x) x(1), X);
x2_values = cellfun(@(x) x(2), X);
k_values = 0:N;
plot(k_values, x1_values,  'DisplayName', 'x1');
hold on;
plot(k_values, x2_values,  'DisplayName', 'x2');
xlabel('k');
ylabel('X');
title('X values');
legend('Location', 'best');
hold off;

figure()
% Plotting U values
u_values = cellfun(@(u) u(1), U);
plot(k_values(1:N), u_values, 'DisplayName', 'U');
xlabel('k');
ylabel('U');
title('U values');
legend('Location', 'best');


%% part 2
clear  all
close all
clc

A = [0.9863, 0.0528; -0.1189, 1.1680];
B = [0.0024; 0.0628];
Q = [2, 0; 0, 1];
R = 2;
H = [0, 0; 0, 0];

% Horizon
N = 200;
M = N + 1;

P = cell(1, M);
F = cell(1, M);
J = cell(1, M);
U = cell(1, N);
X = cell(1, M);

% Initial value 
X{1} = [0.1; 0.1];
P{1} = H;

for K = 1:N
    % Calculate F(N-K)
    F{N-K+1} = -inv(R + B' * P{K} * B) * B' * P{K} * A;

    % Calculate P(K)
    P{K+1} = (A + B * F{N-K+1})' * P{K} * (A + B * F{N-K+1}) + F{N-K+1}' * R * F{N-K+1} + Q;
end


for K = 1:N
    U{K} = F{K} * X{K};
    X{K+1} = A * X{K} + B * U{K};
    J{K} = 0.5 * X{K}' * P{K+1} * X{K};
end

% Plotting X values
x1_values = cellfun(@(x) x(1), X);
x2_values = cellfun(@(x) x(2), X);
k_values = 0:N;
plot(k_values, x1_values, 'DisplayName', 'x1');
hold on;
plot(k_values, x2_values, 'DisplayName', 'x2');
xlabel('k');
ylabel('X');
title('X values');
legend('Location', 'best');
hold off;

figure()
% Plotting U values
u_values = cellfun(@(u) u(1), U);
plot(k_values(1:N), u_values, 'DisplayName', 'U');
xlabel('k');
ylabel('U');
title('U values');
legend('Location', 'best');