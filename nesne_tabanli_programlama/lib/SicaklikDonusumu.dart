void main(){

var derece = Sicaklik();
String fahrenheit = derece.donusum(35);
print(fahrenheit);

}

class Sicaklik{
  String donusum(double celsius){
    return ("Fahrenheit karşılığı: ${(celsius*1.8)+32}");
}
}