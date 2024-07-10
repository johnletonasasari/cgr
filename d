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

float movimientox=10;
float movimientoy=460;
float personajex=460;
float personajey=10;
float personajeancho=30;
float personajealto=50;
float musica=0;
float velocidad=10;

bool colisionderecha=false;
bool colisionizquierda=false;
bool colisionarriba=false;
bool colisionabajo=false;
bool colisionarribaderecha=false;
bool colisionarribaizquierda=false;
bool colisionabajoderecha=false;
bool colisionabajoizquierda=false;

GLuint facultad,sotano,salon,personajearriba,personajeabajo,personajeizquierda,personajederecha;
GLuint personajedireccion;
std::set<unsigned char> keysPressed;

void inicio(){
glClearColor(0,0,0,0);
gluOrtho2D(-1600,1600,-1600,1600);
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
                personajedireccion=personajederecha;
                colisionizquierda=false;
                colisionarriba=false;
                colisionabajo=false;


            }
    }else if (keysPressed.count('w')){

    if(colisionabajo==false){
              movimientox=movimientox+velocidad;
              personajedireccion=personajearriba;
              colisionarriba=false;
              colisionderecha=false;
              colisionizquierda=false;

            }

    }
    else if (keysPressed.count('s')){

    if (colisionarriba==false){
                movimientox=movimientox-velocidad;
                personajedireccion=personajeabajo;
                colisionabajo=false;
                colisionderecha=false;
                colisionizquierda=false;

            }
    }else if (keysPressed.count('a')){

     if(colisionizquierda==false){
                movimientoy=movimientoy-velocidad;
                personajedireccion=personajeizquierda;
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
        std::cout<<"colisiony abajo"<<std::endl;
         colisionabajo=true;
         colisionabajoderecha=true;
         colisionabajoizquierda=true;
    }

    }
}
}


 void colision2(float personajex,float personajey,float personajeancho,float personajealto,float objetox,float objetoy,float objetoancho, float objetoalto,int transporte){

    if(personajex>objetox+objetoancho)
    {
    }
    else if(personajex+personajeancho<objetox)
    {
    }
    else if(personajey>objetoy+objetoalto)
    {
    }
    else if(personajey+personajealto<objetoy)
    {
    }
    else{
        if(transporte==1){
            movimientox=1180;
            movimientoy=-560;
            personajex=-560;
            personajey=1180;
        }else if(transporte==2){
            movimientox=1000;
            movimientoy=500;
            personajex=500;
            personajey=1000;
        }else if( transporte==3){
        movimientox=-1350;
            movimientoy=-320;
            personajex=-320;
            personajey=-1350;
        }else if( transporte==4){
        movimientox=940;
            movimientoy=-740;
            personajex=-740;
            personajey=940;
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



}

void cuadrilatero2(float x,float y,float lado1,float lado2,int tipo){


glColor4f(0,0,0,0);
glBegin(GL_POLYGON);
glVertex2d(x,y);
glVertex2d(x+lado1,y);
glVertex2d(x+lado1,y+lado2);
glVertex2d(x,y+lado2);
glEnd();

if(tipo==1){


   colision(personajex,personajey,personajeancho,personajealto,x,y,lado1,lado2);
}else if(tipo==2){
colision2(personajex,personajey,personajeancho,personajealto,x,y,lado1,lado2,1);
}


}

void cuadrilatero3(float x,float y,float lado1,float lado2,int tipo, int transporte){


glColor4f(1,1,1,0);
glBegin(GL_POLYGON);
glVertex2d(x,y);
glVertex2d(x+lado1,y);
glVertex2d(x+lado1,y+lado2);
glVertex2d(x,y+lado2);
glEnd();

if(tipo==1){


   colision(personajex,personajey,personajeancho,personajealto,x,y,lado1,lado2);
}else if(tipo==2){
colision2(personajex,personajey,personajeancho,personajealto,x,y,lado1,lado2,transporte);
}


}

void reshape(int w, int h) {
    glViewport(0, 0, (GLsizei) w, (GLsizei) h);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(60.0, (GLfloat) w / (GLfloat) h, 1.0, 10000.0);
}
static void display(void)
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glEnable(GL_DEPTH_TEST);
   glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    personajex=+movimientoy;
    personajey=+movimientox;
    gluLookAt(personajex,personajey,500,personajex,personajey,0,0,1,0);

//texturas

cuadrilatero(personajex,personajey,personajeancho,personajealto,0,personajedireccion);
cuadrilatero(4,2,1500,1536,0,facultad);
cuadrilatero(-1130,10,1080,1536,0,sotano);
cuadrilatero(-1350,-1640,1300,1536,0,salon);
//colisiones facutlad
cuadrilatero2(420,0,20,1350,1);
cuadrilatero2(420,1340,1080,10,1);
cuadrilatero2(1500,0,10,1130,1);
cuadrilatero2(420,-10,1080,10,1);
cuadrilatero2(570,40,400,960,1);
cuadrilatero2(730,1010,140,160,1);
cuadrilatero2(1140,680,340,320,1);
//colision sotano
cuadrilatero2(-500,440,10,710,1);
cuadrilatero2(-780,430,280,10,1);
cuadrilatero2(-790,440,10,490,1);
cuadrilatero2(-790,970,10,170,1);
cuadrilatero2(-780,1140,120,10,1);
cuadrilatero2(-610,1140,110,10,1);
cuadrilatero2(-370,1240,10,70,1);
cuadrilatero2(-890,1310,620,10,1);
cuadrilatero2(-900,1150,10,160,1);
cuadrilatero2(-890,1140,110,10,1);

//colision salon
cuadrilatero2(-250,-1470,10,940,1);
cuadrilatero2(-1170,-1480,920,10,1);
cuadrilatero2(-1180,-1470,10,940,1);
cuadrilatero2(-1180,-530,920,10,1);

//transporte
cuadrilatero3(570,1000,160,80,2,1);// facultad a sotano
cuadrilatero3(-500,1150,130,80,2,2);//sotano a facultad
cuadrilatero3(-790,930,10,40,2,3);//sotano a salon
cuadrilatero3(-250,-1350,10,40,2,4);//salon a sotano
    glutSwapBuffers();
}
int main(int argc, char *argv[])
{
    glutInit(&argc, argv);
    glutInitWindowSize(1080,768);
    glutInitDisplayMode(GLUT_RGB | GLUT_DOUBLE | GLUT_DEPTH);
    glutCreateWindow("juego");
    inicio();

    glutDisplayFunc(display);
glutReshapeFunc(reshape);
glutKeyboardFunc(key);
     glutKeyboardUpFunc(keyboardUp);
    facultad = loadBMP("C:/Recusos/Sprites/facultad.bmp");
    sotano = loadBMP("C:/Recusos/Sprites/sotano.bmp");
    salon = loadBMP("C:/Recusos/Sprites/salon.bmp");
    personajedireccion=loadBMP("C:/Recusos/Sprites/personajearriba.bmp");
    personajearriba=loadBMP("C:/Recusos/Sprites/personajearriba.bmp");
    personajeabajo=loadBMP("C:/Recusos/Sprites/personajeabajo.bmp");
    personajederecha=loadBMP("C:/Recusos/Sprites/personajederecha.bmp");
    personajeizquierda=loadBMP("C:/Recusos/Sprites/personajeizquierda.bmp");
    glutMainLoop();

    return EXIT_SUCCESS;
}
