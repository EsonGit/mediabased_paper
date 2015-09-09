P1 = 128;
P2 = 3;
itr = 2;
QO = 16; %number of recieve antennas
QI = 4; % number of transmit units
TRANSMIT_NUM = 2 ^ 7; % number of transmission for each set of fixed constellation
K = 2 * QO; % number of recieve dimensions
Rm = 32; % media_based rate
Es_tx = [1 1 1 1]; % transmit power array corresponding to each units
errorsNumToTerminate = 20; %number of errors to be seen before termination

L = 6; % L-1, info bit + 1 parity single parity codeword length
% EbN0dB = 5.5 simulNum = 816, sym_err_coded = 0; sym_err_uncoded = 625 /
% ..., (simulNum * 128)
EbN0dB = [-7.5, -7, -6.5, -6, -5.5];

sym_err_uncoded = [0.0372, 0.0193, 0.0076, 0.0033,  0.0012];

sym_err_spc6 = [0.0125, 0.0023, 4.46e-4 , 7.186e-5, 0];

rs_rate = [ 0.9685, 0.9370];

load('ser_rs','ser_rs')
load('ser_rs_spc6','ser_rs_spc6')
ser_rs =ser_rs';
ser_rs_spc6 = ser_rs_spc6';
load('fer_rs','fer_rs')
load('fer_rs_spc6','fer_rs_spc6')
fer_rs =fer_rs';
fer_rs_spc6 = fer_rs_spc6';

subplot(2,2,1)
semilogy(EbN0dB -10*log10(rs_rate(1)), fer_rs(1, :), 'r')
hold on
semilogy(EbN0dB -10*log10(rs_rate(1)), ser_rs(1, :), 'b')
grid on

subplot(2,2,2)
semilogy(EbN0dB -10*log10(rs_rate(2)), fer_rs(2, :), 'r')
hold on
semilogy(EbN0dB -10*log10(rs_rate(2)), ser_rs(2, :), 'b')
grid on

subplot(2,2,3)
semilogy(EbN0dB + 10*log10(L/(L-1)) -10*log10(rs_rate(1)), fer_rs_spc6(1, :), 'r')
hold on
semilogy(EbN0dB + 10*log10(L/(L-1)) -10*log10(rs_rate(1)), ser_rs_spc6(1, :), 'b')
grid on

subplot(2,2,4)
semilogy(EbN0dB + 10*log10(L/(L-1)) -10*log10(rs_rate(2)), fer_rs_spc6(2, :), 'r')
hold on
semilogy(EbN0dB + 10*log10(L/(L-1)) -10*log10(rs_rate(2)), ser_rs_spc6(2, :), 'b')
grid on

% semilogy(EbN0dB, sym_err_uncoded, 'r')
% hold on
% semilogy(EbN0dB + 10*log10(L/(L-1)), sym_err_spc6,'b')
% 
% semilogy(EbN0dB -10*log10(rs_rate(1)), ser_rs(1, :), 'k')
% hold on
% 
% %semilogy(EbN0dB + 10*log10(L/(L-1)) -10*log10(rs_rate(1)), ser_rs_spc6(1, :), 'c')
% 
% semilogy(EbN0dB -10*log10(rs_rate(2)), ser_rs(2, :), 'g')
% 
% 
% hold on
% semilogy(EbN0dB + 10*log10(L/(L-1)) -10*log10(rs_rate(2)), ser_rs_spc6(2, :), 'm')


