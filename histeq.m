function [] = histeq(img)
    img = double(img);  % Convert image to double for processing
    [w, h] = size(img);  % Dimensions of the image
    histo = zeros(256,1);  % Histogram array
    pdf = zeros(256,1);  % PDF array
    sk = zeros(256,1);  % Sk array for cumulative sum (CDF)
    result = uint8(zeros(w, h));  % Output image
    for i = 1:w
        for j = 1:h
            intensity = img(i,j) + 1;  
            histo(intensity) = histo(intensity) + 1;
        end
    end
    pdf = histo / (w * h);  % Calculate PDF

    sum = 0;  % Initialize cumulative CDF
    for i = 1:256
        sum = sum + pdf(i);
        sk(i) = round(255 * sum);  % Scale to 0-255 and round
    end

    for i = 1:w
        for j = 1:h
            result(i, j) = sk(img(i, j) + 1);
        end
    end
    imshow(result); 
end