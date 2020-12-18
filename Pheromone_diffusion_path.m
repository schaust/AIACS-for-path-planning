function Pheromone_diffusion_path(pathsequence,Pheromone_value)
    global ACSOption Problem  barrier   
    GG = barrier;
    start = [ceil(ACSOption.start/ACSOption.Height), mod(ACSOption.start-1,ACSOption.Width)+1];
    GG(start(1,1),start(1,2))=1;    
    grid_list = can_go_grid_list(GG, start, start);
    Pheromone_value = 0.1*Pheromone_value;
    for ii =1: size(grid_list,1)
        if grid_list(ii,1) ~= start(1,1) && grid_list(ii,2) ~= start(1,2)
            Problem.tau(grid_list(ii,1),grid_list(ii,2)) = Problem.tau(grid_list(ii,1),grid_list(ii,2)) +  0.33*Pheromone_value;
        else   
            Problem.tau(grid_list(ii,1),grid_list(ii,2)) = Problem.tau(grid_list(ii,1),grid_list(ii,2)) +  0.53* Pheromone_value;
        end
    end
   for i = 2:length(pathsequence)           
        prenode = [ceil(pathsequence(i-1)/ACSOption.Height),mod(pathsequence(i-1)-1,ACSOption.Width)+1];  
        currentnode = [ceil(pathsequence(i)/ACSOption.Height),mod(pathsequence(i)-1,ACSOption.Width)+1];        
        GG(currentnode(1,1),currentnode(1,2))=1;    
        grid_list = can_go_grid_list(GG, currentnode, prenode);
        for ii =1: size(grid_list,1)
            if grid_list(ii,1) ~= currentnode(1,1) && grid_list(ii,2) ~= currentnode(1,2)
                Problem.tau(grid_list(ii,1),grid_list(ii,2)) = Problem.tau(grid_list(ii,1),grid_list(ii,2)) +  0.33* Pheromone_value;
            else
                Problem.tau(grid_list(ii,1),grid_list(ii,2)) = Problem.tau(grid_list(ii,1),grid_list(ii,2)) +  0.53* Pheromone_value;
            end
        end  
        prenode = currentnode;
   end
end



