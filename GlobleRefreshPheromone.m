function GlobleRefreshPheromone(ACSH_rela,IBTour,IBLength,local_update,diffusion_flag)
    global ACSOption Problem 
    sigma = 1 - ACSH_rela;    
    Problem.tau = (1 - ACSOption.rho) * Problem.tau; 
    delta_tao = ACSOption.rho*ACSOption.Q/ACSOption.GBLength;
    for i=1:length(ACSOption.GBTour)  
        nodex = ceil(ACSOption.GBTour(i)/ACSOption.Height); 
        nodey = mod(ACSOption.GBTour(i)-1,ACSOption.Width)+1;
        Problem.tau(nodex,nodey) = Problem.tau(nodex,nodey)+ delta_tao;     
    end
    if diffusion_flag 
        Pheromone_diffusion_path(ACSOption.GBTour,delta_tao);
    end
    if local_update
        Local_delta_tao = sigma*ACSOption.Q/IBLength;
        for i=1:length(IBTour)  
            nodex = ceil(IBTour(i)/ACSOption.Height); 
            nodey = mod(IBTour(i)-1,ACSOption.Width)+1;
            Problem.tau(nodex,nodey) = Problem.tau(nodex,nodey)+ Local_delta_tao; 
        end
        if diffusion_flag  
            Pheromone_diffusion_path(IBTour,Local_delta_tao);
        end        
    end    
end