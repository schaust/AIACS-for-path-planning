function figure_path(routes,GBLength,marker_algorithm,barrier,start,goal)
[X,Y] = size(barrier);
figure;
for i=1:X
    for j=1:Y
        if barrier(i,j)==0  
            x1=j;   y1=Y-i;
            x2=j;   y2=Y-i+1;
            x3=j-1; y3=Y-i+1;
            x4=j-1; y4=Y-i;
            fill([x1,x2,x3,x4],[y1,y2,y3,y4],[1,1,1]);
            hold on
        else    
            x1=j;   y1=Y-i;
            x2=j;   y2=Y-i+1;
            x3=j-1; y3=Y-i+1;
            x4=j-1; y4=Y-i;
            fill([x1,x2,x3,x4],[y1,y2,y3,y4],[0,0,0]);
            hold on
        end
    end
end
len_ROUTS = length(routes); 
Rx = routes; 
Ry = routes;
for i=1:len_ROUTS
    Rx(i) = ( mod(routes(i)-1,X) +1-0.5);
    Ry(i) = ( Y- ceil(routes(i)/Y) +1-0.5);
end
switch (marker_algorithm)
    case 1
        plot(Rx,Ry,'r-','lineWidth',2)  
    case 2
        plot(Rx,Ry,'g-','lineWidth',2) 
    case 3
        plot(Rx,Ry,'b-','lineWidth',2) 
    case 4
        plot(Rx,Ry,'c-','lineWidth',2)  
    case 5
        plot(Rx,Ry,'m-','lineWidth',2)  
end
title(['\fontsize{14}\bf','The optimal path length: ',num2str(GBLength)]);
Startx = ( mod(start-1,X) +1-0.5);
Starty = ( Y- ceil(start/Y) +1-0.5);
Goalx = ( mod(goal-1,X) +1-0.5);
Goaly = ( Y- ceil(goal/Y) +1-0.5);
text(Startx+0.1,Starty+0.1,'S','color','r','FontSize',12);
text(Goalx,Goaly+0.1,'G','color','b','FontSize',12);
end