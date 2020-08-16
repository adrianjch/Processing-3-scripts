void setup(){
  size(400, 400);
  String[] filenames = listFileNames("Original images");
  for (int i = 0; i < filenames.length; i++){
    PrintWriter output = createWriter("Result/" + filenames[i].substring(0,filenames[i].indexOf(".")) + ".txt");
    PImage img = loadImage("Original images/" + filenames[i]);
    img.loadPixels();
    String binary = "";
    for (int y = 0; y < img.width*img.height; y++) {
        binary += (img.pixels[y] >> 16 & 0xFF) % 2;  //RED LSB
        if (binary.length() == 8){
          if (!binary.equals("00000000")){
            output.print(char(unbinary(binary)));
            binary = "";
          }
          else
            break;
        }
        binary += (img.pixels[y] >> 8 & 0xFF) % 2;  //GREEN LSB
        if (binary.length() == 8){
          if (!binary.equals("00000000")){
            output.print(char(unbinary(binary)));
            binary = "";
          }
          else
            break;
        }
        binary += (img.pixels[y] & 0xFF) % 2;  //BLUE LSB
        if (binary.length() == 8){
          if (!binary.equals("00000000")){
            output.print(char(unbinary(binary)));
            binary = "";
          }
          else
            break;
        }
    }
    output.flush();
    output.close();
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
