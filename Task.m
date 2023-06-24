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


% Trajectory Path
Effect_0 = [1.641 5.050 38.401]; %xyx translation
Effect_1 = [-3.460 -27.431 24.018];
Effect_2 = [-2.033 32.213 -4.181];
Effect_3 = [28.288 15.544 -4.181];
Effect_4 = [-32.277 0 -4.181];

Rotation0 = rpy2tr([0.414 0.154 14.401]);%rotation of joint
Rotation1 = rpy2tr([68.746 -6.705 153.989]);
Rotation2 = rpy2tr([-119.346 -3.148 171.031]);
Rotation3 = rpy2tr([139.362 49.844 -171.286]);
Rotation4 = rpy2tr([-180 -60.702 -162]);

TrM0 = (transl(Effect_0)*Rotation0); %creates the transformational matrix
TrM1 = (transl(Effect_1)*Rotation1);
TrM2 = (transl(Effect_2)*Rotation2);
TrM3 = (transl(Effect_3)*Rotation3);
TrM4 = (transl(Effect_4)*Rotation4);

%ikine to get angles
position_0 = Lynx.ikine(TrM0, [0 pi/2 pi/2 pi/2 pi/2], [1 1 0 0 0 0]); %uses inverse kinematics to describe the position of the joint
position_1 = Lynx.ikine(TrM1, deg2rad([0 0 0 0 0]), [1 1 1 0 0 0]);
position_2 = Lynx.ikine(TrM2, deg2rad([0 0 0 0 0]), [1 1 1 0 0 0]);
position_3 = Lynx.ikine(TrM3, deg2rad([0 0 0 0 0]), [1 1 1 0 0 0]);
position_4 = Lynx.ikine(TrM4, deg2rad([0 0 0 0 0]), [1 1 1 0 0 0]);

%generating multi-point trajectories using polynomial functions
                         %(tfunc, q0, qf, m)
[p01, p01d, p01dd] = mtraj(@tpoly, position_0, position_1,20);
[p12, p12d, p12dd] = mtraj(@tpoly, position_1, position_2,20);
[p23, p23d, p23dd] = mtraj(@tpoly, position_2, position_3,20);
[p34, p34d, p34dd] = mtraj(@tpoly, position_3, position_4,20);
[p45, p45d, p45dd] = mtraj(@tpoly, position_4, position_0,20);

tj = [p01; p12; p23; p34; p45];

xlabel('x (cm)')
ylabel('y (cm)')
zlabel('z (cm)')

Lynx.plot([0 0 0 0 0], 'workspace', [-40 40 -40 40 -40 40]);
hold all

T=transl(Lynx.fkine(tj));
plot2(T)

tr = mstraj([position_1; position_2; position_3; position_4; position_0;], [], [3 3 3 5 3 3 5 4], position_0, 0.1, 1);
Lynx.teach(tr)
Lynx.fkine(position_0);
Lynx.fkine(position_1);
Lynx.fkine(position_2);
Lynx.fkine(position_3);
Lynx.fkine(position_4);










