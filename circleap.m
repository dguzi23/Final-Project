% Isabelle Leonard
% Optics 211
% 4/22/20
% Final Project
% This function will generate a circle aperture

% Define Aperture field
apl=5000; % size of the aperture field
ap=zeros(apl); % Define actual aperture plane

% Define circle aperture
radius=275; % Define radius of circle


for ijk=1:apl;
    for lmn=1:apl;
        if (lmn-apl/2).^2+(ijk-apl/2).^2<=radius.^2;
            ap(ijk,lmn)=1;
        end
    end
end


% Plot the aperture field
figure
imagesc(ap) % Plot image of the aperture field
colormap gray % Set the color of the aperture field plot
axis equal % Set the display scale of the axes
axis([0 apl 0 apl]) % Set axes limits to size of aperture field
    