%% Create the model for the Plannar RRR robot
clear all
clc

% You need the legths l1, l2, l3 and the DH parameters table.
% Then you have for each link:
L1 = Link('d', 0,'a',1,'alpha',0); % Where a = l1 =1
L2 = Link('d', 0,'a',2,'alpha',0); % Where a = l2 =2
L3 = Link('d', 0,'a',1,'alpha',0); % Where a = l3 =1

% Define the serially connected robot:
P_R3 = SerialLink([L1 L2 L3])

%You can now "teach" the robot by changing q1 q2 q3 and see the x,y,z and
%Roll-Pitch-Yaw
P_R3.teach       

%% Answer for Exercise 1c - FK
% The toolbox can easily give you the answer for this

% Set the values of the joints
q = [0 pi/4 pi/2];

% Get the transformation matrix
T = P_R3.fkine(q)

% Get the position (last column of T)
Position = T(1:3,4)'

% Get the Roll-Pitch-Yaw values (notice the 'zyx' option of the function,
% type: help tr2rpy)
Orientation = rad2deg(tr2rpy(T)) % or tr2rpy(T,'deg')

P_R3.plot(q) % And PLOT the configuration
