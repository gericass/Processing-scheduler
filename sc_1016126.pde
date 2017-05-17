PImage img,imgB;
//String []DoW = {"SUN","MON","TUE","WED","THU","FRI","SAT"};
String []mon = {"Jan.","Feb.","Mar.","Apr.","May","Jun.","Jul.","Aug.","Sep.","Oct.","Nov.","Dec."};
int []cor = {#F80C0C,#F0D906,#FF00F3,#00DB12,#FF8205,#4405FF,#B100BE};
int []barcolor ={#FF1778,#C72BE3,#6C10D5,#4999C1,#1EFFF1,#00FF55,#2E8B00,#D2EB2E,#FF7009,#FF0909};
String []DayOfWeek;
String []event;
final int daysOfMonth[]={31,28,31,30,31,30,31,31,30,31,30,31};
int buttonSize_XB;
int buttonSize_YB;
int buttonSize_XI;
int buttonSize_YI;
int buttonSize_XC;
int buttonSize_YC;
int clk = 1;
int page = 0;
int change = 0;

void setup(){
  size(480,640);
  //frameRate(30);
  textAlign(CENTER);
  DayOfWeek = loadStrings("dayofweek.txt");
  img = loadImage("karenda.png");
  imgB = loadImage("back.png");
  background(90);
  event = loadStrings("event.txt");
}

void draw(){
  rectMode(CORNER);
   if(page==0){
     
     
  /*-------------上の時刻と日付--------------*/
  int mo = month();
  int d = day();
  int h = hour();
  int m = minute();  
  textSize(70);
  background(90);
  image(img,430,30,40,40);
  fill(255);
  if(m<=9){
   text(+ h +":0"+ m,width/2+80,100);
  }else{
   text(+ h +":"+ m,width/2+80,100);
  }
  textSize(35);
  text(mon[mo-1]+d,width/2+80,150);  

   

  /*----------------ゲージとグラフ背景--------------------*/
  /*-------------------色のイベント---------------------*/
  textSize(15);
  for(int i=0;i<event.length;i++){
    if(i<=4){
    text(event[i],70,30+i*30);
    }else if(5<=i){
    text(event[i],170,30+i*30);
    }
  }
  
  for(int i = 0;i<=9;i++){
   noStroke();
    fill(barcolor[i]);
    if(i<=4){
    rect(20,17+i*30,15,15);
   }else if(5<=i){
    rect(120,17+(i-5)*30,15,15);
   }
  }
  fill(255,255,255,180);
  rect(25,200,390,408);
  for(int i=0;i<=6;i++){
  noFill();
  stroke(0);
  rect(65+i*50,200,50,408);//縦ゲージの長さ408、幅50
  textSize(18);
  fill(cor[i]);
  text(DayOfWeek[i],90+i*50,190);
  }
  /*-------------左側の水色と横線-----------------*/
  //fill(255,255,255,180);
  //rect(25,200,390,408);
  for(int i=0;i<=23;i=i+1){
    if(i<=11){
    fill(#13E2FD,120);
    stroke(0);
    rect(25,200+i*34,40,34);//2時間置きにrectを配置
    line(65,200+i*34,415,200+i*34);
    stroke(150);
    line(65,217+i*34,414,217+i*34);
    }
    textSize(10);
    if(i!=0 && i%2==0){
    fill(50,130,79);
    text("~"+i+":00",45,200+i*34/2);//24時以外の時刻
    stroke(0);    
    }
  }
   text("~24:00",45,200+24*34/2);//24時
   /*-----------------------伸びるrect---------------------*/

   for(int f=0;f<mC.length;f=f+1){
   if(mR[f]!=0){
     if(mR[f]>=mC[f]&&65<=mCX[f]&&mCX[f]<=415){
     
     colorChange(f);
     
     rect(mCX[f],mC[f],50,mR[f]-mC[f]);
     }     
    }
   }
   if(65<=mCX[Ccount]&&mCX[Ccount]<=415&&65<=mouseX&&mouseX<=415){
   if(mousePressed){
     fill(250,150,9);
     rect(mCX[Ccount],mC[Ccount],50,mouseY-mC[Ccount]);
    }
   }
   /*----------------ボタン----------------------------------*/   
   stroke(255);
   textSize(18);
   fill(255,255,255);   
   noFill();
   rectMode(CENTER);
   /*-------------------------BACKボタン--------*/
   text("back",448,547);
   
    if(mousePressed){
      if(422<=mouseX&&mouseX<=474&&524<=mouseY&&mouseY<=556){
      buttonSize_XB = 46;
      buttonSize_YB = 26;
    }
   }else{
      buttonSize_XB = 52;
      buttonSize_YB = 32;
   }
   rect(448,540,buttonSize_XB,buttonSize_YB);//BACKボタン
   /*---------------------initボタン------------*/
   text("init",448,590);
   
    if(mousePressed){
      if(422<=mouseX&&mouseX<=474&&567<=mouseY&&mouseY<=599){
      buttonSize_XI = 46;
      buttonSize_YI = 26;
    }
   }else{
      buttonSize_XI = 52;
      buttonSize_YI = 32;
   }
   rect(448,583,buttonSize_XI,buttonSize_YI);//initボタン
   /*------------------COLORボタン--------------*/
   text("color",448,250);
   
   if(mousePressed){
      if(422<=mouseX&&mouseX<=474&&227<=mouseY&&mouseY<=259){
      buttonSize_XC = 46;
      buttonSize_YC = 26;
    }
   }else{
      buttonSize_XC = 52;
      buttonSize_YC = 32;
   }
   rect(448,243,buttonSize_XC,buttonSize_YC);//colorボタン
  }
  

  if(page==1){
    showcalendar();
  }
  
  switch(change){
    case 0:
    page = 0;
    break;
    case 1:
    page = 1;
    break;
  }
}