# Advance Form Input

## Interractive Widgets

> Interaksi antara aplikasi dan user.
> Mengumpulkan input dan feedback dari user.

### Date Picker

- Widget dimana user bisa memasukan tanggal
- Menggunakan fungsi bawaan flutter showDatePicker yang memiliki tipe data future
  **- Cara membuat:**

1. Menambahkan packages intl di file pubspec.yaml
2. Mempersiapkan variabel

```
DateTime _dueDate = DateTime.now();
final currentDate = DateTime.now();
```

3. Membangun UI

```
 Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
              onPressed: ()  {

              },
              child: const Text('Select'),
            )
          ],
        ),
        Text(
          DateFormat('dd-MM-yyyy').format(_dueDate),
        )
      ],
    );
  }
```

4. Menambah fungsi showDatePicker di dalam onPressed

```
onPressed: () async {
  final selectDate = await showDatePicker(
    context: context,
    initialDate: currentDate,
    firstDate: DateTime(1990),
    lastDate: DateTime(currentDate.year + 5),
  );
  setState(() {
    if (selectDate != null) {
      _dueDate = selectDate
    }
  })
}
```

4. Saat select button di tekan akan muncul dialog date picker dan tanggal yang ada di UI akan berubah sesuai dengan tanggal yang dipilih

### Color Picker

- Digunakan untuk pemilihan warna dan bisa digunakan untuk berbagai macam kondisi
  **- Cara membuat:**

1. Menambah package flutter_collorpicker di pubspec.yaml
2. Mempersiapkan variabel

```
Color _currentColor = Colors.orange;
```

3. Membangun UI

```
widget buildColorPicekr(BuildContext context) {
  return Column(
    crossMainAxisAligment: CrossAxisAligment.start,
    children: [
      const Text('Color'),
      const SizedBox(height: 10),
      Container(
        height: 100,
        width: double.infinity,
        color: _currentColor,
      ),
      const SizedBox(height: 10),
      Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_currentColor),
          ),
          child: const Text('Pick Color),
          onPressed: () {},
        ),
      ),
    ] ,
  );
}
```

4. Menambah fungsi dialog showDialog di dalam onPressed dengan return widget alertDialog

```
onPressed: () {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Pick your color'),
        content: BlockPicker(
          pickerColor: _currentColor,
          onColorChanged: (color) {
            setState(() {
              _currentColor = color;
            });
          },
        ),
        action: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
},
```

5. Packages flutter_colorpicker memiliki costum widget yang dapat digunakan seperti BlockPicker, ColorPicker, dan SlidePicker

### File Picker

- Kemampuan widget untuk mengakses storage.
- Memilih dan membuka file.
**- Cara membuat:**
1. Menambahkan packages file_picker dan open_file di pubspec.yaml
2. Melakukan import packages dari kedua file tersebut
3. Membangun UI
```
Widget buildFilePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Pick Files'),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Pick and open'),
          ),
        )
      ],
    );
  }
```
4. Membuat fungsi untuk mengexplore dan memilih files dari storage. Dan memanggil file dari object result
```
  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
  }
```
5. Memanggil fungsi diatas ke dalam onPressed
```
onPressed: () {
  _pickFile();
 },
```
6. Membuat fungsi untuk membuka files yang telah dipilih
```
void _openFile(PlatformFile file) {
  OpenFile.open(file.path);
}
```
7. Ketika button ditekan maka akan membuka storage device dan file yang diilih akan terbuka.