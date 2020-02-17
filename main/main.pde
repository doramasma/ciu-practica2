//import gifAnimation.*;
PShape figura;
ArrayList<PointAux> coordenadas;
PFont font1;
PImage imageLeft,imageRight,imageMouse,imageE,imageR,imageT;
int status;
float angulo;

//int counter = 0;
//GifMaker ficherogif;

void setup() {
  size(800, 600, P3D);  
  coordenadas = new ArrayList<PointAux>();
  font1 = loadFont("Tahoma-48.vlw");
  imageLeft = loadImage("./image/left.png");
  imageRight = loadImage("./image/right.png");
  imageMouse = loadImage("./image/mouse.png");
  imageE = loadImage("./image/E.png");
  imageR = loadImage("./image/R.png");
  imageT = loadImage("./image/T.png");
  status = 0;
  angulo = 0;
  
  //ficherogif = new GifMaker( this , "animacion.gif") ;
  //ficherogif.setRepeat(0);
}

void draw() {

  if (status == 0) {
    background(0);
    stroke(255);
    line(width/2, 0, width/2, height);
    textFont(font1, 20);
    image(imageR, 30 ,20, 45,45);
    image(imageE, 30 ,85, 45,45);
    image(imageMouse, 30 ,150, 45,75);
    text("Convertir a objeto 3D", 85 , 48 );
    text("Nueva figura ", 85 , 113);
    text("Añadir puntos ", 85 , 200);
   
    capturarPuntos();
    pintar();
  } else if (status == 1) {
    background(0);
    stroke(255);
    textFont(font1, 20);
    image(imageT, 30 ,20, 45,45);
    image(imageE, 30 ,85, 45,45);
    image(imageLeft, 30 , 150, 45, 45);
    image(imageRight, 30 , 215, 45, 45);
    text("Convertir a forma 2D ", 85 , 48 );
    text("Nueva figura ", 85 , 113);
    text("Click izquierdo ", 85 , 180);
    text("Click derecho ", 85 , 245);
    rotar();
    
  }

}

void capturarPuntos() {
  if (mousePressed) {
    if (mouseX >= (width/2)) {
      coordenadas.add(new PointAux(mouseX, mouseY) );

    }
    
  }
}

void pintar() {
  PShape figura = createShape();
  figura.beginShape();
  figura.stroke (255 ) ;
  figura.noFill();
  figura.strokeWeight (2);
  for (PointAux punto : coordenadas) {
    figura.vertex(punto.getX(), punto.getY());
  }
  figura.endShape();
  
  shape(figura);
  
}

void rotar() {
  float xAux1, xAux2;
  float yAux1, yAux2;
  float zAux1, zAux2;
  PShape figura = createShape();
  figura.beginShape(TRIANGLE_STRIP);
  figura.stroke (128 ) ;
  figura.strokeWeight (2);
  for (float theta = 0; theta < 2*PI; theta = theta + PI/4) {
    for (PointAux punto : coordenadas) {
      xAux1 = (punto.getX()-(width/2))*cos(theta) - 0;
      yAux1 = punto.getY();
      zAux1 = (punto.getX()-(width/2))*sin(theta) + 0;

      xAux2 = (punto.getX()-(width/2))*cos(theta + PI/4) - 0;
      yAux2 = punto.getY();
      zAux2 = (punto.getX()-(width/2))*sin(theta + PI/4) + 0;

      figura.vertex(xAux1, yAux1, zAux1  );
      figura.vertex(xAux2, yAux2, zAux2 );
    }
  }
  

  figura.endShape();
  translate(mouseX-50, mouseY-50);
  if (mousePressed && (mouseButton == LEFT)) {
    angulo += 0.025;
    
  } else if (mousePressed && (mouseButton == RIGHT)) {
    angulo -= 0.025;
    
  }
  rotateY(angulo);
  shape(figura);
     
  
 
}


void keyPressed() {
  if (key == 'r' || key == 'R') status = 1;
  if (key == 't' || key == 'T') status = 0;
  if (key == 'e' || key == 'E') {
    coordenadas.clear();
    status = 0;
    angulo = 0;
  }
  
 
}
