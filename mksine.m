function sine = mksine(size, period, amplitude, phase)

returnval = zeros(1, size);
for i=1:size
   returnval(i) = amplitude*sin(period*deg2rad(i+phase));  
end    
sine = returnval;
end