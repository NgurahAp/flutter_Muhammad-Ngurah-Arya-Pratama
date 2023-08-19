
void main(List<String> args) {
  var input = 5; 
  var faktorial = 1;

  for (var i = input; i > 0; i--) {
    faktorial *= i;
  }

  var hasilFaktorial = faktorial;

  print("Faktorial dari $input adalah $hasilFaktorial");
}

