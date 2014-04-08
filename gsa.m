%This script simulates the Quantum Mechanical Lov Grover's 
%Search Alghorithm.
clear all;
%-----parameters-----------
nqubits=6;%number of q-bits
n=2^nqubits;%nnumber of elements in database
findmode=mod(round(n*rand+1),n);%desired element
%-----defining quantum gates
d=-eye(n)+2/n;%diffusion transform
oracle=eye(n);%oracle
oracle(findmode,findmode)=-1; 
%--calculate the optimal number of iterations---
finish=round(pi/4*sqrt(n));
%--step(i)--initialization----
psistart=ones(n,1)/sqrt(n);
psi=psistart*exp(i*rand);
%step (ii)--algorithm body----
for steps=1:finish
steps
psi=d*oracle*psi;
probability(steps)=psi(findmode)*conj(psi(findmode));
end
%see the probability dynamics
plot(probability);
%see the result distribution
figure;
stem(psi.*conj(psi));