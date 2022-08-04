clear all;
fs=44100;
nbits=8;
nch=1;
myRecObj = audiorecorder(fs, nbits, nch);

disp('Start speaking. ');
recordblocking(myRecObj, 40);
disp('End of recording. ');

x=getaudiodata(myRecObj);

X=fft(x);
n=length(X);

Xshift = fftshift(X);
fshift = (-n/2:n/2-1)*(fs/n);
powershift = abs(Xshift).^2/n;
plot(fshift,powershift);
xlabel('Frequency (Hz)');
xlabel('Power Spectrum');
grid on;
