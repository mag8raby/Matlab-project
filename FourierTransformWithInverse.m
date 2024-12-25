function FourierTransformWithInverse(imgPath)
    % FourierTransformWithInverse - Performs Fourier Transform, displays results, and calculates the inverse.
    % Usage: FourierTransformWithInverse('image_path.jpg')
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

    % Perform Inverse Fourier Transform
    img_ifft = ifft2(ifftshift(img_fft)); % Shift back and apply inverse FFT
    img_ifft = real(img_ifft); % Take the real part for visualization

    % Display the original image, Fourier Transform, and inverse result
    figure;

    subplot(1, 3, 1);
    imshow(img, []);
    title('Original Image');

    subplot(1, 3, 2);
    imshow(magnitude_spectrum, []);
    title('Fourier Transform (Magnitude Spectrum)');

    subplot(1, 3, 3);
    imshow(img_ifft, []);
    title('Reconstructed Image (Inverse FFT)');
end
