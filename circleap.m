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

%Diffraction Pattern
f1=(real(fft2(ap))); % The real component of the Fourier Transform
f2=fftshift(f1); % Shift the zero frequency to the center
I1=f2.^2; %square the real part of fourier transform to get the Intensity
I2=I1.^(0.1); %the scaled intensity
%plot the diffraction pattern
figure(2)%full field
imagesc(I2) %plot image of the full far field diffraction pattern
caxis([1 12])
colormap gray % Set the color of the diffraction plot
xlabel('Length [Pixels]')
ylabel('Intensity [Arb. units]')
title('far field circle aperture diffraction pattern')
colorbar;

figure(3)%center field
I2c=I2((2500-125):(2500+125),(2500-125):(2500+125));
imagesc(I2c)
caxis([2 17])
colormap gray
xlabel('Length [Pixels]')
ylabel('Intensity [Arb. units]')
title('center field circle aperture diffraction pattern')
colorbar;

% Plot the horizontal cross-section
figure(4) 
I1c=I1((2500-125):(2500+125),(2500-125):(2500+125));
x=linspace(1,251,251);
y=I1c(125,:); % Take the middle row of the unscaled intensity
plot(x,y,'linewidth',2) % Plot the intensity of the middle row of pixels
xlim([0 250]) % Set x-axis limit to maximize data readability 
xlabel('Length [Pixels]')
ylabel('Intensity [Arb. units]')
title('Horizontal Cross-Section')

% Plot the vertical cross-section
figure(5)
I1c=I1((2500-125):(2500+125),(2500-125):(2500+125));
x=linspace(1,251,251); 
y=I1c(:,125); %Take the middle column of the unscaled intensity
plot(x,y,'linewidth',2) % Plot the intensity of the middle column of pixels
xlim([0 250]) % Set x-axis limit to maximize data readability 
xlabel('Width [Pixels]')
ylabel('Intensity [Arb. units]')
title('Vertical Cross-Section')
    
