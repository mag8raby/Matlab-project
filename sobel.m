function [sharp] = sobel(img,chois)
     if(chois == "h")
         mask = [-1 -2 -1;
             0 0 0;
             1 2 1];
     end
         
     if (chois == "v")

          mask = [-1 -0  1;
                    -2 0 2; 
                    -1 0 1];
     end

     if (chois == "rd")
         mask =  [2, 1, 0; 
                  1, 0, -1; 
                  0, -1, -2];
     end
     if (chois == "ld")
         mask =  [0, 1, 2; 
                  -1, 0, 1; 
                  -2, -1, 0];
     end
        
    
    
   
    sharp = filter2(mask, double(img));

    sharp = uint8(sharp); 

   
   
end

