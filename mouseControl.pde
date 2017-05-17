int Ccount = 0;
int Rcount = 0;
int []mC = new int [1000];
int []mR = new int [1000];
int []mCX = new int [1000];


void mousePressed(){
 if(page==0){
  /*--------------カレンダーボタン-------------*/
  if(430<=mouseX&&mouseX<=470&&30<=mouseY&&mouseY<=70){
   change = 1;
 }
 /*--------------伸びるrect--------------------*/
  if(65<=mouseX&&mouseX<=415&&200<=mouseY&&mouseY<=608){
  Ccount++;
  mC[Ccount] = mouseY;
 }else if(!(425<=mouseX&&mouseX<=471&&527<=mouseY&&mouseY<=550)&&!(422<=mouseX&&mouseX<=474&&567<=mouseY&&mouseY<=599)&&!(422<=mouseX&&mouseX<=474&&227<=mouseY&&mouseY<=259)){
  Ccount++;
  mC[Ccount]=0;
  //text("Error",370,630);
 }
 
  if(mC[Ccount]<=200){
    mC[Ccount]=200;
  }
  

  
  if(65<=mouseX&&mouseX<115){
    mCX[Ccount]=65;
  }else if(115<=mouseX&&mouseX<165){
    mCX[Ccount]=115;
  }else if(165<=mouseX&&mouseX<215){
    mCX[Ccount]=165;
  }else if(215<=mouseX&&mouseX<265){
    mCX[Ccount]=215;
  }else if(265<=mouseX&&mouseX<315){
    mCX[Ccount]=265;
  }else if(315<=mouseX&&mouseX<365){
    mCX[Ccount]=315;
  }else if(365<=mouseX&&mouseX<=415){
    mCX[Ccount]=365;
  }
  /*----------------BACKボタン-----------------*/
  if(422<=mouseX&&mouseX<=474&&524<=mouseY&&mouseY<=556){
    if(0<Ccount){
    mC[Ccount]=0;
    mR[Rcount]=0;
    Ccount--;
    Rcount--;    
    }
   }
  /*----------------initボタン---------------*/
  if(422<=mouseX&&mouseX<=474&&567<=mouseY&&mouseY<=599){
    for(int j=0;j<mC.length;j=j+1){
     mC[j]=0;
     mR[j]=0;
    }
  }
  /*--------------colorボタン------------------*/

  saveBarColor[Ccount] = #FF1778;
  if(422<=mouseX&&mouseX<=474&&227<=mouseY&&mouseY<=259){
   
    saveBarColor[Ccount] = barcolor[clk];
   if(clk<=8){
     clk++;
   }else if(clk==9){
     clk = 0;
   }
  }
 }
  if(page==1){
    if(430<=mouseX&&mouseX<=470&&30<=mouseY&&mouseY<=70){
     change = 0;
    }
  }
}




void mouseReleased(){
 if(page==0){
  if(mC[Ccount]>0){
   if(65<=mouseX&&mouseX<=415&&200<=mouseY&&mouseY<608){
    Rcount++;   
    mR[Rcount] = mouseY;
   }else if(!(422<=mouseX&&mouseX<=474&&524<=mouseY&&mouseY<=556)&&!(422<=mouseX&&mouseX<=474&&567<=mouseY&&mouseY<=599)&&!(422<=mouseX&&mouseX<=474&&227<=mouseY&&mouseY<=259)){
     Rcount++;
     mR[Rcount]=0;
   }else if(608<=mouseY){
     Rcount++;
     mR[Rcount] = 608;
   }
  }
  
 }
}

int t=0;
void mouseWheel(MouseEvent event){
  if(page==0){
  if(mCX[Ccount]<=mouseX && mouseX<=mCX[Ccount]+50 && mC[Ccount]<=mouseY && mouseY<=mC[Ccount]+mR[Rcount]){
  float  f  =  event.getAmount();
  println(f);
  
  t=t+int(f);
  saveBarColor[Ccount] = barcolor[clk];
   
     clk=(10000+t)%10;
   }
  }
}