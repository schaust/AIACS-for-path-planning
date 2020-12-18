function [H_rela, H_rela2, diversity1, diversity2] = Entroy_diversity_path(pop)
    new_path_length = cell2mat(pop( find(cell2mat(pop(:,2))<inf),2));
    X = new_path_length;
    [H_rela , H_rela2]= Entropycalu(X);
    diversity1 = 1 - abs((mean(X) -min(X))/(max(X) - min(X)+0.0001));  
    diversity2 = ((mean(X) -min(X))/(max(X) - min(X)+0.0001)); 
end
function [H_rela , H_rela2]= Entropycalu(X)  
    Alphabet = unique(X);   
    Frequency = zeros(size(Alphabet)); 
    for symbol = 1:length(Alphabet) 
        Frequency(symbol) = sum(X == Alphabet(symbol));
    end	
    P = Frequency / sum(Frequency);	
    H = -sum(P .* log(P));
    H_rela =  H /log(length(X));  
    H_rela2 = 0.8;  %only for comparative test ,with other algorithm
end



