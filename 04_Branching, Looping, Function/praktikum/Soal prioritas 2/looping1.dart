import 'dart:io';

void main(List<String> args) {
  int rows = 5;

  for (int i = 1; i <= rows; i++) {
    for (var j = 1; j <= rows - i; j++) {
      stdout.write(" ");
    }

    for (int k = 1; k <= 2 * i - 1; k++) {
      stdout.write("*");
    }
    print(" ");
  }
}
