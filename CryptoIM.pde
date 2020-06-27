/*
 * CryptoIM
 * by Rodrigo Valla.
 * 
 * Cifrando imágenes en vez de mensajes. 
*/
 
/*
Variables globales
*/

////////////////////////////////////////////////////////////////////
//Acá se puede elegir la imagen cambiando el nombre ("nombre.jpg")
String selectedImage = new String("Banco-01.jpg");
String inputFolder = new String("Input/");
String outputFolder = new String("Output/");
////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////
//Acá tienen que elegir el número mágico (¡No puede ser cualquiera!)
int abracadabra = 1721;
////////////////////////////////////////////////////////////////////

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
  size(1600, 1066);
  t = new Tools();

  imagenBase = loadImage(inputFolder + selectedImage);
  imagenAuxiliar = loadImage(inputFolder + selectedImage);
  imagenAlterada = loadImage(inputFolder + selectedImage);
  ibWidth = imagenBase.width;
  ibHeight = imagenBase.height;
  imagenBase.resize(width, height);
  imagenAuxiliar.resize(width, height);
  imagenAlterada.resize(width, height);
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
