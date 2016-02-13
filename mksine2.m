function sine2 = mksine2(xsize, ysize, direction, period,  phase)

% made with a large amount of help from here:
% http://www.icn.ucl.ac.uk/courses/MATLAB-Tutorials/Elliot_Freeman/html/gabor_tutorial.html#1

x = 1:xsize*ysize;
theta = direction;
freq = 1/period;
phaseRad = phase * 2 * pi;
x0 = (x/xsize*ysize) -.5;
[Xm Ym] = meshgrid(x0, x0);
thetaRad = (theta/360) * 2 * pi;
xt = Xm * cos(thetaRad);
yt = Ym * sin(thetaRad);
xyt = [xt+yt];
xyf = xyt * freq * 2 * pi;
sine2 = sin(xyf+phaseRad);
end
