function next_node = select_next_node(q0,node,optional,tau,alpha,heuristic)
global ACSOption 
pendx = ceil(optional/ACSOption.Height);  
pendy = mod(optional-1,ACSOption.Width)+1;
q = rand;      
num_optional = length(optional);   
P = zeros(1,num_optional);        
for k=1:num_optional
    P(k) = tau(pendx(k),pendy(k)).^alpha.*heuristic(pendx(k),pendy(k));  
end
if q <= ACSOption.q0  
    [~,next_index] = max(P);
    next_node = optional(next_index);
else   
    P = P/sum(P);
    Pc = cumsum(P); 
    target_index = find( Pc >= rand );   
    if isempty(target_index) 
        next_node = find( Pc>=rand );
    else 
        next_node = optional(target_index(1));
    end
end