%ASK-dibibit
f1=1 %Frequência em Hz
t=0:1/30:1-1/30; %Vetor de tempo

%Sinais analógicos para a modulação Dibit

sa3=4*sin(2*pi*f1*t); % 11 - 4
sa2=3*sin(2*pi*f1*t); % 10 - 3
sa1=2*sin(2*pi*f1*t); % 01 - 2
sa0=sin(2*pi*f1*t);   % 00 - 1

b1=[1 0 0 0 1 1 0 1 0 0 1 1]; %palavra binária a ser transmitida
b=[3 1 4 2 1 4] %Sinal decimal(digital) a ser transmitido

n= 6;
ask = [];
for i=1:n
  if b(i)==1
    ask=[ask sa0];
  end
  if b(i)==2
    ask=[ask sa1];
  end
  if b(i)==3
    ask=[ask sa2];
  end
  if b(i) ==4
    ask = [ask sa3];
  end
end


subplot(211)
stairs(0:0.5:6,[b1(1:12) b1(12)],'linewidth',1.5)
axis([0 6 -0.5 1.5])
title('Mensagem Binária');grid on
xlabel('Time');ylabel('Amplitude')
subplot(212)
tb=0:1/30:6-1/30;
plot(tb, ask(1:6*30),'b','linewidth',1.5)
title('Modulação ASK');grid on
xlabel('Tempo');ylabel('Amplitude')