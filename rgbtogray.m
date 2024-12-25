function [gray] = rgbtogray(rgb, option)
    % Check if the input is a valid RGB image
    [h, w, c] = size(rgb);
    if c ~= 3
        error('Input must be an RGB image with 3 color channels.');
    end
    
    % Convert to double for calculations
    rgb = double(rgb);
    
    % Calculate grayscale based on the selected option
    switch option
        case 1
            % Average method
            gray = mean(rgb, 3);
        case 2
            % Weighted method
            gray = 0.2 * rgb(:, :, 1) + 0.3 * rgb(:, :, 2) + 0.5 * rgb(:, :, 3);
        case 3
            % Red channel only
            gray = rgb(:, :, 1);
        case 4
            % Green channel only
            gray = rgb(:, :, 2);
        case 5
            % Blue channel only
            gray = rgb(:, :, 3);
        otherwise
            error('Invalid option. Choose a value between 1 and 5.');
    end
    
    % Convert back to uint8
    gray = uint8(gray);
end
