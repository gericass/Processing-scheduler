void showcalendar(){
  background(90);  
  int mo = month();
  int d = day();
  int h = hour();
  int m = minute();  
  textSize(70);
  fill(255);
  if(m<=9){
   text(+ h +":0"+ m,width/2,100);
  }else{
   text(+ h +":"+ m,width/2,100);
  }
  textSize(35);
  text(mon[mo-1]+d,width/2,150); 
  
  textSize(20);
  fill(255,255,255,180);
  noStroke();
  rect(0,160,width,height-160);
  
  drawCalender(year(),month(),day());
  image(imgB,430,30,40,40);
}