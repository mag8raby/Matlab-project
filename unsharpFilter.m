function sharpened = unsharpFilter(image)
    % Convert to grayscale if the image is RGB
    if size(image, 3) == 3
        image = rgb2gray(image);
    end
    
    % Convert image to double for processing
    image = im2double(image);
    
    % Create a simple 5x5 average filter (box filter)
    mask = ones(5, 5) / 25;  % Equal weights for average
    
    % Apply the average filter to blur the image using convolution
    blurred = conv2(image, mask, 'same');  % 'same' keeps the size of the image
    
    % Subtract blurred image from original image to create unsharp mask
    unsharpMask = image - blurred;
    
    % Add the unsharp mask to the original image to sharpen it
    sharpened = image + unsharpMask;
    
    % Ensure pixel values are within [0, 1]
    sharpened = max(min(sharpened, 1), 0);
    
    % Display the sharpened image
    imshow(sharpened);
end
