/*
 * CryptoIM
 * by Rodrigo Valla.
 * 
 * Cifrando imágenes en vez de mensajes. 
*/
 
/*
Variables globales
*/

//Acá se puede elegir la imagen cambiando el nombre ("nombre.jpg")
String imagenElegida = new String("Banco-14.jpg");
String inputFolder = new String("Input/");
String outputFolder = new String("Output/");

/*Acá tienen que elegir el número mágico (¡No puede ser cualquiera!)
El programa todavía no anda bien. Entre los que se pueden usar están:
107, 
*/
int abracadabra = 4;

/////////////////
PImage imagenBase;
PImage imagenAlterada;
PImage imagenAuxiliar;
int fps = 10;
int ibWidth = 0;
int ibHeight = 0;
int pixelCount;
int saves = 1;
Tools t;
  
  void setup() {
  //Es mejor que ancho y alto de la ventana sean números primos
  size(911, 607);
  t = new Tools();

  imagenBase = loadImage(inputFolder + imagenElegida);
  imagenAuxiliar = loadImage(inputFolder + imagenElegida);
  ibWidth = imagenBase.width;
  ibHeight = imagenBase.height;
  imagenBase.resize(width, height);
  imagenAuxiliar.resize(width, height);
  imagenAlterada = createImage(width, height, RGB);
  pixelCount = imagenBase.pixels.length;
  
  
  }

  void draw() {
   image(imagenAlterada, 0, 0);
   noLoop();
  }
 
  void mousePressed() {
   if (mouseButton == LEFT){
     t.alterarImagen(imagenAuxiliar, imagenAlterada, abracadabra);
     redraw();
   }
    if (mouseButton == RIGHT) {    
     t.alterarImagen(imagenAlterada, imagenAuxiliar, t.getInverse(abracadabra, pixelCount));
     redraw();
   }
  }
  
  void keyPressed(){
    if (key == 'e'){
      t.alterarImagen(imagenAuxiliar, imagenAlterada, abracadabra);
      redraw();
    }
    if (key == 'd'){
      t.alterarImagen(imagenAlterada, imagenAuxiliar, t.getInverse(abracadabra, pixelCount));
      redraw();
    }
    if (key == ENTER){
      t.saveImage(imagenAlterada, saves, ibWidth, ibHeight, outputFolder);
      saves ++;
    }
  }
