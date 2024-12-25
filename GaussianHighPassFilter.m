function [sharpened_img] = GaussianHighPassSharpening(img, D0)
    % GaussianHighPassSharpening - Applies a Gaussian High Pass Filter to sharpen the image.
    % Inputs:
    %   img - The grayscale image (matrix).
    %   D0  - The cutoff frequency.
    %
    % Output:
    %   sharpened_img - The sharpened image (after inverse FFT).

    % Ensure the input image is in double precision for calculations
    img = double(img);

    % Get the size of the image
    [M, N] = size(img);

    % Perform Fourier Transform
    img_fft = fft2(img);
    img_fft_shifted = fftshift(img_fft); % Shift zero frequency to the center

    % Create the Gaussian High Pass Filter (GHPF)
    [U, V] = meshgrid(-floor(N/2):floor(N/2)-1, -floor(M/2):floor(M/2)-1);
    D = sqrt(U.^2 + V.^2);  % Distance matrix

    % Gaussian High Pass Filter formula
    H = 1 - exp(-(D.^2) / (2 * D0^2));  % 1 - Gaussian function

    % Apply the Gaussian High Pass Filter in the frequency domain
    img_fft_filtered = img_fft_shifted .* H;

    % Perform Inverse Fourier Transform to get the filtered image
    img_ifft = ifft2(ifftshift(img_fft_filtered)); % Inverse FFT and shift back
    high_passed_img = real(img_ifft); % Take the real part for visualization

    % Sharpen the image by adding the high-frequency components to the original image
    sharpened_img = img + high_passed_img;

    % Ensure the pixel values are within the valid range [0, 255]
    sharpened_img = uint8(max(min(sharpened_img, 255), 0));

    % Display the sharpened image
    imshow(sharpened_img);
end