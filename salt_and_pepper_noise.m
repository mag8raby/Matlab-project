function outputImage = salt_and_pepper_noise(Image, salt_prob, pepper_prob)
    % SALT_AND_PEPPER_NOISE Adds salt-and-pepper noise to the input image.
    %   outputImage = SALT_AND_PEPPER_NOISE(Image, salt_prob, pepper_prob)
    %   takes an input image 'Image', a salt noise probability 'salt_prob',
    %   and a pepper noise probability 'pepper_prob'. It adds the noise and
    %   returns the resulting image.

    % Ensure the input image is provided
    if nargin < 1 || isempty(Image)
        error('Input image is required.');
    end

    % Ensure probabilities are within a valid range
    if salt_prob < 0 || salt_prob > 1 || pepper_prob < 0 || pepper_prob > 1
        error('Salt and pepper probabilities must be between 0 and 1.');
    end

    % Convert the image to double precision for manipulation
    img = double(Image);

    % Add salt noise (white pixels)
    salt_mask = rand(size(img, 1), size(img, 2)) < salt_prob;
    img(repmat(salt_mask, [1, 1, size(img, 3)])) = 255;

    % Add pepper noise (black pixels)
    pepper_mask = rand(size(img, 1), size(img, 2)) < pepper_prob;
    img(repmat(pepper_mask, [1, 1, size(img, 3)])) = 0;

    % Convert the image back to uint8
    outputImage = uint8(img);
    imshow(outputImage);
end
