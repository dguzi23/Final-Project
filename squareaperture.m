% Isabelle Leonard
% Optics 211
% 4/18/20
% Final Project
% This function will generate a square aperture

% Define Aperture field
apl=5000; % size of the aperture field
ap=zeros(apl); % Define actual aperture plane

% Define square aperture
sql=500; % Define square length 
% ap(round(1+apl/2-sql/2):round(1+apl/2+sql/2),round(1+apl/2-sql/2):round(1+apl/2+sql/2))=1;
for ijk=round(1+apl/2-sql/2):round(1+apl/2+sql/2)
    for lmn=round(1+apl/2-sql/2):round(1+apl/2+sql/2)
            ap(ijk,lmn)=1;
    end
end


% Plot the aperture field
figure
imagesc(ap) % Plot image of the aperture field
colormap gray % Set the color of the aperture field plot
axis equal % Set the display scale of the axes
axis([0 apl 0 apl]) % Set axes limits to size of aperture field
%Diffraction Pattern
f1=(real(fft2(ap))); % The real component of the Fourier Transform
f2=fftshift(f1); % Shift the zero frequency to the center
I1=f2.^2; %square the real part of fourier transform to get the Intensity
I2=I1.^(0.2); %the scaled intensity


%plot the diffraction pattern
figure(2)
imagesc(I2) %plot image of the full far field diffraction pattern
colormap gray % Set the color of the diffraction plot
xlabel('Length [Pixels]')
ylabel('Intensity [Arb. units]')
title('far field square aperture diffraction pattern')


% Plot the horizontal cross-section
figure(4) 
x=linspace(1,5000,5000);
y=i1(2500,:); % Take the middle row of the unscaled intensity
plot(x,y,'linewidth',2) % Plot the intensity of the middle row of pixels
xlim([2450 2550]) % Set x-axis limit to maximize data readability 
xlabel('Length [Pixels]')
ylabel('Intensity [Arb. units]')
title('Horizontal Cross-Section')

% Plot the vertical cross-section
figure(5)
x=linspace(1,5000,5000); 
y=i1(:,2500); % Take the middle column of the unscaled intensity
plot(x,y,'linewidth',2) % Plot the intensity of the middle column of pixels
xlim([2450 2550]) % Set x-axis limit to maximize data readability 
xlabel('Width [Pixels]')
ylabel('Intensity [Arb. units]')
title('Vertical Cross-Section')
