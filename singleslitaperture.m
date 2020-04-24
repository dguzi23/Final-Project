% Isabelle Leonard
% Optics 211
% 4/21/20
% Final Project
% This function will generate a single slit aperture

% Define Aperture field
apl=5000; % size of the aperture field
ap=zeros(apl); % Define actual aperture plane

% Define single slit aperture
sql=2000; % Define slit length 
% ap(round(1+apl/2-sql/2):round(1+apl/2+sql/2),round(1+apl/2-sql/2):round(1+apl/2+sql/2))=1;
for ijk=round(1+apl/2-sql/2):round(1+apl/2+sql/2)
    for lmn=round(1+apl/2-sql/10):round(1+apl/2+sql/10)
            ap(ijk,lmn)=1;
    end
end


% Plot the aperture field
figure
imagesc(ap) % Plot image of the aperture field
colormap gray % Set the color of the aperture field plot
axis equal % Set the display scale of the axes
axis([0 apl 0 apl]) % Set axes limits to size of aperture field
