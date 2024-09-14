


%Question (1) FM Modulation
%1. Generate a sinusoidal signal from 0 to 1 s with sample rate f_s=1 kHz and the frequency
%5of the sinusoidal signal f_m= 5 Hz. (1 point)
%m(t)=0.5 cos[(2πf_m t)]+ cos[(2πf_m t)]+ 3 cos[(2πf_m t)]


f_s=1000 ;  % sample rate in Hz
f_m= 5 ; % frequency of sinusoidal signal 
f_c = 100 ; 
t = 0 : 1/f_s : 1-1/f_s;
Ac = 20 ;  % Ac is 20 volt



% (.5+1+3)cos[(2πf_m t)] = 4.5 cos[(2πf_m t)]
% generate the message signal
m_t = 0.5* cos(2*pi*f_m *t)+ cos(2*pi*f_m *t)+ 3 *cos(2*pi*f_m* t);


% Plot the signals
figure(1);
subplot(3, 1, 1);
plot(t, m_t);
xlabel('Time (s)');
ylabel('m_t');
title('Message Signal');





% % generate the carrier signal
c_t = Ac *cos(2 * pi*f_c* t);  %carrier signal

subplot(3, 1, 2);
plot(t, c_t);
xlabel('Time (s)');
ylabel('carrier Modulation');
title('Carrier Signal');




% generate the modulated signal using frequency modulation
 
%P_FM (t)=Ac cos(2πf_c t+ β sin2π f_m t)

% B is delta f / f_m
%B is (k_f *a_m) / f_m
a_m = max(abs(m_t));
k_f=15;
beta = (k_f *a_m) / f_m;
P_FM = Ac * cos(2 * pi * f_c * t + beta * sin(2 * pi * f_m * t));


subplot(3, 1, 3);
plot(t, P_FM);
xlabel('Time (s)');
ylabel('Frequency Modulation');
title('Modulated Signal');











%Vary the amplitude of the message signal such that the modulation index is equal to
%0,0.25,1,9. Plot the FM signal in frequency domain and observe how the FM signal
%bandwidth and power (carrier + sidebands) changes as modulation index changes (using
%subplot)





%Am = [0,0.25,1,9]*f_m/k_f;
%Am = [0,0.25,1,9]*5/15;
%k_f = 15;
Ac = 20;
f_m= 5 ; % frequency of sinusoidal signal 
m = [0,0.25,1,9];
%mod_index = (k_f*Am/f_m);
f_s=1000 ;  % sample rate in Hz
f_c = 100 ; 
%t = 0 : 1/f_s : 1-(1/f_s);
t = 0 : 1/f_s : 1-1/f_s;
figure(2);
for i = 1:length(m)
  
        P_FM = Ac * cos(2 * pi * f_c * t + m(i) * sin(2 * pi * f_m * t));
        n =length(P_FM);
        
        ffshift = (-n/2:n/2-1)*(1000/n);
        
        fn =fft(P_FM);
        fo = fftshift(fn);
        fd = abs(fo);
        subplot(length(m), 1, i); 
        %f = linspace(-100, 100, length(fd)); % frequency range
        plot(ffshift,fd);
        xlabel('Frequency domain');
        ylabel('P_fM');
        title(['FM signal, \beta = ' num2str(m(i))]);
       % title(['FM Signal with Modulation Index  = ', i]);
        %xlim([0 300]);
end




  %demodulation 
% Plot the signals
m_t = 0.5* cos(2*pi*f_m *t)+ cos(2*pi*f_m *t)+ 3 *cos(2*pi*f_m* t);

f_s=1000 ;  % sample rate in Hz
f_m= 5 ; % frequency of sinusoidal signal 
f_c = 100 ; 
%t = 0 : 1/f_s : 1;
Ac = 20 ;  % Ac is 20 volt
k_f = 15;
w_c = 2*pi*f_c;
%z_t=Ac * (w_c+2*pi*k_f *m_t);
P_FM = Ac * cos(2 * pi * f_c * t + beta * sin(2 * pi * f_m * t));
%m = modulate(z_t,f_c,f_s,"fm");
d = fmdemod(P_FM,f_c,f_s,beta);

figure(3);
subplot(2, 1, 1);
plot(t, d);
xlabel('Time (s)');
ylabel('m(t)');
title('FM Demodulation ');


subplot(2,1,2);
plot(t, m_t);
subplot(2,1,2);
xlabel('Time (s)');
ylabel('m(t)');
title(' Message Signal ');




% Define the time axis


% Define the signals


% Plot the signals
figure(10);
plot(t, d, 'b-', t, m_t, 'r--');

% Add a legend
legend('FM Demodulation', 'Message Signal');

% Add axis labels and a title
xlabel('Time (s)');
ylabel('m(t)');
title('FM Demodulation');






















%Bonus part 
%Message signal generation: Generate a sinusoidal signal from 0 to 1 s with sample rate
%fs=1 kHz and The frequency of the sinusoidal signal fm=5 Hz .
m_t = 0.5* cos(2*pi*f_m *t)+ cos(2*pi*f_m *t)+ 3 *cos(2*pi*f_m* t);


  
% sampling frequency
fs= 1000;
  
% time Duration
time = 0 : 1/fs : 1-1/fs;
  
figure(4);
subplot(2, 1, 1);
plot(time, m_t);
xlabel('Time (s)');
ylabel('m_t');
title('Message Signal');


%d frequency domain.
 p =length(m_t);
        
ffshift = (-p/2:p/2-1)*(1000/p);
        
fa =fft(m_t);
fb = fftshift(fa);
fc = abs(fb);
subplot(2,1,2); 
%f = linspace(-100, 100, length(fd)); % frequency range
plot(ffshift,fc);
xlabel('Frequency domain');
ylabel('Message signal generation m(t)');
title('FM Signal in frequency domain ');
        %xlim([0 300]);





















%%% 2) Plot the carrier signal in the time domain and frequency domain

% % generate the carrier signal
c_t = Ac *cos(2 * pi*f_c* t);  %carrier signal
figure (5);
subplot(2, 1, 1);
plot(t, c_t);
xlabel('Time (s)');
ylabel('carrier Modulation');
title('Carrier Signal in time domain');


q =length(c_t);
        
ffshift = (-q/2:q/2-1)*(1000/q);
        
fa =fft(c_t);
fb = fftshift(fa);
fc = abs(fb);
subplot(2,1,2); 
%f = linspace(-100, 100, length(fd)); % frequency range
plot(ffshift,fc);
xlabel('Frequency domain');
ylabel('Carrier signal generation c(t)');
title('Carrier Signal in frequency domain ');
%xlim([0 300]);





%AM modulation (DSB-LC and DSB-SC): 
%Frequency

% sampling frequency
f_s= 1000;
% time Duration
time = 0 : 1/fs : 1-1/fs;
 c_t = Ac *cos(2 * pi*f_c* t);  %carrier signal
A_mmod = ammod(c_t,f_c,f_s);  
figure(6);
subplot(2, 1, 1);
plot(time, A_mmod);
xlabel('Time (s)');
ylabel('m(t)');
title('AM modulated signal in time domain');


%AM modulated signal in frequency domain ');
p =length(c_t);     
ffshift = (-p/2:p/2-1)*(1000/p);
fa =fft(A_mmod);
fb = fftshift(fa);
fc = abs(fb);
subplot(2,1,2); 
%f = linspace(-100, 100, length(fd)); % frequency range
plot(ffshift,fc);
xlabel('Frequency domain');
ylabel('m(t)');
title('AM modulated signal in frequency domain ');
        %xlim([0 300]);









%SSB modulation

%Frequency
f_m = 10; 
% sampling frequency
f_s= 1000;
f_c=10;
% time Duration
time = 0 : 1/fs : 1-1/fs;
 c_t = Ac *cos(2 * pi*f_c* t);  %carrier signal
S_mmod = ssbmod(c_t,f_c,f_s);  
figure(7);
subplot(2, 1, 1);
plot(time, S_mmod);
xlabel('Time (s)');
ylabel('m(t)');
title('AM modulated signal in time domain');


%AM modulated signal in frequency domain ');
p =length(c_t);     
ffshift = (-p/2:p/2-1)*(1000/p);
fa =fft(S_mmod);
fb = fftshift(fa);
fc = abs(fb);
subplot(2,1,2); 
%f = linspace(-100, 100, length(fd)); % frequency range
plot(ffshift,fc);
xlabel('Frequency domain');
ylabel('m(t)');
title('AM modulated signal in frequency domain ');
        %xlim([0 300]);





















