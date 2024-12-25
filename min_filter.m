function outimg = min_filter(img, filterSize)
    % Check if filterSize is odd
    if mod(filterSize, 2) == 0
        error('filterSize must be an odd number.');
    end

    % Calculate padding size
    padSize = floor(filterSize / 2);

    % Get image size
    [rows, cols] = size(img);

    % Manually pad the image by replicating border values
    paddedImg = zeros(rows + 2 * padSize, cols + 2 * padSize);
    paddedImg(padSize+1:end-padSize, padSize+1:end-padSize) = img;

    % Replicate the borders using repmat
    paddedImg(1:padSize, padSize+1:end-padSize) = repmat(img(1, :), padSize, 1); % Top
    paddedImg(end-padSize+1:end, padSize+1:end-padSize) = repmat(img(end, :), padSize, 1); % Bottom
    paddedImg(padSize+1:end-padSize, 1:padSize) = repmat(img(:, 1), 1, padSize); % Left
    paddedImg(padSize+1:end-padSize, end-padSize+1:end) = repmat(img(:, end), 1, padSize); % Right

    % Initialize the output image
    outimg = zeros(rows, cols);

    % Apply min filter
    for i = 1:rows
        for j = 1:cols
            localRegion = paddedImg(i:i+filterSize-1, j:j+filterSize-1);
            outimg(i, j) = min(localRegion(:));  % Apply the min function
        end
    end

    % Convert to uint8 and display the result
    outimg = uint8(outimg);
    imshow(outimg);
end
