function [outimg] = sharpening(img)
   
    mask = [0 -1  0; -1  4 -1 ; 0 -1  0];
    
    filteredImg = filter2(mask, double(img), 'same'); 

    sharpenedImg = double(img) - filteredImg;

    outimg = uint8(sharpenedImg);

    imshow(outimg);
end

