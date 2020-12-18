function ACSOption = InitParameter(AntNum,alpha,beta,rho,MaxITime,q0)  
    global barrier start goal;
    ACSOption.m = AntNum;  
    ACSOption.start = start;
    ACSOption.goal = goal;
    ACSOption.Height = size(barrier,1);
    ACSOption.Width = size(barrier,2);
    ACSOption.num_point = ACSOption.Height *  ACSOption.Width;
    ACSOption.StartX = ceil(start/ACSOption.Height);
    ACSOption.StartY = mod(start-1,ACSOption.Width) +1;
    ACSOption.GoalX = ceil(goal/ACSOption.Height);
    ACSOption.GoalY = mod(goal-1,ACSOption.Width) +1;  
    ACSOption.k = 2;    
    ACSOption.Connecting_Distance = 1;
    ACSOption.alpha = alpha; 
    ACSOption.beta = beta;
    ACSOption.rho = rho;
    ACSOption.q0 = q0;
    ACSOption.C = 1; 
    ACSOption.Q = 100; 
    ACSOption.MaxITime = MaxITime;
    ACSOption.OptITime = 1;   
    ACSOption.GBLength = inf;        
end