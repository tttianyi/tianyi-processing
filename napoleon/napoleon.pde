//Minard's visualization of Napoleon's Campaign to Attack Russia
//Comprises three separate data sets
//(a) location of key cities
//(b) temperature during retreat
//(c) number of surivors at different points
PImage bg;// load background picture
PFont monoI;
PFont mono;

void setup() {
  size(1400, 550);
  bg = loadImage("bg.jpeg");
  bg.resize(1400, 550);
  background(255, 255, 255);
  //image(bg, 0, 0);
  monoI = createFont("monoI.ttf", 32);
  mono = createFont("mono.ttf", 12);

  loadTable1(); //cities
  loadTable2(); //temperature
  loadTable3(); //surviors

  noLoop();
}

void draw() {
  //Legend scale of the map
  fill(0, 0, 0);
  text("City", 1015, 48);
  text(" ≈ 1°, Longtitude", 1150, 120);
  line(1150, 105, 1250, 105);
  strokeWeight(4);
  point(1150, 105);
  point(1250, 105);
  
  
  //Legend icons of shape
  fill(0, 0, 0);
  text("City", 1015, 48);
  text("Temperature", 1015, 65);
  rect(1000, 40, 10, 10);
  circle(1005, 62, 8);
  
  //Legend of weight
  text("Route of army", 1090, 28);
  text("Army 1 Route", 1120, 48);
  text("Army 2 Route", 1120, 68);
  text("Army 3 Route", 1120, 86); 
  //stroke(203, 64, 66, 180);
  //stroke(27, 129, 62, 100);
  stroke(246, 197, 85, 140);
  strokeWeight(8);
  line(1095, 43, 1115, 43);
  strokeWeight(4);
  line(1095, 63, 1115, 63);
  strokeWeight(2);
  line(1095, 83, 1115, 83);

  //Legend icons of color
  fill(0, 0, 0);
  text("Division of army", 1185, 28);
  text("Army 1", 1215, 48);
  text("Army 2", 1215, 68);
  text("Army 3", 1215, 88);
  noStroke();
  strokeWeight(1);
  fill(203, 64, 66);
  circle(1205, 45, 10);
  fill(58, 143, 183);
  circle(1205, 66, 10);
  fill(235, 235, 235);
  circle(1205, 85, 10);

  //Legend icons of size
  noStroke();
  fill(203, 64, 66, 180);
  circle(1295, 45, 10);
  circle(1295, 66, 20);
  circle(1295, 95, 30);
  fill(0, 0, 0);
  text("Number of survivors", 1275, 28);
  text(" ≈ 1700", 1320, 48);
  text(" ≈ 3400", 1320, 72);
  text(" ≈ 5100", 1320, 98);

  // Axis
  stroke(0, 0, 0);
  line(10, 290, 1390, 290);
  line(10, 295, 1390, 295);
  noFill();
  rect(5,5, 1390, 540);
  
  // Name
  fill(0, 0, 0);
  textSize(28);
  textFont(monoI);
  text("FIGURE MAP of the RUSSIAN CAMPAIGN OF 1812-1813", 30, 30);
  text("GRAPHIC", 30, 330);
  text("TABLE of", 30, 360);
  text("the temperature", 30, 390);
  text("in degrees", 30, 420);
  textFont(mono);

  /* ---------------- temperature with date + longtitude ---------------- */
  for (int i=0; i<N2; i++) {
    var xtimes = 90;
    var ttimes = 5;
    fill(0, 0, 0);
    strokeWeight(2);
    circle((xt[i]-24)*xtimes+105, (-temp[i])*ttimes+350, 8);
    if (i<(N2-1)) {
      line((xt[i]-24)*xtimes+105, (-temp[i])*ttimes+350, (xt[i+1]-24)*xtimes+105, (-temp[i+1])*ttimes+350);
    }
    textSize(14);
    text((temp[i]+"°"), (xt[i]-24)*xtimes+105, (-temp[i])*ttimes+365);
    text(date[i], (xt[i]-24)*xtimes+92, (-temp[i])*ttimes+375);
    strokeCap(PROJECT);
    if (i == 0) {
      //line((xt[i]-24)*xtimes+105, (-temp[i])*ttimes+350, (xt[i]-24)*xtimes+105, 230);
      for (int j = 0; j <= 10; j++) {
        float x = lerp((xt[i]-24)*xtimes+105, (xt[i]-24)*xtimes+105, j/10.0);
        float y = lerp((-temp[i])*ttimes+350, 230, j/10.0);
        point(x, y);
      }
    } else if (i == 1) {
      //line((xt[i]-24)*xtimes+105, (-temp[i])*ttimes+350, (xt[i]-24)*xtimes+105, 210);
      for (int j = 0; j <= 15; j++) {
        float x = lerp((xt[i]-24)*xtimes+105, (xt[i]-24)*xtimes+105, j/15.0);
        float y = lerp((-temp[i])*ttimes+350, 210, j/15.0);
        point(x, y);
      }
    } else if (i == 2 ||i == 3 ||i == 8) {
      //line((xt[i]-24)*xtimes+105, (-temp[i])*ttimes+350, (xt[i]-24)*xtimes+105, 150);
      for (int j = 0; j <= 25; j++) {
        float x = lerp((xt[i]-24)*xtimes+105, (xt[i]-24)*xtimes+105, j/25.0);
        float y = lerp((-temp[i])*ttimes+350, 150, j/25.0);
        point(x, y);
      }
    } else if (i == 4 ||i == 5 ||i == 6 ||i == 7) {
      //line((xt[i]-24)*xtimes+105, (-temp[i])*ttimes+350, (xt[i]-24)*xtimes+105, 120);
      for (int j = 0; j <= 30; j++) {
        float x = lerp((xt[i]-24)*xtimes+105, (xt[i]-24)*xtimes+105, j/30.0);
        float y = lerp((-temp[i])*ttimes+350, 120, j/30.0);
        point(x, y);
      }
    }
  }
  // the scale of temperature
  strokeWeight(1);
  textSize(14);
  text("-30", (xt[0]-24)*100+5, (-temp[N2-2])*5+355);
  line((xt[0]-24)*90+120, (-temp[N2-2])*5+350, (xt[N2-1]-24)*90+100, (-temp[N2-2])*5+350);
  text("-20", (xt[0]-24)*100+5, (-temp[N2-4])*5+355);
  line((xt[0]-24)*90+130, (-temp[N2-4])*5+350, (xt[N2-1]-24)*90+100, (-temp[N2-4])*5+350);
  text("-10", (xt[0]-24)*100+5, (-temp[2])*5+360);
  line((xt[0]-24)*90+130, (-temp[2])*5+355, (xt[N2-1]-24)*90+100, (-temp[2])*5+355);
  text("0", (xt[0]-24)*100+10, (-temp[0])*5+355);
  line((xt[0]-24)*90+130, (-temp[0])*5+350, (xt[N2-1]-24)*90+100, (-temp[0])*5+350);
  text("°C", (xt[0]-24)*100+5, (-temp[0])*5+355-30);

  /* ---------------- survivors' amount ---------------- */
  for (int i=0; i<N3; i++) {
    var xtimes = 90;
    var ytimes = 90;
    fill(255, 255, 255);
    int survtmies = 2000;

    // the direction of troops
    //stroke(27, 129, 62, 100);
    stroke(246, 197, 85, 140);
    if (i<26 && i<(N3-1)) {
      strokeWeight(8);
      //stroke(203, 64, 66, 80);
      line((xs[i]-24)*xtimes+100, (ys[i]-53.9)*ytimes+80, (xs[i+1]-24)*xtimes+100, (ys[i+1]-53.9)*ytimes+80);
    } else if (i>=26 && i<43 && i<(N3-1)) {
      strokeWeight(4);
      //stroke(58, 143, 183, 80);
      line((xs[i]-24)*xtimes+100, (ys[i]-53.9)*ytimes+80, (xs[i+1]-24)*xtimes+100, (ys[i+1]-53.9)*ytimes+80);
    } else if (i>=43 && i<(N3-1)) {
      strokeWeight(2);
      //stroke(255, 255, 255, 80);
      line((xs[i]-24)*xtimes+100, (ys[i]-53.9)*ytimes+80, (xs[i+1]-24)*xtimes+100, (ys[i+1]-53.9)*ytimes+80);
    }
    noStroke();


    if (div[i] == 1) {
      noStroke();
      fill(203, 64, 66, 180);
      circle((xs[i]-24)*xtimes+100, (ys[i]-53.9)*ytimes+80, surv[i]/survtmies);
    } else if (div[i] == 2) {
      noStroke();
      fill(58, 143, 183, 180);
      circle((xs[i]-24)*xtimes+100, (ys[i]-53.9)*ytimes+80, surv[i]/survtmies);
    } else if (div[i] == 3) {
      noStroke();
      fill(255, 255, 255, 180);
      circle((xs[i]-24)*xtimes+100, (ys[i]-53.9)*ytimes+80, surv[i]/survtmies);
    }
  }

  /* ---------------- cities with longtitude + latitude ---------------- */
  for (int i=0; i<N; i++) {
    var xtimes = 90;
    var ytimes = 90;
    fill(0, 0, 0);
    rect((x[i]-24)*xtimes+100, (y[i]-53.9)*ytimes+60, 10, 10);
    if (i == 17) {//Moscou
      textSize(24);
      text(c[i], (x[i]-24)*xtimes+75, (y[i]-53.9)*ytimes+90);
      textSize(16);
      text("("+x[i]+","+(y[i])+")", (x[i]-24)*xtimes+75, (y[i]-53.9)*ytimes+105);
    } else if (i == 2) {
      textSize(16);
      text(c[i], (x[i]-24)*xtimes+55, (y[i]-53.9)*ytimes+82);
      textSize(12);
      text("("+x[i]+","+(y[i])+")", (x[i]-24)*xtimes+65, (y[i]-53.9)*ytimes+95);
    } else if (i == 3 || i == 8) {
      textSize(16);
      text(c[i], (x[i]-24)*xtimes+88, (y[i]-53.9)*ytimes+82);
      textSize(12);
      text("("+x[i]+","+(y[i])+")", (x[i]-24)*xtimes+85, (y[i]-53.9)*ytimes+95);
    } else if (i == 14 || i == 19) {
      textSize(16);
      text(c[i], (x[i]-24)*xtimes+70, (y[i]-53.9)*ytimes+82);
      textSize(12);
      text("("+x[i]+","+(y[i])+")", (x[i]-24)*xtimes+58, (y[i]-53.9)*ytimes+95);
    } else {
      textSize(16);
      text(c[i], (x[i]-24)*xtimes+78, (y[i]-53.9)*ytimes+82);
      textSize(12);
      text("("+x[i]+","+(y[i])+")", (x[i]-24)*xtimes+78, (y[i]-53.9)*ytimes+95);
    }
  }
}

//City; table1
Table table1;
float[] x;// take longtitude as x in Axis
float[] y;// take latitude as y in Axis
String[] c;// cities's name
int N; // the rows' num

void loadTable1() {
  table1 = loadTable("minard-table1.csv", "header");

  N = table1.getRowCount();
  x = new float[N];
  y = new float[N];
  c = new String[N];

  N = table1.getRowCount();
  for (int i=0; i<N; i++) {
    TableRow row = table1.getRow(i);
    x[i] = row.getFloat("LONC");
    y[i] = row.getFloat("LATC");
    c[i] = row.getString("CITY");
  }
}

//Temperature during retreat march
Table table2;
int N2;
float[] xt;
float[] temp;
String[] date;

void loadTable2() {
  table2 = loadTable("minard-table2.csv", "header");

  N2 = table2.getRowCount();
  xt = new float[N2];
  temp = new float[N2];
  date = new String[N2];

  N2 = table2.getRowCount();
  for (int i=0; i<N2; i++) {
    TableRow row = table2.getRow(i);
    xt[i] = row.getFloat("LONT");
    temp[i] = row.getFloat("TEMP");
    date[i] = row.getString("Date");
  }
}


//size of army (survivors) and route the army took
Table table3;
int N3;
float[] xs;
float[] ys;
float[] surv;
int[] div;
String[] dir;

void loadTable3() {
  table3 = loadTable("minard-table3.csv", "header");

  N3 = table3.getRowCount();
  xs = new float[N3];
  ys = new float[N3];
  surv = new float[N3];

  div = new int[N3];
  dir = new String[N3];

  N3 = table3.getRowCount();
  for (int i=0; i<N3; i++) {
    TableRow row = table3.getRow(i);
    xs[i] = row.getFloat("LONP");
    ys[i] = row.getFloat("LATP");
    surv[i] = row.getFloat("SURV");

    div[i] = row.getInt("DIV");
    dir[i] = row.getString("DIR");
  }
}
