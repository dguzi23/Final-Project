% Isabelle Leonard
% Optics 211
% 4/22/20
% Final Project
% This function will generate a triangle aperture

% Define Aperture field
apl=5000; % size of the aperture field
ap=zeros(apl); % Define actual aperture plane

% Define triangle aperture
sl=1500; % Define the side length of the triangle

for ijk=round(1+apl/2-sl/2):round(1+apl/2+sl/2)
    for lmn=round(1+apl/2-sl/2):ijk;
        ap(ijk,lmn)=1;
    end
end
a


% Plot the aperture field
figure
imagesc(ap) % Plot image of the aperture field
colormap gray % Set the color of the aperture field plot
axis equal % Set the display scale of the axes
axis([0 apl 0 apl]) % Set axes limits to size of aperture field
    