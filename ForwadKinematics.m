clear all 
clc 

%DH Table 
%DH Parameter using toolbox
%L = Link([Theta d a alpha]) 'R' or 'P'
L1 = 5; L2 = 11; L3 = 12; L4=0; L5=7; 
L(1) = Link('d', L1, 'a', 0, 'alpha', pi/2);
L(2) = Link('d', 0, 'a', L2, 'alpha', 0);
L(3) = Link('d', 0, 'a', L3, 'alpha', 0);
L(4) = Link('d', 0, 'a', 0, 'alpha', pi/2);
L(5) = Link('d', L5, 'a', 0, 'alpha', 0);


%Define the robot 
Lynx = SerialLink(L);
Lynx.name = 'LynxmotionArm';

%Forwad_Kinematics
q1 = pi/4;
q2 = 0;
q3 = 0;
q4 = 0;
q5 = 0;
q = [q1 q2 q3 q4 q5];
Lynx.fkine(q)
Lynx.teach(q);

%Inverse_Kinematics













