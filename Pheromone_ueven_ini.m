function Pheromone_ueven_ini(pathsequence,k)
    global ACSOption Problem ACS    
    Problem.tau = Problem.tau*ACSOption.tau0;  
    for i = 1:length(pathsequence) 
        nodex = ceil(pathsequence(i)/ACSOption.Height); 
        nodey = mod(pathsequence(i)-1,ACSOption.Width)+1;
        Problem.tau(nodex,nodey) = k*ACSOption.tau0;  
    end
end
