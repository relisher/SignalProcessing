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

sineOne = mksine(24, 24, 1, 1);
sineTwo = mksine(24, 4, 1, 1);
convsine1 = conv(sineOne, [0.5, 0.5]);
convsine1 = conv(convsine1, [0.5, -0.5]);
convsine2 = conv(sineTwo, [0.5, 0.5]);
convsine2 = conv(convsine2, [0.5, -0.5]);

convsine1 = convsine1(1:24);
convsine2 = convsine2(1:24);
figure(2)
plot(1:24, sineOne, 'r', 1:24, sineTwo, 'b', 1:24, convsine1, 'g', 1:24, convsine2, 'y')

%% Question Seven

%% Question Eight


%% Section B
%% Question One

load('images1.mat');
%imagesc(albert)
horWeightedMean = conv2(albert, [0.25, 0.5, 0.25]);
verWeightedMean = rot90(conv2(rot90(albert), [0.25,0.5,0.25]),3);
% verticle could also be accomplished by transposing the kernel

%% Question Two
doubleConvolved = conv2(albert, [0.25, 0.5, 0.25]);
doubleConvolved = rot90(conv2(rot90(doubleConvolved), [0.25, 0.5, 0.25]), 3);
kernel = [0.25; 0.5; 0.25] * [0.25, 0.5, 0.25];
testSame = conv2(albert, kernel);
demonstrationSame = doubleConvolved == testSame;

%% Question Three

albert2 = albert - testSame(2:257,2:257);
%imagesc(albert2)
albert3 = conv2(albert, [-0.5]);
imagesc(albert3)

%% Question Four

newAlbert = zeros(256, 256);
for i=1:255
    for x=1:255
        if(albert2(i,x) * albert2(i,x+1) == -50)
            newAlbert(i,x) = 1;
        end    
        if(albert2(i,x) * albert2(i+1,x) == -50)
            newAlbert(i,x) = 1;
        end
    end
end
%imagesc(newAlbert)
% not sure what convolution would lead to this

%% Question Five

s3 = mksine2(25, 25, 3, 1, 1);
figure(4);
imagesc(s3, [-1 1])
axis off; axis image;