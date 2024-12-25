function [newImg] = negative(I)
I = double(I);
[w, h]=size(I);
newImg = zeros(w, h);
for i=1:w
    for j=1:h
        newImg(i,j) = 255 - I(i,j);
    end

end
newImg = uint8(newImg);
figure, imshow(newImg);
end