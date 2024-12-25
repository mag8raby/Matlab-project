function outputImage = gaussian_noise(Image,mean_value,std_value)
    % GAUSSIAN_NOISE Adds Gaussian noise to the input image.
    %   outputImage = GAUSSIAN_NOISE(Image) takes an input image 'Image',
    %   prompts the user for the mean and standard deviation of the noise,
    %   adds the Gaussian noise to the image, and returns the result.

    % Ensure the input image is provided
    if nargin < 1 || isempty(Image)
        error('Input image is required.');
    end
   

    % Convert the image to double precision for noise addition
    img = double(Image);

    % Generate random Gaussian noise
    noise = mean_value + std_value * randn(size(img));

    % Add the noise to the image
    img = img + noise;

    % Clip the result to the valid range [0, 255]
    img = max(min(img, 255), 0);

    % Convert the image back to uint8
    outputImage = uint8(img);
    imshow(outputImage);
end
