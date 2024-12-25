function noisyImage = addUniformNoise(image, noiseRange)
    % Adds uniform noise to the input image.
    % image: Input grayscale or RGB image (uint8 or double)
    % noiseRange: Range of uniform noise, e.g., [-1, 1].
    
    % Ensure the noiseRange is set to [-1, 1] if not specified
    if nargin < 2 || isempty(noiseRange)
        noiseRange = [-1, 1];
    end

    % Convert the image to double if it's not already
    image = im2double(image);

    % Generate uniform noise within the specified range
    noise = (noiseRange(2) - noiseRange(1)) * rand(size(image)) + noiseRange(1);

    % Add noise to the image
    noisyImage = image + noise;

    % Clip values to stay within valid range [0, 1]
    noisyImage = max(min(noisyImage, 1), 0);

    % Convert back to uint8 if needed
    if isa(image, 'uint8')
        noisyImage = im2uint8(noisyImage);
    end

    % Display the noisy image
    imshow(noisyImage);
end
