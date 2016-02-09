load('colmatch.mat');
light = rand(31,1);

%% Question One

e = M * light; %Intensity of test let matching primaries
testSame = (e == M * P * e); % should return true for all cases
light2 = P * e;  
testSpectra = (light == light2); % should return false for all cases

%% Question Two

Malt = inv(M * Palt) * M;
e2 = Malt*light;
ans2 = (e2 == e); %Demonstrate differing matching spectrum

%% Question Three
% Photopic Matching
%Each column of Phosphors is equal to a primary light

e3 = zeros(1,3);
for x=1:3 
   e3(x) = testLight * Phosphors(:,x);
end

%e3 now represents the strengths (amplitudes)

%% Question Four


s = svd(M2);
figure(1)
plot(s)
%values nearly zero except for one column. 
%Let's see what cone that is...
figure(3)
plot(M2(1,:));
%The peak is near 550nm, which is closest to Green.

%% Question Five

X = 1:31;
figure(2)
plot(X,Cones(1,:),'r',X,Cones(2,:),'g',X,Cones(3,:),'b')
% the overlap between the spectra in the green cones is obvious.
% this plot further shows that only the green cones are available.