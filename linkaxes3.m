function hlink = linkaxes3(axh)
%% hlink = LINKAXES3(axh) links the view and zoom of a plot3 just as linkaxes does for 2D plots
%   uses linkprop function for linking
% 
% INPUTS:
%   axh: vector of axis handles
%       axh(1) = subplot(1,1,1); plot3(x,y,z); ...
% 
% OUTPUTS:
%   hlink: handle for the link object for later modification

hlink = linkprop(axh, {'CameraPosition','CameraUpVector', 'CameraViewAngle', 'PlotBoxAspectRatio', 'CameraTarget'});
end