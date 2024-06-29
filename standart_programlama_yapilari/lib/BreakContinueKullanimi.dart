void main(){

  for(int i =0;i<5;i++){
    if(i==3){
      break;
    }

    print("Döngü 1: $i");
  }

  for(int i=0;i<5;i++){
    if(i==3){
      continue;
    }

    print("Döngü 2: $i");
  }

}