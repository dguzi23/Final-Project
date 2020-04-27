function FFDiffraction(apt)

%Daniel Guzi, Isabelle Leonard, Xinping Zhang
%Optics 211
%4/27/20
%Final Project
%
%
% This script will generate certain apertures, their far field diffraction
% patterns, and certain cross sections of their intesities.
%
% This script is a function of one user input, and should be run as the
% following:
%
%       FFDiffraction(apt)
%
% Where apt the aperture desired (one of five options) and should be
% entered as follows:
%
%        'Square'
%        'Single-slit'
%        'Double-slit'
%        'Circle'
%        'Triangle'
%
% When the script is run, it will generate five plots:
%   -The aperture
%   -The full far field diffraction pattern
%   -A zoomed in view of the diffraction pattern
%   -A horizontal intensity cross section
%   -A vertical intensity cross section
% or an error message will be displayed if the input is incorrectly entered.


% Define Aperture field
apl=5000; % size of the aperture field
ap=zeros(apl); % Define actual aperture plane

%Generate correct aperture from user input
if strcmp(apt,'Square')==1
    sql=500; % Define square length 
    for ijk=round(1+apl/2-sql/2):round(1+apl/2+sql/2)
        for lmn=round(1+apl/2-sql/2):round(1+apl/2+sql/2)
            ap(ijk,lmn)=1;
        end
    end
    e = 0.2; %For scaling diffraction
elseif strcmp(apt,'Single-slit')==1
    % Define single slit aperture
    sql=2000; % Define slit length 
    for ijk=round(1+apl/2-sql/2):round(1+apl/2+sql/2)
        for lmn=round(1+apl/2-sql/10):round(1+apl/2+sql/10)
                ap(ijk,lmn)=1;
        end
    end
    e = 0.08;
elseif strcmp(apt,'Double-slit')==1
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
    e = 0.09;
elseif strcmp(apt,'Circle')==1
    % Define circle aperture
    radius=275; % Define radius of circle
    for ijk=1:apl;
        for lmn=1:apl;
            if (lmn-apl/2).^2+(ijk-apl/2).^2<=radius.^2;
            ap(ijk,lmn)=1;
            end
        end
    end
    e = 0.2;
elseif strcmp(apt,'Triangle')
    % Define triangle aperture
    sl=1500; % Define the side length of the triangle
    for ijk=round(1+apl/2-sl/2):round(1+apl/2+sl/2)
        for lmn=round(1+apl/2-sl/2):ijk;
        ap(ijk,lmn)=1;
        end
    end
    e = 0.2;
else 
    disp('Error: Please enter one of the allowed commands as specified by below.')
    disp('''Square'', ''Single-slit'', ''Double-slit'', ''Circle'', or ''Triangle''')
    return
end

%plot aperture field
figure
imagesc(ap) % Plot image of the aperture field
colormap gray % Set the color of the aperture field plot
axis equal % Set the display scale of the axes
axis([0 apl 0 apl]) % Set axes limits to size of aperture field
xlabel('Length [Pixels]')
ylabel('Width [Pixels]')
title(apt + " Aperture")

%Diffraction Pattern
f1=(real(fft2(ap))); % The real component of the Fourier Transform
f2=fftshift(f1); % Shift the zero frequency to the center
I1=f2.^2; %square the real part of fourier transform to get the Intensity
I2=I1.^(e); %the scaled intensity

%plot the diffraction pattern
figure(2)
imagesc(I2) %plot image of the full far field diffraction pattern
colormap gray % Set the color of the diffraction plot
xlabel('Length [Pixels]')
ylabel('Width [Pixels]')
title("Full Far-field " + apt + " Aperture Diffraction Pattern")
c1 = colorbar; %Show colorbar
c1.Label.String = 'Intensity [Arb. Units]'; %Label colorbar

%plot zoomed in diffraction pattern
figure(3)
imagesc(I2) %plot image of the full far field diffraction pattern
colormap gray % Set the color of the diffraction plot
xlabel('Length [Pixels]')
ylabel('Width [Pixels]')
title("Zoomed in Far-field " + apt + " Aperture Diffraction Pattern")
c2 = colorbar; %Show colorbar
c2.Label.String = 'Intensity [Arb. Units]'; %Label colorbar
xlim([2375,2625])
ylim([2375,2625])

% Plot the horizontal cross-section
figure(4) 
x=linspace(1,5000,5000);
y=I1(2500,:); % Take the middle row of the unscaled intensity
plot(x,y,'linewidth',2) % Plot the intensity of the middle row of pixels
xlim([2450 2550]) % Set x-axis limit to maximize data readability 
xlabel('Length [Pixels]')
ylabel('Intensity [Arb. units]')
title('Horizontal Intensity Cross-Section')

% Plot the vertical cross-section
figure(5)
x=linspace(1,5000,5000); 
y=I1(:,2500); % Take the middle column of the unscaled intensity
plot(x,y,'linewidth',2) % Plot the intensity of the middle column of pixels
xlim([2450 2550]) % Set x-axis limit to maximize data readability 
xlabel('Width [Pixels]')
ylabel('Intensity [Arb. units]')
title('Vertical Intensity Cross-Section')