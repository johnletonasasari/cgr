/*
 * Tarea tangrama
 *
 * Autor: Letona Sasari John
 * version 1.3
 */
#include<windows.h>
#include<cmath>
#ifdef __APPLE__
#include <GLUT/glut.h>
#else
#include <GL/glut.h>
#endif

#include <stdlib.h>
#include <iostream>
#include<string.h>
#include <set>
float red[]={255.0f/255.0f,0.0f/255.0f,0.0f/255.0f} , skyblue[]={51.0f/255.0f,255.0f/255.0f,240.0f/255.0f}, orange[]={255.0f/255.0f,153.0f/255.0f,51.0f/255.0f}, green[]={51.0f/255.0f,255.0f/255.0f,0.0f/255.0f};
float pink[]={255.0f/255.0f,0.0f/255.0f,255.0f/255.0f}, yellow[]={255.0f/255.0f,255.0f/255.0f,0.0f/255.0f},purple[]={127.0f/255.0f,0.0f/255.0f,255.0f/255.0f};
float movimientox=0;
float movimientoy=0;
float personajex=2;
float personajey=2;
float personajeancho=3;
float personajealto=5;
float velocidad=1;
bool colisionderecha=false;
bool colisionizquierda=false;
bool colisionarriba=false;
bool colisionabajo=false;
bool colisionarribaderecha=false;
bool colisionarribaizquierda=false;
bool colisionabajoderecha=false;
bool colisionabajoizquierda=false;
std::set<unsigned char> keysPressed;
void inicio(){

gluOrtho2D(-50,50,-50,50);
}
static void key(unsigned char key, int x, int y)
{



     keysPressed.insert(key);





     //----------------------------






    // Verificar si las teclas 'a' y 'b' están presionadas
    if (keysPressed.count('a') && keysPressed.count('s')) {
        std::cout << "Se presionaron las teclas 'a' y 's' casi al mismo tiempo." << std::endl;
        if(colisionarribaderecha==false){
            movimientoy=movimientoy-velocidad;
            movimientox=movimientox-velocidad;
        }

        // Puedes realizar aquí la acción que desees al detectar ambas teclas
    }else if (keysPressed.count('a') && keysPressed.count('w')) {
        std::cout << "Se presionaron las teclas 'a' y 'w' casi al mismo tiempo." << std::endl;
        if(colisionabajoizquierda==false){
           movimientox=movimientox+velocidad;
           movimientoy=movimientoy-velocidad;

        }

    }else if (keysPressed.count('w') && keysPressed.count('d')) {
        std::cout << "Se presionaron las teclas 'w' y 'd' casi al mismo tiempo." << std::endl;
        if(colisionabajoderecha==false){
            movimientox=movimientox+velocidad;
            movimientoy=movimientoy+velocidad;
        }

    }
    else if (keysPressed.count('d') && keysPressed.count('s')) {
        std::cout << "Se presionaron las teclas 'd' y 's' casi al mismo tiempo." << std::endl;
        if(colisionarribaizquierda==false){
           movimientox=movimientox-velocidad;
           movimientoy=movimientoy+velocidad;
        }

    }
    else if (keysPressed.count('d')){
    std::cout << "Se presionaron las teclas 'd' " << std::endl;
     if (colisionderecha==false){
                movimientoy=movimientoy+velocidad;

                colisionizquierda=false;
                colisionarriba=false;
                colisionabajo=false;


            }
    }else if (keysPressed.count('w')){
    std::cout << "Se presionaron las teclas 'w' " << std::endl;
    if(colisionabajo==false){
              movimientox=movimientox+velocidad;
              colisionarriba=false;
              colisionderecha=false;
              colisionizquierda=false;

            }

    }
    else if (keysPressed.count('s')){
    std::cout << "Se presionaron las teclas 's' " << std::endl;
    if (colisionarriba==false){
                movimientox=movimientox-velocidad;
                colisionabajo=false;
                colisionderecha=false;
                colisionizquierda=false;

            }
    }else if (keysPressed.count('a')){
    std::cout << "Se presionaron las teclas 'a' " << std::endl;
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
                std::cout<<"colision  arriba izquierda"<<std::endl;
                colisionarriba=false;
                colisionderecha=false;
                colisionarribaizquierda=true;
            }
            else if(personajex+personajeancho==objetox && personajey+personajealto==objetoy )
            {
                std::cout<<"colision  abajo derecha"<<std::endl;
                 colisionabajo=false;
                colisionderecha=false;
                colisionabajoderecha=true;
            }
            else if(personajex==objetox+objetoancho && personajey==objetoy+objetoalto)
            {
                std::cout<<"colision  arriba derecha"<<std::endl;
                colisionarriba=false;
                colisionizquierda=false;
                colisionarribaderecha=true;
            }
            else if(personajex==objetox+objetoancho && personajey+personajealto==objetoy)
            {
                std::cout<<"colision  abajo izquierda"<<std::endl;
                colisionabajo=false;
                colisionizquierda=false;
                colisionabajoizquierda=true;
            }

        else{
    if(personajex+personajeancho==objetox)
    {
        std::cout<<"colisionx derecha"<<std::endl;
         colisionderecha=true;
         colisionabajoderecha=true;
         colisionarribaizquierda=true;


    }
      if(personajex==objetox+objetoancho)
    {
       std::cout<<"colisionx izquierda"<<std::endl;
         colisionizquierda=true;
         colisionabajoizquierda=true;
         colisionarribaderecha=true;

    }
      if(personajey==objetoy+objetoalto)
    {
        std::cout<<"colisiony arriba"<<std::endl;
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



void cuadrilatero(float x,float y,float lado1,float lado2,int tipo,float *rgbcolor){
    glColor3fv(rgbcolor);
glBegin(GL_POLYGON);
glVertex2d(x,y);
glVertex2d(x+lado1,y);
glVertex2d(x+lado1,y+lado2);
glVertex2d(x,y+lado2);
glEnd();
if(tipo==1){
   colision(personajex,personajey,personajeancho,personajealto,x,y,lado1,lado2);
}


}


static void idle(void)
{
    glutPostRedisplay();

}


 void display(void)
{
    glClearColor(1,1,1,0);
    glClear(GL_COLOR_BUFFER_BIT);
    personajex=+movimientoy;
    personajey=+movimientox;
cuadrilatero(personajex,personajey,personajeancho,personajealto,0,purple);
cuadrilatero(5,5,10,8,1,green);
cuadrilatero(20,20,15,30,1,yellow);
    glutSwapBuffers();
}


int main(int argc, char *argv[])
{
    glutInit(&argc, argv);
    glutInitWindowSize(640,480);
    glutInitWindowPosition(10,10);
    glutInitDisplayMode(GLUT_RGB | GLUT_DOUBLE | GLUT_DEPTH);
    glutCreateWindow("patron");
     glutKeyboardFunc(key);
     glutKeyboardUpFunc(keyboardUp);
     glutIdleFunc(idle);
    inicio();
    glutDisplayFunc(display);
    glutMainLoop();
    return 0;
}
