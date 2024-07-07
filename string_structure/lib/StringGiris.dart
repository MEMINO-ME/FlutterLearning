void main(){
  String str1 = "Merhaba";
  print(str1);

  String str2 = """;
  Nasılsın
  Merhaba
  """;

  print(str2);

  int a = 10;
  int b = 20;

  String str3 = "$a, ${a+b}";
  print(str3);

  String str4 = "Selam";
  String str5 = "Selam";
  if(str4==str5){
    print("$str4 ve $str5 eşittir");
  }else{
    print("$str4 ve $str5 eşittir");
  }
}