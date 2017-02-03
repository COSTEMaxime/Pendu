import g4p_controls.*;  //bibliothèque UI

String[] dictionnaire;  //tableau de string qui va contenir tous les mots du fichier .txt
String motSecret, motAffiche;  //le mot a trouver + celui qui va être affiché à l'écran ainsi que d'une liste contenant toutes les lettres déjà rentrées par l'utilisateur
int erreurs;  //nombres de lettres fausses données par l'utilisateur
boolean a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z;  //chaque booléen nous indique si l'on a déja recherché une lettre
boolean lettreTrouvee;  //variable qui nous indique si la lettre rehcerchée a été trouvée dans le mot

void setup()  {
 
 size(600,450);  //taille de la fenetre
 
 dictionnaire = loadStrings("dictionnaire.txt");  //on récupère le contenu du fichier
 motSecret = dictionnaire[int(random(dictionnaire.length))];  //on choisit un mot au hasard
 motAffiche = motAffiche_ (motSecret);  //fonction qui va créer le mot qui va être affiché à l'écran en fonction de celui choisit dans le dictionnaire
 initGUI();  //on appelle la fonction qui nitialise l'interface
 a = b = c = d = e = f = g = h = i = j = k = l = m = n = o = p = q = r = s = t = u = v = w = x = y = z = true;
 lettreTrouvee = false;  
 erreurs = 0;  //on réinitialise le nombre d'erreurs
 
 background(255);  //fond
 strokeWeight(3);  //épaisseur des traits
 
 smooth();
}


void draw()  {
  
 fill(126);  //replissage
 rect(380,-1,220,451);  //rectangle gris à droite
 
 
 if (motSecret.equals(motAffiche))  {  //si le joueur a gagné
   
   fin_jeu("GAGNÉ !\nClique pour rejouer !");
 }
 
 switch (erreurs)  {  //on affiche le pendu en focntion des erreurs
  
  case 1:  //potence
    line(80,400,220,400);
    break;
  case 2:  
    line(150,400,150,80);
    break;
  case 3:
    line(150,80,250,80);
    break;
  case 4:
    line(150,130,200,80);
    break;
  case 5:
    line(250,80,250,110);
    break;
  case 6:  //personnage
    fill(255);
    strokeWeight(2);
    ellipse(250,130,60,40);
    break;
  case 7:
    line(250,150,250,250); 
    break;
  case 8:
    line(250,250,200,320);
    break;
  case 9:
    line(250,250,300,320);
    break;
  case 10:
    line(250,180,180,220);
    break;
  case 11:
    line(250,180,320,220);
    motAffiche_.setText(motSecret);
    fin_jeu("PERDU !\nClique pour rejouer !");
    break;
   }
   
  
}

/*fonction qui nous donne le mot qui va être affiché à l'écran en fonction du mot
choisit aléatoirement dans le dictionnaire    ex: "ordinateur" => "__________" */
String motAffiche_ (String motSecret)  {
  
  motAffiche = "";  //on initialise le premier caractère de la chaine
  for (int i = 0; i < motSecret.length(); i++)  {  //pour chaque lettre du mot secret
  
   motAffiche += "_";  //on rajoute un "_" au mot qui va être affiché   
  }

  return motAffiche;  //on renvoie le mot qui va être affiché à l'écran
}

//fonction qui recherche la lettre dans le mot
void chercherLettre (char lettre)  {

  lettreTrouvee = false;  //on remet la variable booléenne à false
  StringBuilder motAfficheBuilder = new StringBuilder(motAffiche);  //on crée une nouvelle chaine de type StringBuilder, c'est un type de chaine que l'on peut facilement modifier contrairement aux Strings
  
  for (int i = 0; i < motSecret.length(); i++)  {  //pour chaque lettre du mot mystère
    
   if (lettre == motSecret.charAt(i))  {  //on regarde si la lettre sur laquelle on a appuyé correspond
     
     motAfficheBuilder.setCharAt(i, motSecret.charAt(i));  //alors on la remplace dans le mot qui va être affiché à l'écran
     lettreTrouvee = true;  //booléen qui nous indique que le caractère apparait au moins une fois dans la chaine
     }
  }  

     if (lettreTrouvee == true)  {  //si on a trouvé le caractère dans la chaine
       motAffiche = motAfficheBuilder.toString();  //on converti motAfficheBuilder (de type StringBuilder) en String et on l'assigne à notre variablemotAffiche qui représente le mot affiché à l'écran
       motAffiche_.setText(motAffiche);  //on modifie le texte dans l'interface
       
     }
     else  {  //si l'on n'a pas trouvé le carctère (on s'est trompé)
       
       erreurs ++;  //on augmente notre npombre d'erreurs
     }
     
}

//si on a terminé la partie
void fin_jeu(String message)  {
  
 rejouer_.setText(message);  //on chnage le texte du boutton rejouer
 rejouer_.setVisible(true);  //et on l'affiche
 buttonA.setEnabled(false);  //on désactive tous les autres bouttons
 buttonB.setEnabled(false);
 buttonC.setEnabled(false);
 buttonD.setEnabled(false);
 buttonE.setEnabled(false);
 buttonF.setEnabled(false);
 buttonG.setEnabled(false);
 buttonH.setEnabled(false);
 buttonI.setEnabled(false);
 buttonJ.setEnabled(false);
 buttonK.setEnabled(false);
 buttonL.setEnabled(false);
 buttonM.setEnabled(false);
 buttonN.setEnabled(false);
 buttonO.setEnabled(false);
 buttonP.setEnabled(false);
 buttonQ.setEnabled(false);
 buttonR.setEnabled(false);
 buttonS.setEnabled(false);
 buttonU.setEnabled(false);
 buttonV.setEnabled(false);
 buttonW.setEnabled(false);
 buttonX.setEnabled(false);
 buttonY.setEnabled(false);
 buttonZ.setEnabled(false);
    
}

//fonction qui va nous permettre de régler l'Interface Utilisateur
//lien de la doc : http://lagers.org.uk/g4p/ref/index.html
void initGUI()  {
  
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);  //theme global de l'interface (bleu)
  G4P.messagesEnabled(false);  //messages console
  //G4P.setCursorOff(ARROW);  //forme du curseur quand il est dans la fenêtre
  if(frame != null)  //si on a réussit à ouvir la fenêtre
    frame.setTitle("Jeu du pendu");  //titre de la fenêtre
    
  motAffiche_ = new GLabel(this, 410,50,190,20,motAffiche);  //fonction qui nous permet de créer un composant permettant d'afficher du texte entre différentes coordonnées (xpos,ypos, width, height,texte)
  motAffiche_titre = new GLabel(this, 400,30,100,20,"Mot mystère :");

  
  buttonA = new GButton (this, 410,100,20,20,"A");  //création de tous les bouttons
  buttonA.addEventHandler(this,"buttonA_click");  //on assigne une fonction à chaque boutton, cette fonction sert à savoir quand est-ce qu'on appuie sur le boutton
  buttonB = new GButton (this, 440,100,20,20,"B");
  buttonB.addEventHandler(this,"buttonB_click");
  buttonC = new GButton (this, 470,100,20,20,"C");
  buttonC.addEventHandler(this,"buttonC_click");
  buttonD = new GButton (this, 500,100,20,20,"D");
  buttonD.addEventHandler(this,"buttonD_click");
  buttonE = new GButton (this, 530,100,20,20,"E");
  buttonE.addEventHandler(this,"buttonE_click");
  buttonF = new GButton (this, 560,100,20,20,"F");
  buttonF.addEventHandler(this,"buttonF_click");
  buttonG = new GButton (this, 425,130,20,20,"G");
  buttonG.addEventHandler(this,"buttonG_click");
  buttonH = new GButton (this, 455,130,20,20,"H");
  buttonH.addEventHandler(this,"buttonH_click");
  buttonI = new GButton (this, 485,130,20,20,"I");
  buttonI.addEventHandler(this,"buttonI_click");
  buttonJ = new GButton (this, 515,130,20,20,"J");
  buttonJ.addEventHandler(this,"buttonJ_click");
  buttonK = new GButton (this, 545,130,20,20,"K");
  buttonK.addEventHandler(this,"buttonK_click");
  buttonL = new GButton (this, 410,160,20,20,"L");
  buttonL.addEventHandler(this,"buttonL_click");
  buttonM = new GButton (this, 440,160,20,20,"M");
  buttonM.addEventHandler(this,"buttonM_click");
  buttonN = new GButton (this, 470,160,20,20,"N");
  buttonN.addEventHandler(this,"buttonN_click");
  buttonO = new GButton (this, 500,160,20,20,"O");
  buttonO.addEventHandler(this,"buttonO_click");
  buttonP = new GButton (this, 530,160,20,20,"P");
  buttonP.addEventHandler(this,"buttonP_click");
  buttonQ = new GButton (this, 560,160,20,20,"Q");
  buttonQ.addEventHandler(this,"buttonQ_click");
  buttonR = new GButton (this, 425,190,20,20,"R");
  buttonR.addEventHandler(this,"buttonR_click");
  buttonS = new GButton (this, 455,190,20,20,"S");
  buttonS.addEventHandler(this,"buttonS_click");
  buttonT = new GButton (this, 485,190,20,20,"T");
  buttonT.addEventHandler(this,"buttonT_click");
  buttonU = new GButton (this, 515,190,20,20,"U");
  buttonU.addEventHandler(this,"buttonU_click");
  buttonV = new GButton (this, 545,190,20,20,"V");
  buttonV.addEventHandler(this,"buttonV_click");
  buttonW = new GButton (this, 440,220,20,20,"W");
  buttonW.addEventHandler(this,"buttonW_click");
  buttonX = new GButton (this, 470,220,20,20,"X");
  buttonX.addEventHandler(this,"buttonX_click");
  buttonY = new GButton (this, 500,220,20,20,"Y");
  buttonY.addEventHandler(this,"buttonY_click");
  buttonZ = new GButton (this, 530,220,20,20,"Z");
  buttonZ.addEventHandler(this,"buttonZ_click");
  
  rejouer_ = new GButton(this, width/2 - 50, height/2 - 25, 100, 50);
  rejouer_.addEventHandler(this,"rejouer_click");
  rejouer_.setVisible(false);
}

GButton buttonA,buttonB,buttonC,buttonD,buttonE,buttonF,buttonG,buttonH,buttonI,  //on définie toutes les variables pour l'interface
        buttonJ,buttonK,buttonL,buttonM,buttonN,buttonO,buttonP,buttonQ,buttonR,
        buttonS,buttonT,buttonU,buttonV,buttonW,buttonX,buttonY,buttonZ, rejouer_;
        
GLabel motAffiche_, motAffiche_titre, score_;



//fonctions qui gèrent les événements des bouttons

void buttonA_click (GButton source, GEvent event)  {  //si on appuie sur un boutton
  
 if (a)  {  //si c'est la 1ere fois qu'on appuie dessus
   
  buttonA.setLocalColorScheme(GCScheme.ALPHA_BLOCK);  //on change sa couleur
  a = false;  //on change le booléen, comme ça on ne peut pas rappuyer dessus
  chercherLettre('A');  //on appelle la fonction qui recherche la lettre correspondante dans le mot
 }  
}

void buttonB_click (GButton source, GEvent event)  {
  
 if (b)  {
   
  buttonB.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  b = false; 
  chercherLettre('B');
 }  
}

void buttonC_click (GButton source, GEvent event)  {
  
 if (c)  {
   
  buttonC.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  c = false; 
  chercherLettre('C');
 }  
}

void buttonD_click (GButton source, GEvent event)  {
  
 if (d)  {
   
  buttonD.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  d = false; 
  chercherLettre('D');
 }  
}

void buttonE_click (GButton source, GEvent event)  {
  
 if (e)  {
   
  buttonE.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  e = false; 
  chercherLettre('E');
 }  
}

void buttonF_click (GButton source, GEvent event)  {
  
 if (f)  {
   
  buttonF.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  f = false; 
  chercherLettre('F');
 }  
}

void buttonG_click (GButton source, GEvent event)  {
  
 if (g)  {
   
  buttonG.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  g = false; 
  chercherLettre('G');
 }  
}

void buttonH_click (GButton source, GEvent event)  {
  
 if (h)  {
   
  buttonH.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  h = false; 
  chercherLettre('H');
 }  
}

void buttonI_click (GButton source, GEvent event)  {
  
 if (i)  {
   
  buttonI.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  i = false; 
  chercherLettre('I');
 }  
}

void buttonJ_click (GButton source, GEvent event)  {
  
 if (j)  {
   
  buttonJ.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  j = false; 
  chercherLettre('J');
 }  
}

void buttonK_click (GButton source, GEvent event)  {
  
 if (k)  {
   
  buttonK.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  k = false; 
  chercherLettre('K');
 }  
}

void buttonL_click (GButton source, GEvent event)  {
  
 if (l)  {
   
  buttonL.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  l = false; 
  chercherLettre('L');
 }  
}

void buttonM_click (GButton source, GEvent event)  {
  
 if (m)  {
   
  buttonM.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  m = false; 
  chercherLettre('M');
 }  
}

void buttonN_click (GButton source, GEvent event)  {
  
 if (n)  {
   
  buttonN.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  n = false; 
  chercherLettre('N');
 }  
}

void buttonO_click (GButton source, GEvent event)  {
  
 if (o)  {
   
  buttonO.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  o = false; 
  chercherLettre('O');
 }  
}

void buttonP_click (GButton source, GEvent event)  {
  
 if (p)  {
   
  buttonP.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  p = false; 
  chercherLettre('P');
 }  
}

void buttonQ_click (GButton source, GEvent event)  {
  
 if (q)  {
   
  buttonQ.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  q = false; 
  chercherLettre('Q');
 }  
}

void buttonR_click (GButton source, GEvent event)  {
  
 if (r)  {
   
  buttonR.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  r = false; 
  chercherLettre('R');
 }  
}

void buttonS_click (GButton source, GEvent event)  {
  
 if (s)  {
   
  buttonS.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  s = false; 
  chercherLettre('S');
 }  
}

void buttonT_click (GButton source, GEvent event)  {
  
 if (t)  {
   
  buttonT.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  t = false; 
  chercherLettre('T');
 }  
}

void buttonU_click (GButton source, GEvent event)  {
  
 if (u)  {
   
  buttonU.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  u = false; 
  chercherLettre('U');
 }  
}

void buttonV_click (GButton source, GEvent event)  {
  
 if (v)  {
   
  buttonV.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  v = false; 
  chercherLettre('V');
 }  
}

void buttonW_click (GButton source, GEvent event)  {
  
 if (w)  {
   
  buttonW.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  w = false; 
  chercherLettre('W');
 }  
}

void buttonX_click (GButton source, GEvent event)  {
  
 if (x)  {
   
  buttonX.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  x = false; 
  chercherLettre('X');
 }  
}

void buttonY_click (GButton source, GEvent event)  {
  
 if (y)  {
   
  buttonY.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  y = false; 
  chercherLettre('Y');
 }  
}

void buttonZ_click (GButton source, GEvent event)  {
  
 if (z)  {
   
  buttonZ.setLocalColorScheme(GCScheme.ALPHA_BLOCK);
  z = false; 
  chercherLettre('Z');
 }  
}

void rejouer_click (GButton source, GEvent event)  {
 
  
  rejouer_.setVisible(false);
  buttonA = new GButton (this, 410,100,20,20,"A");  //création de tous les bouttons
  buttonA.addEventHandler(this,"buttonA_click");  //on assigne une fonction à chaque boutton, cette fonction sert à savoir quand est-ce qu'on appuie sur le boutton
  buttonB = new GButton (this, 440,100,20,20,"B");
  buttonB.addEventHandler(this,"buttonB_click");
  buttonC = new GButton (this, 470,100,20,20,"C");
  buttonC.addEventHandler(this,"buttonC_click");
  buttonD = new GButton (this, 500,100,20,20,"D");
  buttonD.addEventHandler(this,"buttonD_click");
  buttonE = new GButton (this, 530,100,20,20,"E");
  buttonE.addEventHandler(this,"buttonE_click");
  buttonF = new GButton (this, 560,100,20,20,"F");
  buttonF.addEventHandler(this,"buttonF_click");
  buttonG = new GButton (this, 425,130,20,20,"G");
  buttonG.addEventHandler(this,"buttonG_click");
  buttonH = new GButton (this, 455,130,20,20,"H");
  buttonH.addEventHandler(this,"buttonH_click");
  buttonI = new GButton (this, 485,130,20,20,"I");
  buttonI.addEventHandler(this,"buttonI_click");
  buttonJ = new GButton (this, 515,130,20,20,"J");
  buttonJ.addEventHandler(this,"buttonJ_click");
  buttonK = new GButton (this, 545,130,20,20,"K");
  buttonK.addEventHandler(this,"buttonK_click");
  buttonL = new GButton (this, 410,160,20,20,"L");
  buttonL.addEventHandler(this,"buttonL_click");
  buttonM = new GButton (this, 440,160,20,20,"M");
  buttonM.addEventHandler(this,"buttonM_click");
  buttonN = new GButton (this, 470,160,20,20,"N");
  buttonN.addEventHandler(this,"buttonN_click");
  buttonO = new GButton (this, 500,160,20,20,"O");
  buttonO.addEventHandler(this,"buttonO_click");
  buttonP = new GButton (this, 530,160,20,20,"P");
  buttonP.addEventHandler(this,"buttonP_click");
  buttonQ = new GButton (this, 560,160,20,20,"Q");
  buttonQ.addEventHandler(this,"buttonQ_click");
  buttonR = new GButton (this, 425,190,20,20,"R");
  buttonR.addEventHandler(this,"buttonR_click");
  buttonS = new GButton (this, 455,190,20,20,"S");
  buttonS.addEventHandler(this,"buttonS_click");
  buttonT = new GButton (this, 485,190,20,20,"T");
  buttonT.addEventHandler(this,"buttonT_click");
  buttonU = new GButton (this, 515,190,20,20,"U");
  buttonU.addEventHandler(this,"buttonU_click");
  buttonV = new GButton (this, 545,190,20,20,"V");
  buttonV.addEventHandler(this,"buttonV_click");
  buttonW = new GButton (this, 440,220,20,20,"W");
  buttonW.addEventHandler(this,"buttonW_click");
  buttonX = new GButton (this, 470,220,20,20,"X");
  buttonX.addEventHandler(this,"buttonX_click");
  buttonY = new GButton (this, 500,220,20,20,"Y");
  buttonY.addEventHandler(this,"buttonY_click");
  buttonZ = new GButton (this, 530,220,20,20,"Z");
  buttonZ.addEventHandler(this,"buttonZ_click");
 
  motSecret = dictionnaire[int(random(dictionnaire.length))];
  motAffiche = motAffiche_ (motSecret);
  motAffiche_.setText(motAffiche);
  a = b = c = d = e = f = g = h = i = j = k = l = m = n = o = p = q = r = s = t = u = v = w = x = y = z = true;
  lettreTrouvee = false;
  erreurs = 0;
  background(255);
  strokeWeight(3);  
}