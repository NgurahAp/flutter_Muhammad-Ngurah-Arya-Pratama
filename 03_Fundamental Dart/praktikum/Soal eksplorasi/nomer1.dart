String input(String a) {
  List<String> kata = a.split('');
  kata = kata.reversed.toList();
  return kata.join('');
}

void main(List<String> args) {
  String original1 = 'kasurrusak';
  String original2 = 'mobilbalap';

  String reversed = input(original2);
  if (reversed == original2) {
    print('Palindrom');
  } else {
    print('Bukan palindrom');
  }
}
