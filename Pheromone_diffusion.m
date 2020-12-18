function Pheromone_diffusion(adjacency_matrix,pathsequence)
    global ACSOption Problem  barrier   
     GG = barrier;
     start = [ceil(ACSOption.start/ACSOption.Height), mod(ACSOption.start-1,ACSOption.Width)+1];
     GG(start(1,1),start(1,2))=1;    
     grid_list = can_go_grid_list(GG, start, start);     
     for ii =1: size(grid_list,1)
         if grid_list(ii,1) ~= start(1,1) && grid_list(ii,2) ~= start(1,2) %
             Problem.tau(grid_list(ii,1),grid_list(ii,2)) = Problem.tau(grid_list(ii,1),grid_list(ii,2)) +  0.1* 0.33* Problem.tau(start(1,1),start(1,2));
         else  
             Problem.tau(grid_list(ii,1),grid_list(ii,2)) = Problem.tau(grid_list(ii,1),grid_list(ii,2)) +  0.1* 0.5* Problem.tau(start(1,1),start(1,2));
         end
     end    
     Problem.tau(start(1,1),start(1,2)) = Problem.tau(start(1,1),start(1,2)) +  Problem.tau(start(1,1),start(1,2));
     data = adjacency_matrix;                 
    for i = 2:length(pathsequence)        
        data_node = data(pathsequence(i),:);          
        node_tepmlate = find( data_node );   
        prenode = [ceil(pathsequence(i-1)/ACSOption.Height),mod(pathsequence(i-1)-1,ACSOption.Width)+1];  
        currentnode = [ceil(pathsequence(i)/ACSOption.Height),mod(pathsequence(i)-1,ACSOption.Width)+1];        
        GG(currentnode(1,1),currentnode(1,2))=1;    
        grid_list = can_go_grid_list(GG, currentnode, prenode);
        for ii =1: size(grid_list,1)
            if grid_list(ii,1) ~= start(1,1) && grid_list(ii,2) ~= start(1,2)
                Problem.tau(grid_list(ii,1),grid_list(ii,2)) = Problem.tau(grid_list(ii,1),grid_list(ii,2)) + 0.1* 0.33* Problem.tau(currentnode(1,1),currentnode(1,2));
            else
                Problem.tau(grid_list(ii,1),grid_list(ii,2)) = Problem.tau(grid_list(ii,1),grid_list(ii,2)) + 0.1* 0.5* Problem.tau(currentnode(1,1),currentnode(1,2));
            end
        end
         Problem.tau(currentnode(1,1),currentnode(1,2)) = Problem.tau(currentnode(1,1),currentnode(1,2)) +  Problem.tau(currentnode(1,1),currentnode(1,2));
    end   
end



