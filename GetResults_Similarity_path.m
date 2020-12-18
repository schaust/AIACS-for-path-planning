function [GBTour,GBLength,IBTour,IBLength,Record] = GetResults_Similarity_path(ITime,ACSH_rela,ACSH_rela2,ACSdiversity1)
    global ACS ACSOption
    path_length_tmp = cell2mat(ACS(:,2));
    path_length_tmp_ind = find(path_length_tmp<inf);
    [IBLength,AntIndex] = min(cell2mat(ACS(:,2)));
    IBTour = ACS{AntIndex(1),1};   
    ant_alive = length(find(cell2mat(ACS(:,2))<inf));
    ant_die_per = ant_alive / ACSOption.m;   
    new_path_length = []; 
    new_path_length = cell2mat(ACS( find(cell2mat(ACS(:,2))<inf),2));
    IBLength_ave = mean(new_path_length); 
    [IBLengthmax,AntIndexmaxtemp] = max(new_path_length);    
    StdTour = std(new_path_length);  
    if IBLength < ACSOption.GBLength  
        ACSOption.GBLength = IBLength;
        ACSOption.GBTour = IBTour;
        ACSOption.OptITime = ITime; 
    end
    GBTour = ACSOption.GBTour';
    GBLength = ACSOption.GBLength;
    Record = [GBLength,IBLength,StdTour,IBLength_ave,IBLengthmax,ant_die_per,ACSH_rela,ACSH_rela2,ACSdiversity1,ACSOption.q0,]';
end