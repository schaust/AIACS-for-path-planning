function adjacency_matrix = adjacency(graph,X,Y,num_point)
adjacency_matrix = zeros(num_point,num_point);
for i=1:num_point % 
    y = mod((i-1),X)+1;
    x = ceil(i/Y);
    if graph(x,y)==0  
        if x==1&&y==1 % 
            if graph(1,2)==0  
                adjacency_matrix(i,i+1) = 1;end 
            if graph(2,1)==0
                adjacency_matrix(i,i+X)=1;end  %
            if graph(2,2)==0
                adjacency_matrix(i,i+X+1)=1;end 
        elseif x==1&&y==X  
            if graph(2,y)==0 
                adjacency_matrix(i,i+X)=1;end
            if graph(1,y-1)==0 
                adjacency_matrix(i,i-1)=1;end
            if graph(2,y-1)==0
                adjacency_matrix(i,i+X-1)=1;end
        elseif x==Y&&y==1 
            if graph(Y-1,1)==1
                adjacency_matrix(i,i-X)=0;end
            if graph(Y,2)==0
                adjacency_matrix(i,i+1)=1;end
            if graph(Y-1,2)==0
                adjacency_matrix(i,i-X+1)=1;end
        elseif x==Y&&y==X 
            if graph(x,X-1)==0
                adjacency_matrix(i,i-1)=1;end
            if graph(Y-1,y)==0
                adjacency_matrix(i,i-X)=1;end
            if graph(Y-1,X-1)==0
                adjacency_matrix(i,i-X-1)=1; end
        elseif x==1 % 
            if graph(1,y+1)==0
                adjacency_matrix(i,i+1)=1;end
            if graph(1,y-1)==0
                adjacency_matrix(i,i-1)=1;end
            if graph(2,y)==0
                adjacency_matrix(i,i+X)=1;end
            if graph(2,y-1)==0
                adjacency_matrix(i,i+X-1)=1;end
            if graph(2,y+1)==0
                adjacency_matrix(i,i+X+1)=1;end
        elseif y==1
            if graph(x,2)==0
                adjacency_matrix(i,i+1)=1;end
            if graph(x-1,1)==0
                adjacency_matrix(i,i-X)=1; end
            if graph(x+1,1)==0
                adjacency_matrix(i,i+X)=1;end
            if graph(x-1,2)==0
                adjacency_matrix(i,i-X+1)=1;end
            if graph(x+1,2)==0
                adjacency_matrix(i,i+X+1)=1;end
        elseif y==X
            if graph(x,X-1)==0
                adjacency_matrix(i,i-1)=1;end
            if graph(x-1,y)==0
                adjacency_matrix(i,i-X)=1;end
            if graph(x+1,y)==0
                adjacency_matrix(i,i+X)=1;end
            if graph(x-1,X-1)==0
                adjacency_matrix(i,i-X-1)=1;end
            if graph(x+1,X-1)==0
                adjacency_matrix(i,i+X-1)=1;end
        elseif x==Y
            if graph(Y,y-1)==0
                adjacency_matrix(i,i-1)=1;end
            if graph(Y-1,y)==0
                adjacency_matrix(i,i-X)=1;end
            if graph(Y,y+1)==0
                adjacency_matrix(i,i+1)=1;end
            if graph(Y-1,y-1)==0
                adjacency_matrix(i,i-X-1)=1;end
            if graph(Y-1,y+1)==0
                adjacency_matrix(i,i-X+1)=1;end
        else
            if graph(x,y-1)==0
                adjacency_matrix(i,i-1)=1;end
            if graph(x,y+1)==0
                adjacency_matrix(i,i+1)=1;end
            if graph(x-1,y)==0
                adjacency_matrix(i,i-X)=1;end
            if graph(x+1,y)==0
                adjacency_matrix(i,i+X)=1;end
            if graph(x-1,y-1)==0
                adjacency_matrix(i,i-X-1)=1;end
            if graph(x-1,y+1)==0
                adjacency_matrix(i,i-X+1)=1;end
            if graph(x+1,y+1)==0
                adjacency_matrix(i,i+X+1)=1;end
            if graph(x+1,y-1)==0
                adjacency_matrix(i,i+X-1)=1;end
        end
    end
end
end