clear
[bus, txt, real]= xlsread('S2M.xlsx','bus');

bus=bus(:,1:13);
%bus(:,[3,4])=-1*bus(:,[3,4]);

branch= xlsread('S2M.xlsx','branch');

branch=branch(:, 1:13);
branch(isnan(branch))=0.0000000009;

gen= xlsread('S2M.xlsx','gen');

mpc.bus=bus;
mpc.branch=branch;
mpc.gen=gen;
mpc.baseMVA = 25;
mpc.version = '2';
% mpopt = mpoption('pf.nr.max_it',30);
output=runpf(mpc);
1
% xlswrite('out.xlsx',output);
