import 'dart:io';

void main(List<String> args) {
  int rows = 5;

  for (int i = rows; i >= 1; i--) {
    for (var k = rows - i; k >= 1; k--) {
      stdout.write(' ');
    }
    for (int j = 2 * i - 1; j >= 1; j--) {
      stdout.write('*');
    }
    print(" ");
  }
  for (int i = 2; i <= rows; i++) {
    for (var j = 1; j <= rows - i; j++) {
      stdout.write(" ");
    }

    for (int k = 1; k <= 2 * i - 1; k++) {
      stdout.write("*");
    }
    print(" ");
  }
}
