# MVVM Architecture
- Merupakan singkatan dari Model-View-ViewModel
- Memisahkan logic dengan tampilan (view) ke dalam viewModel

## Keuntungan
1. Reusability : jika ada beberapa tampilan yang memerlukan alur logic yang sama, mereka bisa menggunakan viewModel yang sama
2. Maintainability : Mudah dirawat karena pekerjaan terkait tampian tidak tertumpuk bersama logic
3. Testability : Pengujian menjadi terpisah antara pengujian tampilan dengan pengujian logic sehingga dapat meningkatkan produktivitas pada pengujian

## Melakukan MVVM

### Struktur Direktori
- Model memiliki 2 bagian, yaitu bentuk data yang akan digunakan dan sumber dari data tersebut
- Tiap screen diletakan dalam sebuah direktori yang di dalamnya terdapat view dan viewModel

#### Model
- Bentuk data yang akan digunakan, dibuat dalam bentuk class
- Data-data yang dimuat, diletakan pada property

#### ViewModel
- Menyimpan data-data dan logic yang diperlukan halaman contactScreen
- Jika widget lain memerlukan logicc yang sama, dapat menggunakan viewModel ini juga