%% SCRIPT_Simulate_UR5
clear all
close all
clc


% Create, initialize, and visualize
ur5 = URsim;            % Create simulation object
ur5.Initialize('UR5');  % Designate as UR5 simulation

% Send simulation to zero configuration
ur5.Zero;
pause(1);
% Send simulation to hold configuration
ur5.Home;
pause(1);
% Send simulation to random configuration
ur5.Joints = 2*pi*rand(1,6);
pause(1);