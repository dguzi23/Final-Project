% Isabelle Leonard
% Optics 211
% 4/21/20
% Final Project
% This function will generate a double slit aperture

% Define Aperture field
apl=5000; % size of the aperture field
ap=zeros(apl); % Define actual aperture plane

% Define double slit aperture
sh=2500; % Define slit height
sw=175; % Define slit height
space=500; % Define space between the centers of the slits

for ijk=round(1+apl/2-sh/2):round(1+apl/2+sh/2)
    for lmn=round(1+apl/2-space/2-sw/2):round(1+apl/2-space/2+sw/2);
            ap(ijk,lmn)=1;
    end
    for lmn=round(1+apl/2+space/2-sw/2):round(1+apl/2+space/2+sw/2);
            ap(ijk,lmn)=1;
    end 
end


% Plot the aperture field
figure
imagesc(ap) % Plot image of the aperture field
colormap gray % Set the color of the aperture field plot
axis equal % Set the display scale of the axes
axis([0 apl 0 apl]) % Set axes limits to size of aperture field
