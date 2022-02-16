//define icons
PImage eraser;
PImage stamp;
PImage picture;
PImage eyedropper;
PImage pencil;
PImage highlighter;
PImage clean;
PImage save;

//define load picture
PImage loadPic;

//define stamp mask
PGraphics maskImage;

//define the status
String status = "draw";

void setup() {
  //set the windows size and background color
  size(800, 600);
  background(255, 255, 255);

  //load icons
  eraser = loadImage("img/eraser.png");
  stamp = loadImage("img/stamp.png");
  picture = loadImage("img/picture.png");
  eyedropper = loadImage("img/eyedropper.png");
  pencil = loadImage("img/pencil.png");
  highlighter = loadImage("img/highlighter.png");
  clean = loadImage("img/clean.png");
  save = loadImage("img/save.png");

  //define
  drawBar();
  stroke(0, 0, 0);
  strokeWeight(2);
  drawCurrent(color(0, 0, 0, 255));
}

void drawBar() {
  noFill();
  strokeWeight(1);

  //bar
  stroke(220, 220, 220);
  rect(0, 0, 100, 600);

  //veritical
  stroke(0, 0, 0);
  line (0, 50, 0, 550);
  line (50, 50, 50, 550);
  line (100, 50, 100, 550);
  //horizontal
  line (0, 50, 100, 50);
  line (0, 100, 100, 100);
  line (0, 150, 100, 150);
  line (0, 200, 100, 200);
  line (0, 250, 100, 250);
  line (0, 300, 100, 300);
  line (0, 350, 100, 350);
  line (0, 400, 100, 400);
  line (0, 450, 100, 450);
  line (0, 500, 100, 500);
  line (0, 550, 100, 550);

  /*---------color---------*/
  noStroke();
  //black
  fill(0, 0, 0);
  rect(10, 60, 30, 30);
  //red
  fill(215, 84, 85);
  rect(60, 60, 30, 30);
  //blue
  fill(129, 199, 212);
  rect(10, 110, 30, 30);
  //yellow
  fill(251, 226, 81);
  rect(60, 110, 30, 30);

  /*---------stroke---------*/
  fill(0, 0, 0);
  rect(22.5, 160, 5, 40);
  rect(70, 160, 10, 40);
  rect(17.5, 210, 15, 40);
  rect(65, 210, 20, 40);
  
  /*---------transparent---------*/
  textSize(15);
  text("50%", 58, 430); 
  textSize(15);
  text("100%", 58, 480); 
  textSize(15);
  text("25%", 8, 430); 
  textSize(15);
  text("75%", 8, 480);
}

void draw() {
  /*---------eraser---------*/
  image(eraser, 8, 260, 35, 35);

  /*---------clean the screen---------*/
  image(clean, 58, 510, 35, 35);

  /*---------save---------*/
  image(save, 8, 510, 35, 35);

  /*---------load a picture---------*/
  image(picture, 8, 310, 35, 35);

  /*---------eyedropper---------*/
  image(eyedropper, 58, 260, 35, 35);

  /*---------stamp---------*/
  image(stamp, 55, 306, 45, 45);
  
  /*---------pencil---------*/
  image(pencil, 8, 360, 35, 35);
  
  /*---------hightlighter---------*/
  image(highlighter, 58, 360, 35, 35);
  
}

void mouseDragged() {
  switch (status) {
  case "draw":
    if (mouseX<=110 && mouseY<=600 && pmouseX<=110 && pmouseY<=600) {//cannot draw above the tool bar
    } else {
    line(mouseX, mouseY, pmouseX, pmouseY);
    }
    break;
    
  case "paint":
    if (mouseX<=110 && mouseY<=600 && pmouseX<=110 && pmouseY<=600) {//cannot draw above the tool bar
    } else {
    rect(mouseX, mouseY, 10, 40);
    }
    break;
    
  case "stamp":
    if (mouseX<=110 && mouseY<=600 && pmouseX<=110 && pmouseY<=600) {//cannot draw above the tool bar
    } else {
    image(stamp, mouseX, mouseY, 40, 40);
    }
    break;
    
  case "eyedropper":
    if(mouseX >100 && mouseX<=width && mouseY<=height){
      color c = get(mouseX, mouseY);
      println(c);
      drawCurrent(c);
    }
    break;    
} }

void drawCurrent(color cc){
    noStroke();
    color c = color(255, 255, 255);
    fill(c);
    rect(50, 0, 50, 50);
    fill(cc);
    ellipse(75, 25, 30, 30);
    stroke(cc);
}

void mousePressed() {
  //store (x,y)
  float x = mouseX;
  float y = mouseY;
  println(x, y);

  //store(r,g,b,alpha)
  float r;
  float g;
  float b;
  float alpha;

  //store color
  color c;

  //store stroke weight
  float weight;

  //store fill
  float fill;
  
  //color
  if (x<=50 && y>=50 && y<=100) {
    status = "draw";
    alpha = alpha(getGraphics().strokeColor);
    drawCurrent(color(0, 0, 0, alpha));
    println("black");
  } else if (x>=50 && x<=100 && y>=50 && y<=100) {
    status = "draw";
    alpha = alpha(getGraphics().strokeColor);
    drawCurrent(color(215, 84, 85, alpha));
  } else if (x<=50 && y>=100 && y<=150) {
    status = "draw";
    alpha = alpha(getGraphics().strokeColor);
    drawCurrent(color(129, 199, 212, alpha));
    println("blue");
  } else if (x>=50 && x<=100 && y>=100 && y<=150) {
    status = "draw";
    alpha = alpha(getGraphics().strokeColor);
    drawCurrent(color(251, 226, 81, alpha));
    println("yellow");
  }

  //storke
  else if (x<=50 && y>=150 && y<=200) {
    status = "draw";
    strokeWeight(2);
    println("stroke=2");
  } else if (x>=50 && x<=100 && y>=50 && y<=200) {
    status = "draw";
    strokeWeight(4);
    println("stroke=4");
  } else if (x<=50 && y>=200 && y<=250) {
    status = "draw";
    strokeWeight(8);
    println("stroke=8");
  } else if (x>=50 && x<=100 && y>=200 && y<=250) {
    status = "draw";
    strokeWeight(16);
    println("stroke=16");
  }

  //eraser
  else if (x<=50 && y>=250 && y<=300) {
    status = "draw";
    drawCurrent(color(255, 255, 255));
    image(eraser, 60, 10, 35, 35);
    stroke(255, 255, 255);
    println("eraser");
  }

  //eyedropper
  else if (x>=50 && x<=100 && y>=250 && y<=300) {
    drawCurrent(color(255, 255, 255));
    status = "eyedropper";
    println("eyedropper");
  }

  //load pic
  else if (x<=50 && y>=300 && y<=350) {
    noStroke();
    c = color(255, 255, 255);
    fill(c);
    rect(50, 0, 50, 50);
    image(picture, 60, 10, 35, 35);
    stroke(255, 255, 255);
    println("load pic");
    loadPic = loadImage("img/loadPic.png");
    image(loadPic, 200, 100, 400, 400);
  }

  //stamp
  else if (x>=50 && x<=100 && y>=300 && y<=350) {
    status = "stamp";
    drawCurrent(color(255, 255, 255));
    image(stamp, 60, 10, 35, 35);
    stroke(255, 255, 255);
    println("stamp");
  }
  
  //pencil
  else if (x<=50 && y>=350 && y<=400) {
    status = "draw";
    //store currently brush status
    r = red(getGraphics().strokeColor);
    g = green(getGraphics().strokeColor);
    b = blue(getGraphics().strokeColor);
    alpha = alpha(getGraphics().strokeColor);
    weight = getGraphics().strokeWeight;
    println("current strokeWeight ="+getGraphics().strokeWeight);
    drawCurrent(color(r, g, b, alpha));
    strokeWeight(weight); 
    println("pencil");
  }
  
  //highlighter
  else if (x>=50 && x<=100 && y>=350 && y<=400) {
    status = "paint";
    //store currently brush status
    r = red(getGraphics().strokeColor);
    g = green(getGraphics().strokeColor);
    b = blue(getGraphics().strokeColor);
    alpha = alpha(getGraphics().strokeColor);
    weight = getGraphics().strokeWeight;
    println("current strokeWeight ="+getGraphics().strokeWeight);
    drawCurrent(color(r, g, b, alpha));
    strokeWeight(weight); 
    println("highlighter");
  }
  
  //25%
  else if (x<=50 && y>=400 && y<=450) {
    status = "draw";
    println("25%");
    //store currently brush status
    r = red(getGraphics().strokeColor);
    g = green(getGraphics().strokeColor);
    b = blue(getGraphics().strokeColor);
    alpha = 50;
    weight = getGraphics().strokeWeight;
    println("current strokeWeight ="+getGraphics().strokeWeight);
    drawCurrent(color(r, g, b, alpha));
    strokeWeight(weight); 
  }
  
  //50%
  else if (x>=50 && x<=100 && y>=400 && y<=450) {
    status = "draw";
    println("50%");
    //store currently brush status
    r = red(getGraphics().strokeColor);
    g = green(getGraphics().strokeColor);
    b = blue(getGraphics().strokeColor);
    alpha = 120;
    weight = getGraphics().strokeWeight;
    println("current strokeWeight ="+getGraphics().strokeWeight);
    drawCurrent(color(r, g, b, alpha));
    strokeWeight(weight); 
  }
  
  //75%
  else if (x<=50 && y>=450 && y<=500) {
    status = "draw";
    println("75%");
    //store currently brush status
    r = red(getGraphics().strokeColor);
    g = green(getGraphics().strokeColor);
    b = blue(getGraphics().strokeColor);
    alpha = 180;
    weight = getGraphics().strokeWeight;
    println("current strokeWeight ="+getGraphics().strokeWeight);
    drawCurrent(color(r, g, b, alpha));
    strokeWeight(weight); 
  }
  
  //100%
  else if (x>=50 && x<=100 && y>=450 && y<=500) {
    status = "draw";
    println("100%");
    //store currently brush status
    r = red(getGraphics().strokeColor);
    g = green(getGraphics().strokeColor);
    b = blue(getGraphics().strokeColor);
    alpha = 255;
    weight = getGraphics().strokeWeight;
    println("current strokeWeight ="+getGraphics().strokeWeight);
    drawCurrent(color(r, g, b, alpha));
    strokeWeight(weight); 
  }


  //clean
  else if (x>=50 && x<=100 && y>=500 && y<=550) {
    background(255, 255, 255);
    println("clean");
    //store currently brush status
    r = red(getGraphics().strokeColor);
    g = green(getGraphics().strokeColor);
    b = blue(getGraphics().strokeColor);
    alpha = alpha(getGraphics().strokeColor);
    weight = getGraphics().strokeWeight;
    //fill = getGraphics().fillColor;
    println("current strokeWeight ="+getGraphics().strokeWeight);
    //redobar and give settings back
    drawBar();
    drawCurrent(color(r, g, b, alpha));
    strokeWeight(weight); 
  }

  //save
  else if (x<=50 && y>=500 && y<=550) {
    println("save");
    //clip(100, 0, 700, 600);
    //rect(0, 0, 101, 600);
    save("default.png");
  }
}
