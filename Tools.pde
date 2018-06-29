import java.math.BigInteger;

public class Tools{
/*
Métodos para el funcionamiento del programa
*/

/*Los pixeles de la imagen cambian de posición usando multiplicación.
El factor tiene que ser coprimo con el número de pixeles si se pretende
recuperar la imagen original*/
void alterarImagen(PImage base, PImage alterada, int f){
  base.loadPixels();
  alterada.loadPixels();
  int l = base.pixels.length;
  for (int i = 0; i < l; i++) {
     alterada.pixels[i] = base.pixels[getIndex(i, f, l)];
  }
  alterada.updatePixels();
  igualarImagen(alterada, base);
}

//Método para copiar imágenes entre sí
void igualarImagen (PImage base, PImage copia){
  base.loadPixels();
  copia.loadPixels();
  int l = base.pixels.length;
  for (int i = 0; i < l; i++) {
    copia.pixels[i] = base.pixels[i]; 
  }
  copia.updatePixels();
}

void saveImage(PImage i, int n, int w, int h, String f){
  String name = new String(f);
  name += String.valueOf(hour());
  name+= "_";
  name += String.valueOf(minute());
  name+= "_";
  name += nf(n, 4);
  name+= ".jpg";
  i.resize(w, h);
  i.save(name);
  i.resize(width, height);
}

//Acá buscamos el inverso multiplicativo
int getInverse(int f, int t){
    int r = 0;
    int i = 1;
    while (r != 1){
      r = (f * i) % t;
      if (r != 1){
        i++;
      }
      if (i > 5399999){
        i = f; 
        break; 
      }     
    }
    return i;
  }

}

//Calculamos las posiciones para cada pixel.
int getIndex(int i, int f, int l){
  int p = 0;
  BigInteger index = new BigInteger("0");
  index = BigInteger.valueOf(i);
  BigInteger factor = new BigInteger("0");
  factor = BigInteger.valueOf(f);
  BigInteger modulo = new BigInteger("0");
  modulo = BigInteger.valueOf(l);

  index = index.multiply(factor);
  index = index.mod(modulo);
  
  p = index.intValue();
  
  return p;
}
