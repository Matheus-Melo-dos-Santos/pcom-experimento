f1=1 % Frequência em Hz
t=0:1/30:1-1/30; %Variação temporal

%Sinais analógicos para a modulação ASK

sa1=2*sin(2*pi*f1*t); %sinal do bit 1
sa0=sin(2*pi*f1*t); %Sinal do bit 0

b=[1 0 1 0 0 1]; %Sinal digital a ser transmitido
n= 6;
ask =[];
for i=1:n
  if b(i)==1
    ask=[ask sa1];
  else
    ask=[ask sa0];
end
end
subplot(211)
stairs(0:6,[b(1:6) b(6)],'linewidth',1.5)
axis([0 n -0.5 1.5])
title('Sinal Mensagem Binário');grid on
xlabel('Tempo');ylabel('Amplitude')
subplot(212)
tb=0:1/30:6-1/30;
plot(tb, ask(1:6*30),'b','linewidth',1.5)
title('Modulação ASK');grid on
xlabel('Tempo');ylabel('Amplitude')
