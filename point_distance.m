function z = point_distance(i,j,X,Y)
a=1; 
xi=a*(mod(i-1,X)+1);
xj=a*(mod(j-1,X)+1);
yj=a*(Y-ceil(j/Y)+1);
yi=a*(Y-ceil(i/Y)+1);
z=sqrt( (xi-xj).^2 + (yi-yj).^2 );
end