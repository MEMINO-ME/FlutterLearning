void main(){

var ucret = Internet();
int fatura = ucret.ucretHesapla(40);
print("İnternet faturanız: $fatura");

}

class Internet{

  int ucretHesapla(int kota){
    int ucret;
    if(kota<=50){
      ucret = 100;
    }else{
      ucret = 100 + (kota - 50)*4;
    }
    return ucret;
  }

}