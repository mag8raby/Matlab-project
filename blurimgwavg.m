function [blurimg] = blurimgwavg(img)
     % Define the mask for blurring
    mask = [1 2 1; 2 4 2; 1 2 1] / 16;

    % Apply the filter to the image
    blurimg = filter2(mask, double(img));

    % Normalize the output for display if needed
    blurimg = uint8(blurimg); % Convert back to uint8 for proper display

    % Display the blurred image
    imshow(blurimg);
end

