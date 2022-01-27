function [q_lims,dq_lims] = UR_jlims(urMod)
% UR_JLIMS provides the published joint limits for a specified UR model.
%   q_lims = UR_jlims(urMod)
%
%   [q_lims,dq_lims] = UR_jlims(urMod)
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
%
%   M. Kutzer, 27Jan2022, USNA

%% Define default limits
% Joint Ranges: +/- 360 degrees
q_lims(:,1) = -deg2rad(360) * ones(6,1);
q_lims(:,2) =  deg2rad(360) * ones(6,1);

% Joint Speeds: +/- 180 degrees/sec
dq_lims(:,1) = -deg2rad(180) * ones(6,1);
dq_lims(:,2) =  deg2rad(180) * ones(6,1);

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
        % +/- 360 degrees (except Wrist 3)
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
