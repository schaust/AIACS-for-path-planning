function LocalUpdatePheromone_path(node)
%% J-1997-Ant colony system: a cooperative learning approach to the traveling salesman problem[J].
    global ACSOption Problem   
    nodex = ceil(node/ACSOption.Height); 
    nodey = mod(node-1,ACSOption.Width)+1;
    Problem.tau(nodex,nodey) = (1-ACSOption.rho)*Problem.tau(nodex,nodey)+ ACSOption.rho * ACSOption.tau0;  
end



