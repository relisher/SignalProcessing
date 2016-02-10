file = 'SX133.wav';
[X, FS] = audioread(file);
nsamples = FS*length(X);
%
nwindow = round(0.01*FS);
nlags = round(0.02*FS);
increment = round(.01*FS);
nframes = floor( (nsamples -(nlags+nwindow+1))/(increment*FS) ) + 1;
SCC = zeros(nlags, nframes, 2, 2);
correlogram = zeros(nlags,nframes);
for x=0:nframes-4
    base = X((x*nwindow)+1:(((x*nwindow)+nwindow))-1);
    for n=1:nlags-1
    xValueHolder = X((x*nwindow)+1+n:((x*nwindow)+nwindow+n-1));
    result = corrcoef(base, xValueHolder);
    SCC(n,x+1,:,:) = result;  
    correlogram(n,x+1) = SCC(n,x+1,2,1);
    end
end
%figure(2)
%plot((1:nlags)/FS, SCC(:,:,2,1)) % all correllation coefficients
%figure(3)
%plot((1:nlags)/FS, SCC(:,4,2,1)) % correllation coefficients for just period 4
% lag values in msec:   
yvalues = ((1:nlags)/FS)*1000;
% time values in seconds:
xvalues = (0:(nframes-1))*increment;
figure(6)
imagesc(xvalues, yvalues, correlogram);
% force imagesc() to plot first row at the bottom of the image
set(gca,'YDIR', 'normal');
topS = round(FS/500);
bottomS = round(FS/50);
[vals, inds] = max(correlogram(topS:bottomS,:));
inds = inds+(topS-1);
times = ((1:nframes)-0.5)*increment;
val = max(vals);
forFind = correlogram(topS:bottomS,:);
[ind1, ind2] = find(forFind==val); 
z = correlogram(topS:bottomS,ind1-1:ind1+1);
F0 = FS./inds; 
for x=1:length(z)-2
  if(inds(x) > 320 || inds(x) < 32)
      %do nothing - maximum will be out of the range!
  else 
      lag = (1/2)*(z(x)-z(x+2))/(z(x)-2*z(x+1)+z(x+2));
      F0(x) = F0(x) + lag;
   end      
end    
subplot(2,1,1)
plot(times, F0, 'ro')
axis([0 times(332) 50 500])
subplot(2,1,2)
plot(times,vals,'-b')
axis([0 times(332) 0 1])


