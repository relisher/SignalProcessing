%% Section A
%% Question One

% a
% The system is not linear since the shifts
% are inconsistent and I cannot identify

% b
% y[delta[n]]

% c
% No predictions can be made besides what is listed
% here.

%% Question Two

% a
% this is not time invariant since it's not shifted
% just on the time axis

% b
% If it were time invariant, it would be
% x[n+y]

%% Question Three

vector = [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7];
vector1 = conv(vector, [0.5, 0.5]);
vector2 = conv(vector, [0.5, -0.5]);
vector3 = vector1+vector2;

%% Question Four

reduced = vector3(1:24);
q4 = (reduced == vector);

%% Question Five

varTest = mksine(360,12,80,1);
%figure(1)
%plot(varTest)

%% Question Six

sine1 = mksine(24, 24, 1, 1);
sine2 = mksine(24, 4, 1, 1);
convsine1 = conv(sine1, [0.5, 0.5]);
convsine1 = conv(convsine1, [0.5, -0.5]);
convsine2 = conv(sine2, [0.5, 0.5]);
convsine2 = conv(convsine2, [0.5, -0.5]);

convsine1 = convsine1(1:24);
convsine2 = convsine2(1:24);
figure(2)
plot(1:24, sine1, 'r', 1:24, sine2, 'b', 1:24, convsine1, 'g', 1:24, convsine2, 'y')

%% Question Seven

%% Question Eight


%% Section B
%% Question One

load('images1.mat');
%imagesc(albert)
testOut = conv2(albert, [0.25, 0.25, 0.25]);