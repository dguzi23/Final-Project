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



%Diffraction Pattern
f1=(real(fft2(ap))); % The real component of the Fourier Transform
f2=fftshift(f1); % Shift the zero frequency to the center
I1=f2.^2; %square the real part of fourier transform to get the Intensity
I2=I1.^(0.1); %the scaled intensity
%plot the diffraction pattern
figure(2)
imagesc(I2) %plot image of the full far field diffraction pattern
caxis([0.7 8])
colormap gray % Set the color of the diffraction plot
xlabel('Length [Pixels]')
ylabel('Intensity [Arb. units]')
title('far field triangle aperture diffraction pattern')
colorbar;

figure(3)%center field
I2c=I2((2500-125):(2500+125),(2500-125):(2500+125));
imagesc(I2c)
caxis([1 18])
colormap gray
xlabel('Length [Pixels]')
ylabel('Intensity [Arb. units]')
title('center field triangle aperture diffraction pattern')
colorbar;


    
