function Lengths = CaculateToursLength_path(ant)
    global ACS ACSOption 
    Lengths = 0;
    MAX_path_legth = inf;
    if ACS{ant,1}(end) == ACSOption.goal   
        for i =1:length(ACS{ant,1})-1
            Lengths = Lengths + point_distance(ACS{ant,1}(i),ACS{ant,1}(i+1),ACSOption.Height,ACSOption.Width); 
        end
    else
        Lengths = MAX_path_legth;                  
    end   
    ACS{ant,2} = Lengths;
end
