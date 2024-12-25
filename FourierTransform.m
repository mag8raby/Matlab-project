function FourierTransform(imgPath)
    % FourierTransform - Performs Fourier Transform and displays results.
    % Usage: FourierTransform('image_path.jpg')
    %
    % Input:
    %   imgPath - Path to the image file.

    % Read the image
    img = imread(imgPath);

    % Convert to grayscale if RGB
    if size(img, 3) == 3
        img = rgb2gray(img);
    end

    % Perform Fourier Transform
    img_fft = fft2(double(img));
    img_fft_shifted = fftshift(img_fft); % Shift zero frequency to center

    % Compute the magnitude spectrum
    magnitude_spectrum = log(1 + abs(img_fft_shifted));

    % Display the original image and its Fourier Transform
    figure;
    subplot(1, 2, 1);
    imshow(img, []);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(magnitude_spectrum, []);
    title('Fourier Transform (Magnitude Spectrum)');
    
end
