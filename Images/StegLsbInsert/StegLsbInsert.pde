void setup(){
  size(400, 400);
  String[] filenames = listFileNames("Original images");
  String message = ReadFile();
  String binary = Encrypt(message);
  
  for (int i = 0; i < filenames.length; i++){
    PImage img = loadImage("Original images/" + filenames[i]);
    img.loadPixels();
    for (int pixel = 0, y = 0; pixel < img.width*img.height; pixel++) { //<>//
      //RED LSB //<>//
      if ((img.pixels[pixel] >> 16 & 0xFF) % 2 == 0 && binary.charAt(y) == '1') //<>//
        img.pixels[pixel] = img.pixels[pixel] + color(1, 0, 0); //<>//
      else if ((img.pixels[pixel] >> 16 & 0xFF) % 2 == 1 && binary.charAt(y) == '0')
        img.pixels[pixel] = img.pixels[pixel] - color(1, 0, 0); //<>//
      y++;
      if (binary.length() == y)
        break;
      //GREEN LSB
      if ((img.pixels[pixel] >> 8 & 0xFF) % 2 == 0 && binary.charAt(y) == '1')
        img.pixels[pixel] = img.pixels[pixel] + color(0, 1, 0);
      else if ((img.pixels[pixel] >> 8 & 0xFF) % 2 == 1 && binary.charAt(y) == '0')
        img.pixels[pixel] = img.pixels[pixel] - color(0, 1, 0);
      y++;
      if (binary.length() == y)
        break;
      //BLUE LSB
      if ((img.pixels[pixel] & 0xFF) % 2 == 0 && binary.charAt(y) == '1')
        img.pixels[pixel] = img.pixels[pixel] + color(0, 0, 1);
      else if ((img.pixels[pixel] & 0xFF) % 2 == 1 && binary.charAt(y) == '0')
        img.pixels[pixel] = img.pixels[pixel] - color(0, 0, 1);
      y++;
      if (binary.length() == y)
        break;
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
String ReadFile(){
  String[] lines = loadStrings("data.txt");
  String data = "";
  for (int i = 0; i < lines.length; i++){
    data += lines[i] + '\n';
  }
  return data;
}

String ReadFile2(){
  byte b[] = loadBytes("data.txt");
  String data = "";
  for (int i = 0; i < b.length; i++){
    println(b[i] & 0xff);
    data += char(b[i] & 0xff); 
    //data += char(b[i]);
  }
  //print(data);
  exit();
  return data;
}

String Encrypt(String data){
  String result = "";
  for (int i = 0; i < data.length(); i++){
    result += binary(byte(data.charAt(i)));
  }
  result += "00000000";
  return result;
}
