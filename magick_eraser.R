
#loading R's package for Imagemagick
library(magick)

#reading the input image
image <- image_read("tweet_linkedin.jpeg")


#some simple image manipulation like converting the image to grayscale and then tuning basic parameters
#save the newly created image as new
image %>% 
  image_channel() %>% 
  image_modulate(brightness = 350) %>% 
  image_quantize(max = 80)  %>% 
  image_modulate(brightness = 500)  -> new


#lets stitch both the image together 

images <- c(image %>% image_annotate("Supposedly Hidden", size = 40, gravity = "South", strokecolor = "red") %>% image_border() , 
            new %>%   image_annotate("magick with R", size = 40, gravity = "South", strokecolor = "green") %>% image_border())

image_append(images)