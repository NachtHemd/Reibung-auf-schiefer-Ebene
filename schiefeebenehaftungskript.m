g=9.81;
m=20;
%alpha=35*pi/180;
mu0=0.6;
mu=0.4;

sim('schiefeebenehaftung', 10);

h=1;
b=1.5;
beta= 0.588;
diag=sqrt(1.5^2+1);

weg = x.signals.values;
winkel = phi.signals.values;
time = x.time;
figh = figure;
for i=1:length(weg)
    if ~ishghandle(figh)
        break
    end
hold off
plot([-7,7],[1,0],'.','LineWidth',2)
hold on
alpha=winkel(i);
pos = 0.8*10-weg(i);
xpos = pos*cos(alpha);
ypos = pos*sin(alpha);
line([0,10*cos(alpha)],[0,10*sin(alpha)],'LineWidth',1) %ebene
line([xpos,xpos+cos(alpha)*b],[ypos,ypos+sin(alpha)*b],'Color','g') %unterer strich
line([xpos,xpos-h*sin(alpha)],[ypos,ypos+h*cos(alpha)],'Color','g'); %linker strich
line([xpos+cos(alpha)*b,xpos+cos(alpha)*b-h*sin(alpha)],[ypos+sin(alpha)*b,ypos+sin(alpha)*b+h*cos(alpha)],'Color','g');
line([xpos-h*sin(alpha),xpos+cos(alpha)*b-h*sin(alpha)],[ypos+h*cos(alpha),ypos+sin(alpha)*b+h*cos(alpha)],'Color','g');
axis([0 9 0 8])
grid on
if i == 1
    pause(4);
else
pause(time(i)-time(i-1));
end
end