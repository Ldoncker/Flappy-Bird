class Pipe {
    float pipeX;
    float pipeLen;
    float pipeSpeed;

    Pipe() {
      pipeX = (cpt * 400) + width;  //Abscisse du tuyau en fonction du compteur
      pipeLen = random(100, 500);  //Longueur du tuyau aléatoire entre 100 et 500
      pipeSpeed = 4;  //Vitesse de déplacement des tuyaux
    }
    
    //Mise à jour des tuyaux
    void updatePipes() {
      pipeX -= pipeSpeed;  //Mouvement du tuyau
      if (pipeX < -100) {  //Si le tuyau sort de l'écran
        pipeX = width;  //Le tuyau apparait à droite de l'écran
      }
    }
    
    //Affichage des tuyaux
    void showPipes() {
      noStroke();
      
      //Les tuyaux sont créés avec des rectangles afin que le projet contienne des primitives 2D
      fill(0,170,0);  //Couleur des tuyaux
      rect(pipeX + 10, 0, 80, pipeLen);  //Partie principale du tuyau supérieur
      rect(pipeX, pipeLen - 50, 100, 50);  //Embouchure du tuyau supérieur
      
      rect(pipeX + 10, pipeLen + 200, 80, height - pipeLen);  //Partie principale du tuyau inférieur
      rect(pipeX, pipeLen + 200, 100, 50);  //Embouchure du tuyau inférieur
      
      fill(0, 100, 0);  //Couleur de la séparation du tuyau
      rect(pipeX + 10, pipeLen - 52, 80, 2);  //Séparation du tuyau supérieur
      rect(pipeX + 10, pipeLen + 250, 80, 2);  //Séparation du tuyau inférieur
    }
    
    //Vérification des collisions
    void checkHitbox() {
      if (yplayer + 5 < 0 || yplayer + 48 > height) {  //Si l'oiseau atteint la limite supérieure ou inférieure de l'écran
        hit = true;  //Touché
      }
      if (xplayer + 60 > pipeX && xplayer + 60 < pipeX + 100) {  //Si l'oiseau a la même abscisse que les tuyaux
        if (yplayer + 5 < pipeLen || yplayer + 48 > pipeLen + 200) {  //Si l'oiseau a la même ordonnée que les tuyaux
          hit = true;  //Touché
        }
      }
    }
    
    void checkScore() {
      if (pipeX + 100 < xplayer && pipeX + 100 > xplayer - 3){  //Si l'oiseau passe les tuyaux
        score += 1; //Incrémentation du score
      }
    }
}
