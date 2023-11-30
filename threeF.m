clear all;
close all;
clc;

%% Real Circles
 for r = 0:0.2:10                                                                  % Decide the no of real circles
    a= (1/((1+r)));
    b=0;
    c=(r/(1+r));
    a0= (1/((1.*(sin(0.5.*(pi))))));                                          % for r=0;
    b0= cos((0.5*(pi)))./(1.*(sin(0.5*(pi))));                          % for r=0
    x= c-a:0.00002:c+a;
    y1= sqrt(a.^2 -(x-c).^2)-b;
    plot(real(x),real(y1),'Color',[0,0,0]);        
    hold on;
    y2= -sqrt(a.^2 -(x-c).^2)-b;
    plot(real(x),real(y2),'Color',[0,0,0]);
    hold on;
    y3= sqrt(a.^2 -(x-c).^2)+b;
    plot(real(x),real(y3),'Color',[0,0,0]);
    hold on;
    y4= -sqrt(a.^2 -(x-c).^2)+b;
    plot(real(x),real(y4),'Color',[0,0,0]);
    hold on;   
end
    hold on;

    %% Imaginary circles
for q= 0.1:0.2:10                                                           % Decides the no of imaginary circles
     e= (1/(q));
     d= (1/(q));
     z=1-d : 0.00002: 1+d;
     y5= sqrt(d.^2- (z-1).^2)+e;
     err=z.^2+(y5+b0).^2-a0.^2;           %error function so that imaginary circle remains inside the real circles
     idx=find(err<=0);
     plot(real(z(idx)),real(y5(idx)),'Color',[0,0,0]);
     hold on;
     y6= -(sqrt(d.^2- (z-1).^2))+e;
     err=z.^2+(y6+b0).^2-a0.^2;
     idx2=find(err<=0);
     plot(real(z(idx2)),real(y6(idx2)),'Color',[0,0,0]);
     hold on;
     y7= sqrt(d.^2- (z-1).^2)-e;
     err=z.^2+(y7-b0).^2-a0.^2;
     idx3=find(err<=0);
     plot(real(z(idx3)),real(y7(idx3)),'Color',[0,0,0])
     hold on;
     y8= -(sqrt(d.^2- (z-1).^2))-e;
     err=z.^2+(y8-b0).^2-a0.^2;
     idx1=find(err<=0);
     plot(real(z(idx1)),real(y8(idx1)),'Color',[0,0,0]);
     hold on;
     title('Smith Chart');
     xlabel('Real');
     ylabel('Imag');
end

%% Central Line having infinite radius

hold on;
    y=0;
    x=-sqrt(a0.^2-b0.^2): 0.001:sqrt(a0.^2-b0.^2);
    plot(x,y,'Color',[0,0,0]);                                                             % Draw the central straight line
