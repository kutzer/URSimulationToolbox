function varargout = URSimulationToolboxVer
% URSIMULATIONTOOLBOXVER displays the Universal Robot Simulation Toolbox 
% information.
%   URSIMULATIONTOOLBOXVER displays the information to the command prompt.
%
%   A = URSIMULATIONTOOLBOXVER returns in A the sorted struct array of  
%   version information for the Piecewise Polynomial Toolbox.
%     The definition of struct A is:
%             A.Name      : toolbox name
%             A.Version   : toolbox version number
%             A.Release   : toolbox release string
%             A.Date      : toolbox release date
%
%   M. Kutzer 24Mar2021, USNA

% Updates:
%   26Mar2021 - Removed "master" reference from update, check for master
%               branch for support toolboxes in intall. 

A.Name = 'Universal Robot Simulation Toolbox';
A.Version = '1.0.2';
A.Release = '(R2019a)';
A.Date = '26-Mar-2021';
A.URLVer = 1;

msg{1} = sprintf('MATLAB %s Version: %s %s',A.Name, A.Version, A.Release);
msg{2} = sprintf('Release Date: %s',A.Date);

n = 0;
for i = 1:numel(msg)
    n = max( [n,numel(msg{i})] );
end

fprintf('%s\n',repmat('-',1,n));
for i = 1:numel(msg)
    fprintf('%s\n',msg{i});
end
fprintf('%s\n',repmat('-',1,n));

if nargout == 1
    varargout{1} = A;
end