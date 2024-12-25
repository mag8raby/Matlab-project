function [binary] = GAMMA(img, g)
    % Convert image to double precision and normalize it to [0, 1]
    img = double(img) / 255;  % Normalize image to range [0, 1]
    
    % Get the dimensions of the image
    [h, w] = size(img);
    
    % Initialize the binary image
    binary = zeros(h, w);

    % Apply gamma correction
    for i = 1:h
        for j = 1:w
            if g < 0
                % For negative gamma, invert the power operation
                binary(i, j) = img(i, j) .^ (1 / abs(g));
            else
                % Standard gamma correction for positive gamma values
                binary(i, j) = img(i, j) .^ g;
            end
        end
    end
    
    % Clip the values to stay within the range [0, 1]
    binary = max(min(binary, 1), 0);
    
    % Display the result
    imshow(binary);
end
