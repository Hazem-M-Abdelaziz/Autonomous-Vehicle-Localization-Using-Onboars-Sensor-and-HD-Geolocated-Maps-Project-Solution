function VisualizePointCloud(xyzPoints)
%VisualizePointCloud Display point cloud

coder.extrinsic('isOpen', 'pcplayer')

persistent player;

if isempty(player)
    % Configure axes limits
    xlimits = [-120 120];
    ylimits = [-120 120];
    zlimits = [ -5 10];
    
    % Create a streaming Lidar viewer
    %View in XY (2D Lidar)
    %player = pcplayer(xlimits, ylimits, zlimits, ViewPlane="XY");
    
    %View in 3D
    player = pcplayer(xlimits, ylimits, zlimits);    
end

%if ~isempty(player) && isOpen(player)
    %view(player, xyzPoints);
view(player, xyzPoints);
end