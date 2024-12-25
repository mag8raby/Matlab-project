function [newImage] = ConSretch(I)

    [h, w] = size(I);
    I = double(I);
    newImage = zeros(h, w);
    mn = min(min(I));
    mx = max(max(I));
    newmin = 0;
    newmax = 255;
    m = (newmax - newmin) / (mx - mn);
    for i = 1:h
        for j = 1:w
              newImage(i, j) = (I(i, j) - mn) * m + newmin;
        end
    end
    newImage = uint8(newImage);
    imshow(newImage);
end
