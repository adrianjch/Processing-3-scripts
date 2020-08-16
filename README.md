# Processing-3-scripts
To run the code use the command:
processing-java --sketch=\Sketch_folder_path --run

For example:
processing-java --sketch=\Users\Processing Scripts\Images\Invert_images --run

You can also run the .jar inside the "JAR" folder.

## IMAGES
### Invert images
Put all the images you want to invert inside the "Original images" folder and then run the code. You will find the new images inside the "Result" folder.

NEEDS: "Original images" and "Result" folders.

### Steg LSB extract
Put all the images you want to try to extract data inside the "Original images" folder and then run the code. You will find .txt files inside the "Result" folder.

NEEDS: "Original images" and "Result" folders.

### Steg LSB insert
Put all the images you want to insert data inside the "Original images" folder, write the message you want to hide inside data.txt and then run the code. You will find the new images inside the "Result" folder.

NEEDS: "Original images" and "Result" folders and data.txt

Notes: Make sure you use an image file type lossless. JPEG won't work because of it's compression. This tool was tested using .png and .bmp. Using ascii extended (characters with ascii values higher than 127) might create unexpected characters. Check the ascii here https://theasciicode.com.ar/