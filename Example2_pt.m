%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           EXAMPLE 2            %
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear
close all

% Find transformation matrix for CLOCKWISE rotation by 40 deg around z axis
% and l=30m.

%%

q = -40 ;          % rotation angle
l = 30 ;          % link length

% Abbreviations
cq = cosd(q) ;
sq = sind(q) ;

% Rotation Matrix for rotation around z axis
Rz = [cq -sq 0  ;
      sq  cq 0  ;
      0    0 1
        ] ;
x = cq * l;
y = sq * l;

Tz = [Rz [x y 0]';
    0 0 0 1];

%%
q0 = 0;
x0 = [0; cosd(q0)*l];
y0 = [0;sind(q0)*l];
plot(x0, y0)
hold on

xxd = [ 0 ; x] ;
zzd = [ 0 ; y] ;

plot(xxd, zzd, 'r')
axis equal




