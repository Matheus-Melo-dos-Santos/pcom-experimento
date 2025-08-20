%ASK-tribit
f1=1;%Frequência em Hz
t=0:1/30:1-1/30;

%Sinais analógicos para a modulação ASK-Tribit

sa7=8*sin(2*pi*f1*t); % 111 - 8
sa6=7*sin(2*pi*f1*t); % 110 - 7
sa5=6*sin(2*pi*f1*t); % 101 - 6
sa4=5*sin(2*pi*f1*t); % 100 - 5
sa3=4*sin(2*pi*f1*t); % 011 - 4
sa2=3*sin(2*pi*f1*t); % 010 - 3
sa1=2*sin(2*pi*f1*t); % 001 - 2
sa0=sin(2*pi*f1*t);   % 000 - 1

b1=[ 1 0 0 0 1 1 0 1 0 0 1 1 0 0 0 1 1 1 ]%Sinal binário a ser transmitido
b=[5 4 3 4 1 8] %Sinal decimal(digital) a ser transmitido
n = 6;
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
  if b(i)==4
    ask=[ask sa3];
  end
  if b(i)==5
    ask=[ask sa4];
  end
  if b(i)==6
    ask=[ask sa5];
  end
  if b(i)==6
    ask=[ask sa6];
  end
  if b(i)==8
    ask=[ask sa7];
  end
end
subplot(211)
stairs(0:1/3:6,[b1(1:18) b1(18)],'linewidth',1.5) 
axis([0 6 -0.5 1.5])
title('Mensagem binária');grid on
xlabel('Tempo');ylabel('Amplitude')
subplot(212)

tb=0:1/30:6-1/30;
plot(tb, ask(1:6*30),'b','linewidth',1.5)
title('Modulação ASK');grid on
xlabel('Tempo');ylabel('Amplitude')