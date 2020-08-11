void setup(){
  size(400, 400);
  String[] filenames = listFileNames("Original images");
  for (int i = 0; i < filenames.length; i++){
    PImage img = loadImage("Original images/" + filenames[i]);
    img.loadPixels();
  
    for (int y = 0; y < img.width*img.height; y++) {
        img.pixels[y] = color(255, 255, 255) - img.pixels[y];
    }
    img.updatePixels();
    img.save("Result/" + filenames[i]);
  }
  
  exit();
}

String[] listFileNames(String dir) {
  File file = new File(sketchPath("")+dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  }
  else
    return null;
}
