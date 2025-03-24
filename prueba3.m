% Definir parámetros del circuito
R1 = 1e3;  % 1k ohm
R2 = 1e3;  % 1k ohm
R3 = 10e3; % 10k ohm
R4 = 15e3; % 15k ohm
C1 = 0.1e-6; % 0.1uF
C2 = 0.1e-6; % 0.1uF

% Obtener la función de transferencia (suponiendo sistema tipo filtro activo)
num = [-(R4/R3) 0];
den = [R1*R2*C1*C2 (R1+R2)*C1 1];
G = tf(num, den);

% Generar señal PWM
fs = 1e4; % Frecuencia de muestreo
T = 0.1;  % Duración total (valor final de 0.5s)
f_pwm = 100; % Frecuencia de la señal PWM
t = 0:1/fs:T;
Vin = 1.38 * square(2*pi*f_pwm*t); % Generar señal PWM con voltaje de salida de 1.38V

% Simular la respuesta transitoria
Vo = lsim(G, Vin, t);

% Graficar resultados
figure;
subplot(2,1,1);
plot(t, Vin, 'r');
xlabel('Tiempo (s)'); ylabel('Vin (V)'); title('Señal PWM de entrada'); grid on;

subplot(2,1,2);
plot(t, Vo, 'b');
xlabel('Tiempo (s)'); ylabel('Vo (V)'); title('Respuesta del sistema'); grid on;
