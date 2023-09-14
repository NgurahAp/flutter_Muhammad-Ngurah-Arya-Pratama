# Form Input Button

## Form

- Menerima isian data dari pengguna dan isian dapat lebih dari 
- Cara membuatnya yaitu menggunakan StatefullWidget, Keadaan form disimpan menggunakan GlobalKey<FormState>

```
var formKey = GlobalKey<FormState>();

Form(
  key: formKey,
  child: inputWidgets,
)
```

## Input

### TextField
- Menerima isian data dari pengguna 
- Cara membuatnya yaitu dengan membuat property baru yang berisi TextEditingController();
```
var inputController = TextEditingController();

TextField(
  controller: inputController,
)
```
### Radio
- Memberi opsi kepada pengguna, dan hanya memilih 1 opsi
- Data diambil menggunakan property dengan tipe data sesuai value pada radio
```
var radioValue = '';

Radio<String>(
  value: 'Laki-laki'
  groupValue: radioValue,
  onChanged: (String? value) {
    setState((){
      radioValue = value ?? '';
    });
  },
);
```
### Checkbox
- sama seperti radio, tetapi pengguna dapat memilih beberapa opsi. Data diambil menggunakan property bertipe bool
```
var checkValue = false;

Checkbox(
  value: checkValue,
  onChanged: (bool? value) {
    setState(() {
      checkValue = value false;
    });
  },
);
```



