void drawCalender(int y, int m, int d){
 int week=zeller(y,m,1); // 「今月」1日の曜日を求める
 int days=getDaysOfMonth(y,m); // 「今月」の日数を求める
 fill(0,255,0); // 年/月を緑で表示
 
 for(int i = 0;i<DayOfWeek.length;i++){
   fill(cor[i]);
   text(DayOfWeek[i],i*((width-10)/7)+30,200);   
 }
 
 
 for(int i=1;i<=days; i++){
  if(i==d){// 「今日」なら青字
  fill(#FFBF00);
 }else{// 「今日」でないなら黒字
  fill(0,0,0);
  if((i+week-1)%7==0){ // 日曜は赤字
  fill(255,0,0);
 }else if((i+week-1)%7==6){
  fill(0,0,255);
 }
}
 String dd=(" "+i);
 dd=dd.substring(dd.length()-2);//文字列を右寄せっぽくする
 text(dd,(i-1+week)%7*((width-10)/7)+30,((i-1+week)/7+2)*((height-5)/9)+100);
 }
}

int zeller(int y, int m, int d){
int h;
if(m<3){
m+=12;
y--;
}
h=(d+(m+1)*26/10+(y%100)+(y%100)/4+y/400-2*y/100)%7;
h-=1;
if(h<0) h+=7;
return h;
}

// うるう年の判別
boolean isLeapYear(int y){
if(y%400==0){
return true;
}else if(y%100==0){
return false;
}else if(y%4==0){
return true;
}
return false;
}

// うるう年を考慮して「今月」の日数を求める
int getDaysOfMonth( int y, int m){
int days=daysOfMonth[m];
if(m==2 && isLeapYear(y)){
days++;
}
return days;
}