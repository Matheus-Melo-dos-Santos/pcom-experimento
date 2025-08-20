%FSK-monobit
f1=1; %Frequência em Hz
f2=2; %Frequência em Hz
t=0:1/30:1-1/30;
%Sinais analógicos para compor a modulação
sa1=sin(2*pi*f2*t); % - 1
sa0=sin(2*pi*f1*t); % - 0

% da figura, nos concluimos a seguinte sequencia:  0 1 1 0 1

b=[0 1 1 0 1]; %Sinal a ser transmitido
n= 5;
fsk =[];
for i=1:n
  if b(i)==1
    fsk=[fsk sa1];
  else
    fsk=[fsk sa0];
  end
end
subplot(211)
stairs(0:5,[b(1:5) b(5)],'linewidth',1.5)
axis([0 n -0.5 1.5])
title('Mensagen Binária');grid on
xlabel('Tempo');ylabel('Amplitude')
subplot(212)
tb=0:1/30:5-1/30;
plot(tb, fsk(1:5*30),'b','linewidth',1.5)
title('Modulação ');grid on
xlabel('Time');ylabel('Amplitude')