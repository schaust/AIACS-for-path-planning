function [GBTour,GBLength,Option,all_info,IBRecord] = IAACS_test(AntNum,MaxITime,alpha,beta,rho,local_update,diffusion_flag,q0) %ACS
    global ACSOption ACS Problem barrier 
    ACSOption = InitParameter(AntNum,alpha,beta,rho,MaxITime,q0);  
    Problem = InitProblem();  
    ACS = InitACS();
    heuristic_grid = Heuristic(ACSOption.goal);   
    adjacency_matrix = adjacency(barrier,ACSOption.Height,ACSOption.Width,ACSOption.Height*ACSOption.Width);    
    [pathlength,pathsequence,OptimalPath] = ASTARPATH(ACSOption.StartX,ACSOption.StartY,barrier,ACSOption.GoalX,ACSOption.GoalY,ACSOption.Connecting_Distance);
    ACSOption.tau0 = 1/pathlength;
    Problem.tau =  ones(ACSOption.Height, ACSOption.Width)* ACSOption.tau0;  
    if diffusion_flag
        Pheromone_ueven_ini(pathsequence,ACSOption.k);  
        Pheromone_diffusion(adjacency_matrix,pathsequence);
    end
    ITime = 1;
    IBRecord = [];
    all_info = cell(ACSOption.MaxITime,1);
    while ITime <= ACSOption.MaxITime
        for ant=1:AntNum        
           node = ACSOption.start;             
           path_sequence = node;       
           LocalUpdatePheromone_path(node); 
           path_length = 0;            
           tabu = ones(1,ACSOption.Height * ACSOption.Width);         
           tabu(node) = 0;             
           data = adjacency_matrix;                          
           data_node = data(node,:);                           
           node_tepmlate = find( data_node );                 
           for j=1:length( node_tepmlate )                    
                if tabu( node_tepmlate(j) ) == 0               
                    data_node( node_tepmlate(j) ) = 0;         
                end
            end % 
            node_available = find(data_node);                  
            amount_node = length(node_available);               
            while ( (amount_node~=0) && (node~= ACSOption.goal) )            
                next_node = select_next_node(q0,node,node_available, Problem.tau,ACSOption.alpha,heuristic_grid); 
                path_sequence = [path_sequence,next_node];                      
                LocalUpdatePheromone_path(next_node);   
                tabu(next_node) = 0;                                           
                node = next_node;                                             
                data_node = data(node,:);                                      
                node_tepmlate = find(data_node);                                
                for j=1:length(node_tepmlate)                                  
                    if tabu( node_tepmlate(j) ) == 0
                        data_node(node_tepmlate(j)) = 0;
                    end
                end %
                node_available = find(data_node);                             
                amount_node = length(node_available);                         
            end                    
            ACS{ant,1} = path_sequence;                       
            CaculateToursLength_path(ant);       
        end
        [ACSH_rela, ACSH_rela2, ACSdiversity1, ACSdiversity2] = Entroy_diversity_path(ACS); 
        [GBTour,GBLength,IBTour,IBLength,IBRecord(:,ITime)] = GetResults_Similarity_path(ITime,ACSH_rela,ACSH_rela2,ACSdiversity1);          
        GlobleRefreshPheromone(ACSH_rela,IBTour,IBLength,local_update,diffusion_flag);
        if local_update  
            ACSOption.q0 = 0.4 + (0.9-0.4)*(ACSH_rela^0.5);
        end
        all_info{ITime,1} = ACS;
        ITime = ITime + 1;
    end 
    Option = ACSOption;    
end