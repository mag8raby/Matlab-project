function [newImg] = Nigative(I)
% Summary of this function goes here
%   Detailed explanation goes here
I = im2double(I);
[w, h]=size(I);
newImg = zeros(w, h);
for i=1:w
    for j=1:h
        newImg(i,j)= 1 - I(i,j);
    end

end
figure, imshow(newImg);
end

