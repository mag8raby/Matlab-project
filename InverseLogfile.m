function [newImg] = InverseLogfile(I, C)
  I = im2double(I);
  [w, h] = size(I);
  newImg = zeros(w, h);
    for i = 1:w
        for j = 1:h
            newImg(i, j) = exp(double(I(i, j)) / C) - 1;
        end
    end
    figure, imshow(newImg);
end
