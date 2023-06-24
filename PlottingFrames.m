p = [-3 2 0]';

x1 = [0; p(1,1)];
y1 = [0; p(2,1)];
plot(x1, y1, 'r')
axis equal 
ylabel('y')
xlabel('x')
text(0,0, 'O')
hold on

OOxx = [ p(1,1) ; p(1,1)+cosd(120) ] ;
OOxy = [ p(2,1) ; p(2,1)+sind(120) ] ;
plot(OOxx,OOxy,'k') % this plots the new x1 axis (with a length of 2)
text(p(1,1)+cosd(120),p(2,1)+sind(120),'x1')
hold on


OOyx = [ p(1,1) ; p(1,1)-cosd(30) ] ;
OOyy = [ p(2,1) ; p(2,1)-sind(30) ] ;
plot(OOyx,OOyy,'k')  % this plots the new y1 axis (with a length of 2)
text(p(1,1)-2*sind(60),p(2,1)-2*cosd(60),'y1')
text(p(1,1),p(2,1),'O1')