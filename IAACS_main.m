clc;
clear all;
close all;
%% Adaptive ACS for robor path planning
global barrier  start goal;  
load map.mat     %load Grid Map, 20*20
barrier = map;
start = 1; goal =400;
Height = size(barrier,1); 
Width = size(barrier,2); 
MaxITime = 200;
AntNum= Width*2;
% The key parameter of ACS
alpha=1.1; beta = 7; rho = 0.2; %J-2019-Neural Computing and Applications- Research on path planning of mobile robot based on improved ant colony algorithm 
disp(['ACS start at ',datestr(now)]);
result008 = cell(30,1);
result11 = cell(30,1);
q0 = 0.8;
runtime = 30; 
for i = 1:runtime     
    local_update = 0;  diffusion_flag = 0;
    [GBTour,GBLength,Option,all_info,IBRecord]  = IAACS_test(AntNum,MaxITime,alpha,beta,rho,local_update,diffusion_flag,q0);%ACS
    result008{i,1} = GBLength; result008{i,2} = Option.OptITime; result008{i,3} = GBTour;result008{i,4} = IBRecord; result008{i,5} = all_info;     
    diffusion_flag = 1;  local_update = 1;     
    [GBTour,GBLength,Option,all_info,IBRecord]  = IAACS_test(AntNum,MaxITime,alpha,beta,rho,local_update,diffusion_flag,q0);%AIACS
    result11{i,1} = GBLength;result11{i,2} = Option.OptITime; result11{i,3} = GBTour;result11{i,4} = IBRecord; result11{i,5} = all_info;    
end
save resuls 
figure_path(GBTour,GBLength,1,barrier,start,goal)
system('shutdown /s /t 5')    % shutdown computer


