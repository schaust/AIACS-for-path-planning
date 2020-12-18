function grid_list = can_go_grid_list(G, position, previous)  
    grid_list = []; 
    previous;
    [MM,NN]=size(G);
    for i=max(position(1,1)-1,1):min(position(1,1)+1,NN)
         for j=max(position(1,2)-1,1):min(position(1,2)+1,NN)          
             if( ( i ~= position(1,1) || j ~= position(1,2)) &&  (i ~= previous(1,1) ||  j ~= previous(1,2)) && (G(i,j) == 0) )            
                 grid_list = [grid_list;i j];
             end        
         end
    end
end