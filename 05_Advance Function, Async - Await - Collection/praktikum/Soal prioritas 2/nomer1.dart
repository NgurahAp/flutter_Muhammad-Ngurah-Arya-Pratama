void main() {
  List<List<int>> nilai = [
    [80, 90],
    [50, 60]
  ];

  Map<String, List<int>> nilaiMap = {'Ngurah': nilai[0], 'Arya': nilai[1]};

  print(nilaiMap['Arya']); 
}
