function outimg = convolution(img, mask)
    % Get the size of the image and the mask
    [rows, cols] = size(img);
    [mask_rows, mask_cols] = size(mask);
    
    % Rotate the mask 180 degrees (flip it)
    mask = rot90(mask, 2);  % This rotates the mask by 180 degrees
    
    % Calculate the padding size
    padSize = floor(mask_rows / 2);
    
    % Manually pad the image with zeros
    paddedImg = zeros(rows + 2 * padSize, cols + 2 * padSize);
    paddedImg(padSize+1:end-padSize, padSize+1:end-padSize) = img;

    % Initialize the output image
    outimg = zeros(rows, cols);
    
    % Perform the convolution operation
    for i = 1:rows
        for j = 1:cols
            % Extract the local region from the padded image
            localRegion = paddedImg(i:i+mask_rows-1, j:j+mask_cols-1);
            
            % Perform element-wise multiplication and sum to get the convolution result
            outimg(i, j) = sum(sum(localRegion .* mask));
        end
    end
    
    % Clip values to the valid range [0, 255]
    outimg = max(min(outimg, 255), 0);
    
    % Convert to uint8
    outimg = uint8(outimg);

    % Display the result
    imshow(outimg);
end
