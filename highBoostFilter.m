function sharpened = highBoostFilter(image, boost_factor, direction)
    % Ensure the image is grayscale
    if ndims(image) == 3
        image = rgb2gray(image); % Convert RGB to grayscale
    end
    
    % Convert to double for calculations
    image = im2double(image);
    
    % Create a simple 5x5 Gaussian kernel manually (with sigma = 1)
    kernel = [1 4 6 4 1; 
              4 16 24 16 4; 
              6 24 36 24 6; 
              4 16 24 16 4; 
              1 4 6 4 1] / 256; % Normalized
    
    % Apply the Gaussian blur using convolution
    blurred = conv2(image, kernel, 'same'); 
    
    % Create the unsharp mask
    unsharpMask = image - blurred;
    
    % Apply the unsharp mask to the original image with boost factor
    sharpened = image + boost_factor * unsharpMask;
    
    % Clip values to [0, 1]
    sharpened = max(min(sharpened, 1), 0);
    
    % Apply directional sharpening based on user input
    if strcmp(direction, 'horizontal')
        % Horizontal sharpening kernel
        horizontal_kernel = [1 1 1; 0 1 0; -1 -1 -1];
        sharpened = conv2(sharpened, horizontal_kernel, 'same');
        
    elseif strcmp(direction, 'vertical')
        % Vertical sharpening kernel
        vertical_kernel = [1 0 -1; 1 1 -1; 1 0 -1];
        sharpened = conv2(sharpened, vertical_kernel, 'same');
        
    elseif strcmp(direction, 'diagonal_left')
        % Diagonal left sharpening kernel
        diagonal_left_kernel = [1 1 -1; 0 0 0; -1 0 1];
        sharpened = conv2(sharpened, diagonal_left_kernel, 'same');
        
    elseif strcmp(direction, 'diagonal_right')
        % Diagonal right sharpening kernel
        diagonal_right_kernel = [-1 0 1; 0 0 0; 1 1 -1];
        sharpened = conv2(sharpened, diagonal_right_kernel, 'same');

    elseif strcmp(direction, 'all') 
        % Clip values to [0, 1] after directional sharpening
    sharpened = max(min(sharpened, 1), 0);
    
    % Display the sharpened image
    imshow(sharpened);
    end
    
    % Clip values to [0, 1] after directional sharpening
    sharpened = max(min(sharpened, 1), 0);
    
    % Display the sharpened image
    imshow(sharpened);
end
