clear all 
clc 

%DH Table 
%DH Parameter using toolbox
%L = Link([Theta d a alpha]) 'R' or 'P'
L1 = 5; L2 = 11; L3 = 12; L4=0; L5=11; 
L(1) = Link('d', L1, 'a', 0, 'alpha', pi/2);
L(2) = Link('d', 0, 'a', L2, 'alpha', 0);
L(3) = Link('d', 0, 'a', L3, 'alpha', 0);
L(4) = Link('d', 0, 'a', 0, 'alpha', pi/2);
L(5) = Link('d', L5, 'a', 0, 'alpha', 0);


%Define the robot 
Lynx = SerialLink(L);
Lynx.name = 'LynxmotionArm';


%Lynx.teach
%Lynx.fkine([0 0 0 0 0])
%Lynx.plot([0 0 0 0 0])


%syms th1 th2 th3 th4 th5
%Lynx.fkine([th1 th2 th3 th4 th5])


%Set limits for theta
q1= deg2rad(-90:4:90); %DOM for each joint
q2= deg2rad(-90:4:90);
q3= deg2rad(-140:4:0);
q4= deg2rad(-90:4:90);



%Workspace 
Xspace = zeros(1999);
Yspace = zeros(1999);
Zspace = zeros(1999);

counter = 1;

%Calculate Workspace
for a = 1:45 %DOM/step 
    for b = 1:45
        for c = 1:35
            for d = 1:45
                counter = counter + 1;
                Angles = [q1(a) q2(b) q3(c) q4(d) 0];
                Matrix = Lynx.fkine(Angles);
                Xspace(counter) = Matrix(1,4);
                Yspace(counter) = Matrix(2,4);
                Zspace(counter) = Matrix(3,4);
                
            end 
        end 
    end 
end 

%plot workspace 
figure(1)
plot(Xspace, Yspace, '.')
axis equal
xlabel('x (cm)')
ylabel('y (cm)')

figure(2)
plot(Xspace, Zspace, '.')
axis equal 
xlabel('x (cm)')
zlabel('z (cm)')

figure (3)
plot(Yspace, Zspace, '.')
axis equal 
xlabel('y (cm)')
ylabel('z (cm)')

