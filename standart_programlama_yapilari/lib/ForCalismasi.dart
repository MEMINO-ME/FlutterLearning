void main(){

  //3,4,5
  for(int i=3;i<6;i++){
    print(i);
  }

  //10 ,le 20 arasında 5er

  for(int i=10;i<21;i+=5){
    print(i);
  }

  //20 ile 10 2şer

  for(int i=20;i>9;i-=2){
    print(i);
  }

  //1,2,3

  int sayac = 1;

  while(sayac<4){
    print("While: $sayac");
    sayac+=1;
  }

}