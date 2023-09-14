# Form Input Button

## Form

- Menerima isian data dari pengguna
- Isian dapat lebih dari 1

### Membuat Form

- Menggunakan StatefullWidget
- Keadaan form disimpan menggunakan GlobalKey<FormState>
  > var formKey = GlobalKey<FormState>();

```
Form(
  key: formKey,
  child: inputWidgets,
)
```
