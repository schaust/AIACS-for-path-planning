function heuristic_grid = Heuristic(goal)   
    global ACSOption  
    heuristic_grid = zeros(ACSOption.Height,ACSOption.Width);
    heuristic = zeros(ACSOption.Height,ACSOption.Width);
    pend(1,1) = ceil(goal/ACSOption.Height);  
    pend(1,2) = mod(goal-1,ACSOption.Width)+1;
    for i=1:ACSOption.Height
        for j=1:ACSOption.Width
           if i == pend(1,1) && j == pend(1,2)
               heuristic(i, j) = 100;
           else
               heuristic(i, j) = 1/((i-pend(1,1))^2+(j-pend(1,2))^2)^0.5; 
           end
           
        end
    end
    heuristic_grid = heuristic.^ACSOption.beta; 
end