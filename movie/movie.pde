import processing.video.*;
Movie myMovie;
Movie gsMovie;
PImage bg;
PImage gs;

void setup() {
  // set the size of the movie clap
  size(640, 360);
  //saveFrame("myvideo###.jpg");
  myMovie = new Movie(this, "boat.mp4");
  gsMovie = new Movie(this, "channel.mp4");
  myMovie.play();
  while (myMovie.height == 0)  delay(2);
  gsMovie.play();
  while (gsMovie.height == 0)  delay(2);
}

void draw() {
  background(200);
  //imageMode(CENTER);
  image(myMovie, 0, 0, 640, 480);
  bg = myMovie.copy();
  image(gsMovie, 0, 0, 640, 360);
  gs = gsMovie.copy();

  //gs.filter(POSTERIZE, 3);
  //gs.filter(BLUR, 2);
  //blendMode(SUBTRACT);

  float md = myMovie.duration();
  float mt = myMovie.time();
  float gd = gsMovie.duration();
  float gt = gsMovie.time();

  bg.resize(640, 360);
  gs.resize(640, 360);

  if (mt < 11.5) {
    image(gs, 0, 0, 640, 360);
    filter(POSTERIZE, 8);
  } else {
    PImage i = chromakeyImage(gs, bg);
    image(i, 0, 0, 640, 360);
    filter(BLUR, 0.85);
  }

  if ((mt-2) >= gd) {
    myMovie.pause();
  }

  if (gt >= (gd-1)) {
    gsMovie.pause();
  }

  //filter(INVERT);
  //filter(THRESHOLD, 0.995);
  //saveFrame("myvideo###.jpg");
}

// Called every time a new frame is
// available to read [DON’T CHANGE THIS]
void movieEvent(Movie m) {
  m.read();
}


PImage chromakeyImage(PImage fg, PImage bg) {
  colorMode(RGB, 255);
  PImage im_new = fg.copy();
  color fg_new;
  color fg_pixel;
  color bg_pixel;
  for (int i=0; i<fg.width*fg.height; i++) {
    fg_pixel = fg.pixels[i];
    bg_pixel = bg.pixels[i];
    //float diff = abs (green(k) - green(fg_pixel));
    if (green(fg_pixel) > 140 && red(fg_pixel) < 170 && blue(fg_pixel) < 160) {
      fg_new = color(bg_pixel);
      im_new.pixels[i] = fg_new;
    } else {
      fg_new = color(fg_pixel);
      im_new.pixels[i] = fg_new;
    }
  }
  return im_new;
}
