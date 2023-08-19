void main(List<String> args) {
  var input = [7, 5, 3, 5, 2, 1];
  var total = 0;

  for (var i = 0; i < input.length; i++) {
    total += input[i];
  }

  var avg = total / input.length;

  print('Rata-rata dari input $input adalah $avg');
}
