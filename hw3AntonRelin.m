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

function sine = mksine(size, period, amplitude, phase)

returnval = zeros(1, size);
for i=1:size
   returnval(i) =  
end    

end

