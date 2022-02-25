//define icons
PImage loadPic;
PImage original;
PImage photo1;
PImage photo2;
PImage cover;
PImage cover_bg;
PImage chroma;
PImage newimg;

void setup() {
  /*---------default set---------*/
  size(600, 600);
  background(255, 255, 255);

  /*---------set pics---------*/
  loadPic = loadImage("img/loadPic.png");//the icon
  loadPic.resize(300, 300);

  photo1 = loadImage("img/photo1.png");//the main edit photo
  photo1.resize(300, 300);

  original = loadImage("img/photo1.png");//the copy
  original.resize(300, 300);

  photo2 = loadImage("img/photo2.png");
  photo2.resize(300, 300);

  cover = loadImage("img/cover.png");
  cover.resize(300, 300);

  cover_bg = loadImage("img/cover_bg.png");
  cover_bg.resize(300, 300);

  chroma = loadImage("img/chroma.png");
  chroma.resize(300, 300);
}

void draw() {
  /*---------loadPic---------*/
  image(loadPic, 10, 10, 50, 50);

  /*---------instruction---------*/
  fill(10, 10, 10);
  textSize(18);
  text("Click here to see the original photo, use S to save", 60, 20);
  text("Use 1~7 to see the single photo effects", 60, 40);
  text("Use 8, 9, 10 to see the couple photos effects", 60, 60);
}


void mousePressed() {
  float x = mouseX;
  float y = mouseY;
  println(x, y);
  //load img
  if (x<65 && y<65) {
    background(255, 255, 255);
    image(original, 150, 150, 300, 300);
    text("Original", 260, 480);
  }

  //the grey
  else if (x>170 && x<250 && y>490 && mouseY<510) {
    background(255, 255, 255);
    newimg = greyscale(photo1, 2); //call function
    image(newimg, 150, 150, 300, 300); //draw image;
    photo1 = original.copy();
    text("Greyscale", 260, 480);
    text("[Grey mild]", 180, 500);
    text("[Grey strong]", 300, 500);
    println("mild");
  }
  
  else if (mouseX>300 && mouseX<400 && mouseY>490 && mouseY<510) {
    background(255, 255, 255);
    newimg = greyscale(photo1, 4); //call function
    image(newimg, 150, 150, 300, 300); //draw image;
    photo1 = original.copy();
    text("Greyscale", 260, 480);
    text("[Grey mild]", 180, 500);
    text("[Grey strong]", 300, 500);
    println("strong");
  }
}

void keyPressed() {
  colorMode(RGB, 255);
  if (key == 'E') {//empty
    background(255, 255, 255);
  } else if (key == '1') {
    background(255, 255, 255);
    newimg = brighten(photo1); //call function
    image(newimg, 150, 150, 300, 300); //draw image;
    photo1 = original.copy();
    text("Brighten", 260, 480);
  } else if (key == '2') {
    background(255, 255, 255);
    newimg = darken(photo1); //call function
    image(newimg, 150, 150, 300, 300); //draw image;
    photo1 = original.copy();
    text("Darken", 260, 480);
  } else if (key == '3') {
    background(255, 255, 255);
    newimg = greyscale(photo1, 2);
    image(newimg, 150, 150, 300, 300); //draw image;
    photo1 = original.copy();
    text("Greyscale", 260, 480);
    text("[Grey mild]", 180, 500);
    text("[Grey strong]", 300, 500);
  } else if (key == '4') {
    background(255, 255, 255);
    newimg = invert(photo1); //call function
    image(newimg, 150, 150, 300, 300); //draw image;
    photo1 = original.copy();
    text("Invert", 270, 480);
  } else if (key == '5') {
    background(255, 255, 255);
    newimg = colorizeBlue(photo1); //call function
    image(newimg, 150, 150, 300, 300); //draw image;
    photo1 = original.copy();
    text("Colorize Blue", 250, 480);
  } else if (key == '6') {
    background(255, 255, 255);
    newimg = highSaturation(photo1); //call function
    image(newimg, 150, 150, 300, 300); //draw image;
    photo1 = original.copy();
    text("High Saturation", 250, 480);
  } else if (key == '7') {
    background(255, 255, 255);
    newimg = threshold(photo1); //call function
    image(newimg, 150, 150, 300, 300); //draw image;
    photo1 = original.copy();
    text("Threshold", 260, 480);
  } else if (key == '8') {
    background(255, 255, 255);
    newimg = blendImage(photo1, photo2); //call function
    image(newimg, 150, 150, 300, 300); //draw image;
    photo1 = original.copy();
    text("Blend Images", 250, 480);
  } else if (key == '9') {
    background(255, 255, 255);
    newimg =  chromakeyImage(photo2, chroma, color(0, 255, 0)); //call function
    image(newimg, 150, 150, 300, 300); //draw image;
    photo1 = original.copy();
    text("Highlight and get red part", 200, 480);
  } else if (key == '0') {
    background(255, 255, 255);
    image(cover_bg, 150, 150, 300, 300);
    newimg = maskImage(photo1, cover); //call function
    image(newimg, 150, 150, 300, 300); //draw image;
    photo1 = original.copy();
    text("Mask Images", 250, 480);
  } else if (key == 's' || key == 'S') {
    PImage outImg = get(150, 150, 300, 300);
    outImg.save("default.png");
  }
}

PImage brighten(PImage img) {
  println("brighten");
  colorMode(RGB, 255);
  color newcolor;
  color oldcolor;
  for (int i=0; i<img.width*img.height; i++) {
    oldcolor = img.pixels[i];
    float r = red(oldcolor+50);
    float g = green(oldcolor+50);
    float b = blue(oldcolor+50);
    newcolor = color(r, g, b);
    img.pixels[i] = newcolor;
  }
  return img;
}

PImage darken(PImage img) {
  println("darken");
  colorMode(RGB, 255);
  color newcolor;
  color oldcolor;
  for (int i=0; i<img.width*img.height; i++) {
    oldcolor = img.pixels[i];
    float r = red(oldcolor-50);
    float g = green(oldcolor-50);
    float b = blue(oldcolor-50);
    newcolor = color(r, g, b);
    img.pixels[i] = newcolor;
  }
  return img;
}

PImage greyscale(PImage img, int num) {
  println("greyscale");
  colorMode(RGB, 255);
  color newcolor;
  color oldcolor;
  for (int i=0; i<img.width*img.height; i++) {
    oldcolor = img.pixels[i];
    float r = red(oldcolor);
    float g = green(oldcolor);
    float b = blue(oldcolor);
    float grey = (r+g+b)/num;
    newcolor = color(grey);
    img.pixels[i] = newcolor;
  }
  return img;
}

PImage invert(PImage img) {
  println("invert");
  colorMode(RGB, 255);
  color newcolor;
  color oldcolor;
  for (int i=0; i<img.width*img.height; i++) {
    oldcolor = img.pixels[i];
    float r = red(255-oldcolor);
    float g = green(255-oldcolor);
    float b = blue(255-oldcolor);
    newcolor = color(r, g, b);
    img.pixels[i] = newcolor;
  }
  return img;
}

PImage colorizeBlue(PImage img) {
  println("Colorize Blue");
  colorMode(RGB, 255);
  color newcolor;
  color oldcolor;
  for (int i=0; i<img.width*img.height; i++) {
    oldcolor = img.pixels[i];
    float r = 0;
    float g = 0;
    float b = blue(oldcolor+10);
    newcolor = color(r, g, b);
    img.pixels[i] = newcolor;
  }
  return img;
}


PImage highSaturation(PImage img) {
  println("High Saturation");
  colorMode(HSB, 255);
  color newcolor;
  color oldcolor;
  for (int i=0; i<img.width*img.height; i++) {
    oldcolor = img.pixels[i];
    float H = hue(oldcolor);
    float S = saturation(oldcolor);
    float B = brightness(oldcolor);
    newcolor = color(H, S+100, B);
    img.pixels[i] = newcolor;
  }
  return img;
}

PImage threshold(PImage img) {
  println("Threshold");
  colorMode(RGB, 255);
  color newcolor;
  color oldcolor;
  for (int i=0; i<img.width*img.height; i++) {
    oldcolor = img.pixels[i];
    float r = red(oldcolor);
    float g = green(oldcolor);
    float b = blue(oldcolor);
    float grey = (r+g+b)/3;
    if (grey>200) {
      newcolor = color(255);
    } else if (g>150) {
      newcolor = color(200);
    } else if (g>100) {
      newcolor = color(150);
    } else if (g>50) {
      newcolor = color(100);
    } else {
      newcolor = color(50);
    }
    img.pixels[i] = newcolor;
  }
  return img;
}

PImage blendImage(PImage img, PImage blend) {
  println("Blend Image");
  colorMode(RGB, 255);
  PImage im_new = img.copy();
  color newcolor;
  color oldcolor;
  color oldcolor_cover;
  for (int i=0; i<img.width*img.height; i++) {
    oldcolor = img.pixels[i];
    oldcolor_cover= blend.pixels[i];
    float r = red(oldcolor)*0.4+red(oldcolor_cover)*0.6;
    float g = green(oldcolor)*0.4+green(oldcolor_cover)*0.6;
    float b = blue(oldcolor)*0.4+blue(oldcolor_cover)*0.6;
    newcolor = color(r, g, b);
    im_new.pixels[i] = newcolor;
  }
  return im_new;
}

PImage chromakeyImage(PImage img, PImage chromakey, color k) {
  println("Chromakey Image");
  colorMode(RGB, 255);
  PImage im_new = img.copy();
  color newcolor;
  color oldcolor;
  color oldcolor_cover;
  for (int i=0; i<img.width*img.height; i++) {
    oldcolor = img.pixels[i];
    oldcolor_cover = chromakey.pixels[i];
    if (hue (oldcolor_cover) - hue (k) < 150) {
      newcolor = color(oldcolor);
      im_new.pixels[i] = newcolor;
    } else {
      newcolor = color(oldcolor_cover);
      im_new.pixels[i] = newcolor;
    }
  }
  return im_new;
}


PImage maskImage(PImage img, PImage cover) {
  println("Mask Image");
  colorMode(RGB, 255);
  PImage im_new = createImage(img.width, img.height, ARGB);
  color newcolor;
  color oldcolor;
  color oldcolor_cover;
  for (int i=0; i<img.width*img.height; i++) {
    oldcolor = img.pixels[i];
    oldcolor_cover= cover.pixels[i];
    float r = red(oldcolor);
    float g = green(oldcolor);
    float b = blue(oldcolor);
    float a = brightness(oldcolor_cover);
    newcolor = color(r, g, b, a);
    im_new.pixels[i] = newcolor;
  }
  return im_new;
}
