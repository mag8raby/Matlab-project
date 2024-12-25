function [outimg] = mean_filter(img, filterSize)

    % Ensure filterSize is a single integer
    if numel(filterSize) ~= 1 || mod(filterSize, 2) == 0
        error('filterSize must be a single odd integer.');
    end

    % Calculate the padding size
    padSize = floor(filterSize / 2);

    % Manually pad the image with zeros
    [rows, cols] = size(img);
    paddedImg = zeros(rows + 2 * padSize, cols + 2 * padSize);
    paddedImg(padSize+1:end-padSize, padSize+1:end-padSize) = img;

    % Initialize the output image
    outimg = zeros(rows, cols);

    % Perform the mean filtering
    for i = 1:rows
        for j = 1:cols
            % Extract the local region
            localRegion = paddedImg(i:i+filterSize-1, j:j+filterSize-1);
            % Compute the mean value in the region
            outimg(i, j) = mean(localRegion(:));
        end
    end

    % Convert the result to uint8 and display the output
    outimg = uint8(outimg);
    imshow(outimg);
end
