function [t,x] = bprz(bits, bitrate)
%   Encode bit string using bipolar RZ code.

T = length(bits)/bitrate; % full time of bit sequence
n = 200;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t)); % output signal
high_count = 0;
for i = 0:length(bits)-1
  if (bits(i+1) == 1) && ~(high_count)
    high_count = 1;
    x(i*n+1:(i+0.5)*n) = 1;
    x((i+0.5)*n+1:(i+1)*n) = 0;
  elseif high_count
    high_count = 0;
    x(i*n+1:(i+0.5)*n) = -1;
    x((i+0.5)*n+1:(i+1)*n) = 0;
  else
    x(i*n+1:(i+1)*n) = 0;
  end
end