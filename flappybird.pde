//Remake of Flappy Bird
//Author: Ludovic Donckerwolke

Pipe[] pipes = new Pipe [3];
boolean start;
boolean hit;
PImage bird;
PImage bground;
PImage endgame;
PFont flappyfont;
float cpt;
float xplayer;
float yplayer;
float yspeed;
float gravity;
float xscore;
float yscore;
int score;

void setup() {
  frameRate(60);
  size(1100, 800);
  
  //Chargement des images
  bground = loadImage("background.jpg");  //Image de fond
  bird = loadImage("bird.png");  //Image de l'oiseau
  endgame = loadImage("endgame.png");  //Image de fin de jeu créée grâce au logiciel Photoshop
  
  //Chargement de la police d'écriture
  flappyfont = createFont("flappybird.TTF", 100);
  
  start = false;
  hit = false;
  
  //Assignement des coordonées de l'oiseau
  xplayer = width/3;
  yplayer = height/2;
  
  gravity = 0.3;
}

void draw() {
  //Affichage du background et de l'oiseau
  image(bground, 0, 0);
  image(bird, xplayer, yplayer, 69, 50);
  
  if (start) {  //Si le jeu a commencé...
    yspeed += gravity;  //Valeur de gravité ajoutée à la vitesse
    yplayer += yspeed;  //Mouvement de l'oiseau en fonction de la vitesse
    for (int i = 0; i < pipes.length; i++) {  //Parcourt le tableau des tuyaux
      pipes[i].updatePipes();
      pipes[i].showPipes();
      pipes[i].checkHitbox();
      pipes[i].checkScore();
    }
    
    //Coordonées du texte de score
    xscore = width/2;
    yscore = 150;
    
    showScore();
  }
  
  if (hit == true) {  //Si l'oiseau touche un tuyau
    gameOver();  //Fin du jeu
  }
}

//Affichage du score
void showScore() {
  textFont(flappyfont);
  textAlign(CENTER);
  fill(255);
  text(score, xscore, yscore);
}

//Arrêt du jeu
void gameOver() {
  start = false;
  
  //Changement des coordonnées du texte de score
  xscore = width/2 + 150;
  yscore = height/2;
  
  //Affichage de l'image de fin et le score
  image(endgame, 0, 0, width, height);
  showScore();
}

//Initialisation du jeu
void initgame() {
  start = true;
  hit = false;
  
  //Réinitialisation de la vitesse, du compteur, des coordonnées et du score
  yspeed = 0;
  cpt = 0;
  xplayer = width/3;
  yplayer = height/2;
  score = 0;
  
  //Réinitalisation des tuyaux
  for (int i = 0; i < pipes.length; i++) {
    pipes[i] = new Pipe();
    cpt++;
  }
}

void keyPressed() {
  if (key == 32) {  //Si la barre d'espace est utilisée
    if (!start) {  //Si le jeu n'a pas commencé
      initgame();
    }
    else {
      yspeed = -8;  //Sinon, l'oiseau saute
    }
  }
}
