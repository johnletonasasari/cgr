#include <windows.h>
#ifdef __APPLE__
#include <GLUT/glut.h>
#else
#include <GL/glut.h>
#endif

#include <stdlib.h>
#include<cmath>
#include <stdio.h>
#include <iostream>
#include<string.h>
#include <set>

float movimientox=0;
float movimientoy=0;
float personajex=2;
float personajey=2;
float personajeancho=3;
float personajealto=5;
float musica=0;
float velocidad=1;
bool colisionderecha=false;
bool colisionizquierda=false;
bool colisionarriba=false;
bool colisionabajo=false;
bool colisionarribaderecha=false;
bool colisionarribaizquierda=false;
bool colisionabajoderecha=false;
bool colisionabajoizquierda=false;
GLuint personaje1,texture;
std::set<unsigned char> keysPressed;

void inicio(){
glClearColor(1,1,1,0);
gluOrtho2D(-20,20,-20,20);
}

GLuint loadBMP(const char* filename) {
    FILE* file = fopen(filename, "rb");
    if (!file) {
        printf("Error: No se pudo abrir el archivo de imagen.\n");
        return 0;
    }

    unsigned char header[54];
    fread(header, 1, 54, file);

    unsigned int dataPos = *(int*)&(header[0x0A]);
    unsigned int imageSize = *(int*)&(header[0x22]);
    unsigned int width = *(int*)&(header[0x12]);
    unsigned int height = *(int*)&(header[0x16]);

    if (imageSize == 0) imageSize = width * height * 3;
    if (dataPos == 0) dataPos = 54;

    unsigned char* data = new unsigned char[imageSize];
    fread(data, 1, imageSize, file);
    fclose(file);

    GLuint textureID;
    glGenTextures(1, &textureID);
    glBindTexture(GL_TEXTURE_2D, textureID);
    glTexImage2D(GL_TEXTURE_2D, 0,GL_RGB, width, height, 0, GL_RGB, GL_UNSIGNED_BYTE, data);

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

    delete[] data;

    return textureID;
}


void reproduceMusic(){
    // Especifica la ruta de tu archivo de audio aquí


      LPCSTR rutaAudio = "C:/Users/john/Documents/prueba/practica/ls.wav";
      PlaySound(rutaAudio, NULL, SND_FILENAME | SND_ASYNC | SND_LOOP);



    // Reproduce el audio en un bucle infinito


}


static void key(unsigned char key, int x, int y){



     keysPressed.insert(key);








    if (keysPressed.count('a') && keysPressed.count('s')) {

        if(colisionarribaderecha==false){
            movimientoy=movimientoy-velocidad;
            movimientox=movimientox-velocidad;
        }


    }else if (keysPressed.count('a') && keysPressed.count('w')) {

        if(colisionabajoizquierda==false){
           movimientox=movimientox+velocidad;
           movimientoy=movimientoy-velocidad;

        }

    }else if (keysPressed.count('w') && keysPressed.count('d')) {

        if(colisionabajoderecha==false){
            movimientox=movimientox+velocidad;
            movimientoy=movimientoy+velocidad;
        }

    }
    else if (keysPressed.count('d') && keysPressed.count('s')) {

        if(colisionarribaizquierda==false){
           movimientox=movimientox-velocidad;
           movimientoy=movimientoy+velocidad;
        }

    }
    else if (keysPressed.count('d')){

     if (colisionderecha==false){
                movimientoy=movimientoy+velocidad;

                colisionizquierda=false;
                colisionarriba=false;
                colisionabajo=false;


            }
    }else if (keysPressed.count('w')){

    if(colisionabajo==false){
              movimientox=movimientox+velocidad;
              colisionarriba=false;
              colisionderecha=false;
              colisionizquierda=false;

            }

    }
    else if (keysPressed.count('s')){

    if (colisionarriba==false){
                movimientox=movimientox-velocidad;
                colisionabajo=false;
                colisionderecha=false;
                colisionizquierda=false;

            }
    }else if (keysPressed.count('a')){

     if(colisionizquierda==false){
                movimientoy=movimientoy-velocidad;
                 colisionderecha=false;
                 colisionarriba=false;
                 colisionabajo=false;

            }
    }



    glutPostRedisplay();
}
void keyboardUp(unsigned char key, int x, int y) {

    keysPressed.erase(key);
}


void colision(float personajex,float personajey,float personajeancho,float personajealto,float objetox,float objetoy,float objetoancho, float objetoalto){

    if(personajex>objetox+objetoancho)
    {
if(colisionabajo==false && colisionarriba==false&&colisionderecha==false&&colisionizquierda==false)
    {
     colisionarribaderecha=false;
 colisionarribaizquierda=false;
 colisionabajoderecha=false;
 colisionabajoizquierda=false;
    }
    }
    else if(personajex+personajeancho<objetox)
    {
if(colisionabajo==false && colisionarriba==false&&colisionderecha==false&&colisionizquierda==false)
    {
     colisionarribaderecha=false;
 colisionarribaizquierda=false;
 colisionabajoderecha=false;
 colisionabajoizquierda=false;
    }
    }
    else if(personajey>objetoy+objetoalto)
    {
if(colisionabajo==false && colisionarriba==false&&colisionderecha==false&&colisionizquierda==false)
    {
     colisionarribaderecha=false;
 colisionarribaizquierda=false;
 colisionabajoderecha=false;
 colisionabajoizquierda=false;
    }
    }
    else if(personajey+personajealto<objetoy)
    {
if(colisionabajo==false && colisionarriba==false&&colisionderecha==false&&colisionizquierda==false)
    {
     colisionarribaderecha=false;
 colisionarribaizquierda=false;
 colisionabajoderecha=false;
 colisionabajoizquierda=false;
    }
    }
    else{
            if(personajex+personajeancho==objetox && personajey==objetoy+objetoalto)
            {

                colisionarriba=false;
                colisionderecha=false;
                colisionarribaizquierda=true;
            }
            else if(personajex+personajeancho==objetox && personajey+personajealto==objetoy )
            {

                 colisionabajo=false;
                colisionderecha=false;
                colisionabajoderecha=true;
            }
            else if(personajex==objetox+objetoancho && personajey==objetoy+objetoalto)
            {

                colisionarriba=false;
                colisionizquierda=false;
                colisionarribaderecha=true;
            }
            else if(personajex==objetox+objetoancho && personajey+personajealto==objetoy)
            {

                colisionabajo=false;
                colisionizquierda=false;
                colisionabajoizquierda=true;
            }

        else{
    if(personajex+personajeancho==objetox)
    {

         colisionderecha=true;
         colisionabajoderecha=true;
         colisionarribaizquierda=true;


    }
      if(personajex==objetox+objetoancho)
    {

         colisionizquierda=true;
         colisionabajoizquierda=true;
         colisionarribaderecha=true;

    }
      if(personajey==objetoy+objetoalto)
    {

         colisionarriba=true;
         colisionarribaderecha=true;
         colisionarribaizquierda=true;
    }
      if(personajey+personajealto==objetoy)
    {

         colisionabajo=true;
         colisionabajoderecha=true;
         colisionabajoizquierda=true;
    }

    }
}
}



static void idle(void){
    glutPostRedisplay();
}

void cuadrilatero(float x,float y,float lado1,float lado2,int tipo,GLuint textura){

    glEnable(GL_TEXTURE_2D);
    glBindTexture(GL_TEXTURE_2D, textura);
glColor4f(1,1,1,1);
glBegin(GL_POLYGON);
glTexCoord2f(0,0);glVertex2d(x,y);
glTexCoord2f(1,0);glVertex2d(x+lado1,y);
glTexCoord2f(1,1);glVertex2d(x+lado1,y+lado2);
glTexCoord2f(0,1);glVertex2d(x,y+lado2);
glEnd();
glBindTexture(GL_TEXTURE_2D, 0);
glDisable(GL_TEXTURE_2D);
if(tipo==1){
   colision(personajex,personajey,personajeancho,personajealto,x,y,lado1,lado2);
}


}

static void display(void)
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
cuadrilatero(personajex,personajey,personajeancho,personajealto,0,personaje1);
    glutSwapBuffers();
}
int main(int argc, char *argv[])
{
    glutInit(&argc, argv);
    glutInitWindowSize(1920,1080);
    glutInitDisplayMode(GLUT_RGB | GLUT_DOUBLE | GLUT_DEPTH);
    glutCreateWindow("juego");
    inicio();
    glutDisplayFunc(display);

    personaje1 = loadBMP("C:/Recusos/Sprites/personajeabajo.bmp");



    glutMainLoop();

    return EXIT_SUCCESS;
}
