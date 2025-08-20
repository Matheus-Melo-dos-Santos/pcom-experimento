%Rotina para a modulação PSK
f1=1 %Frequência em Hz
t=0:1/30:1-1/30;

%Sinais analógicos para compor a modulação
% questão 4.a) 90º entre 0 e 1. 
% sa1=sin(2*pi*f1*t); % - 1
% sa0=cos(2*pi*f1*t); % - 0

%questão 4.b) 180º entre 0 e 1
% sa1=sin(2*pi*f1*t); % - 1
% sa0=-sin(2*pi*f1*t); % - 0

%questao 4.c) 270º entre 0 e 1 
sa1=sin(2*pi*f1*t); % - 1
sa0=-cos(2*pi*f1*t); % - 0

b=[0 1 1 0 1]; %Sinal digital a ser transmitido
n= 5;
psk =[];
for i=1:n
  if b(i)==1
    psk=[psk sa1];
  else
    psk=[psk sa0];
  end
end

subplot(211)
stairs(0:5,[b(1:5) b(5)],'linewidth',1.5)
axis([0 n -0.5 1.5])
title('Mensagem Binária');grid on
xlabel('Tempo');ylabel('Amplitude')
subplot(212)
tb=0:1/30:5-1/30;
plot(tb, psk(1:5*30),'b','linewidth',1.5)
title('Modulação PSK');grid on
xlabel('Tempo');ylabel('Amplitude')