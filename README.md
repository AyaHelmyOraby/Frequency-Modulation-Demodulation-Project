# Frequency-Modulation-Demodulation-Project

Frequency modulation (FM) is a modulation process wherein the instantaneous frequency
of a carrier signal is varied according to the message signal amplitude. In this modulation
the modulated FM signal has changing frequency relating to the message amplitude but
the amplitude of the FM signal remains constant. This form of FM modulation is analog
modulation wherein the frequency of the carrier signal continuously changes with the
message signal.
II. Tasks
FM Modulation
1. Generate a sinusoidal signal from 0 to 1 s with sample rate f_s=1 kHz and the frequency
of the sinusoidal signal f_m= 5 Hz. 

m(t)=0.5 cos[(2πf_m t)]+ cos[(2πf_m t)]+ 3 cos[(2πf_m t)]

2. Generate a Carrier signal from 0 to 1 s with sample rate f_s=1 kHz. The frequency of the
sine signal f_c=100 Hz and its amplitude Ac=20 V. 
c(t)=Ac cos(2πf_c t)

3. Plot the FM signal in the time domain. Set K_f=15 V/Hz. Please use subplot to plot
sinusoidal signal, carrier and FM signal in one figure. 
P_FM (t)=Ac cos(2πf_c t+ β sin2π f_m t)

4. Vary the amplitude of the message signal such that the modulation index is equal to
0,0.25,1,9. Plot the FM signal in frequency domain and observe how the FM signal
bandwidth and power (carrier + sidebands) changes as modulation index changes (using
subplot). 
FM Demodulation
5. Plot in the time domain and compare it to the original message signal (using subplot). (1
point)

z(t)=A_c (w_c+2πk_f m(t))
