function [q_lims,dq_lims,ddq_lims] = UR_jlims(urMod)
% UR_JLIMS provides the published joint limits for a specified UR model.
%   q_lims = UR_jlims(urMod)
%
%   [q_lims,dq_lims] = UR_jlims(urMod)
%
%   [q_lims,dq_lims,ddq_lims] = UR_jlims(urMod)
%
%   Input(s)
%       urMod - character array specifying the UR model
%                   UR3 | urMod = 'UR3'
%                   UR5 | urMod = 'UR5' 
%                  UR10 | urMod = 'UR10'
%                  UR3e | urMod = 'UR3e'
%                  UR5e | urMod = 'UR5e'
%                 UR10e | urMod = 'UR10e'
%                 UR16e | urMod = 'UR16e'
%
%   Output(s)
%       q_lims - 6x2 array containing the UR joint limits in radians
%      dq_lims - 6x2 array containing the UR joint velocty limits in 
%                radians/sec
%     ddq_lims - 6x2 array containing the recommended UR joint acceleration 
%                 limits in radians/sec^2
%
%   Reference(s)
%       [1] UR3 Technical specifications, Item no. 110103, USA 10/2015
%       [2] UR3e Technical Specifications, UR3e Product Fact Sheet - March 2021
%       [3] UR5 Technical specifications, Item no. 110105, EN 09/2016
%       [4] UR5e Technical Specifications, UR5e Product Fact Sheet - July 2021
%       [5] Technical specifications UR10, Item no. 110110, en 10/2014
%       [6] UR10e Technical Specifications, UR10e Product Fact Sheet - July 2021
%       [7] UR16e Technical Specifications, UR16e Product Fact Sheet - July 2021
%       [8] UR Recommended Joint and Linear Accelerations, Feb. 2018, 
%           https://dof.robotiq.com/discussion/1064/universal-robots-joints-values#:~:text=Joint%20acceleration%20is%20limited%20to,it%20for%20each%20individual%20joint.&text=But%20i%20know%20it%20is,us%20the%20maximum%20recommended%20acceleration%3F&text=In%20general%2C%20the%20acceleration%20has,on%20joint%20health%20and%20longevity.
%
%   M. Kutzer, 27Jan2022, USNA

% Updates
%   23Feb2022 - Added recommended joint acceleration limit

%% Define default limits
% Joint Ranges: +/- 360 degrees
q_lims(:,1) = -deg2rad(360) * ones(6,1);
q_lims(:,2) =  deg2rad(360) * ones(6,1);

% Joint Speeds: +/- 180 degrees/sec
dq_lims(:,1) = -deg2rad(180) * ones(6,1);
dq_lims(:,2) =  deg2rad(180) * ones(6,1);

% Joint Accelerations: +/- 300 degrees/sec
ddq_lims(:,1) = -deg2rad(300) * ones(6,1);
ddq_lims(:,2) =  deg2rad(300) * ones(6,1);

switch upper(urMod)
    case 'UR3'
        % +/- 360 degrees
        % +/- 180 degrees/sec
    case 'UR5'
        % +/- 360 degrees
        % +/- 180 degrees/sec
    case 'UR10'
        % +/- 360 degrees
        % +/- 180 degrees (except base & shoulder)
        dq_lims(1,:) = deg2rad(120)*[-1,1];
        dq_lims(2,:) = deg2rad(120)*[-1,1];
    case 'UR3E'
        % +/- Inf degrees (except Wrist 3)
        q_lims(6,:) = [-inf,inf];
        % +/- 180 degrees (except Wrist 1, 2 & 3)
        dq_lims(4,:) = deg2rad(360)*[-1,1];
        dq_lims(5,:) = deg2rad(360)*[-1,1];
        dq_lims(6,:) = deg2rad(360)*[-1,1];
    case 'UR5E'
        % +/- 360 degrees
        % +/- 180 degrees/sec
    case 'UR10E'
        % +/- 360 degrees
        % +/- 180 degrees (except base & shoulder)
        dq_lims(1,:) = deg2rad(120)*[-1,1];
        dq_lims(2,:) = deg2rad(120)*[-1,1];
    case 'UR16E'
        % +/- 360 degrees
        % +/- 180 degrees (except base & shoulder)
        dq_lims(1,:) = deg2rad(120)*[-1,1];
        dq_lims(2,:) = deg2rad(120)*[-1,1];
    otherwise
        error('UR:BadModel','"%s" is not a recognized type of Universal Robot.',urMod);
end
