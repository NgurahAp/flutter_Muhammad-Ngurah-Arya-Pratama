# Dialog & Bottom Sheet

## Alert Dialog

> Untuk tampilan android, dari material design
> Menginformasikan pengguna tentang situasi tertentu
> Bisa digunakan untuk mendapatkan input dari user
> Membutuhkan helper method showDialog

### Cara Membuat

- Memanggil fungsi showDialog di dalam fungsi onPressed, showDialog membutuhkan context dan builder
- Di buildernya akan me return AlertDialog
- Content bisa dimasukan widget text, gambar dan animasi gambar
- Action bisa ditambahkan button untuk menerima respon dari user.

```
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: const Text('Are you sure?'),
                  actions: [
                    TextButton(
                      onPressed: onPressed,
                      child: const Text('Yes'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('No'),
                    ),
                  ],
                ),
              );
            },

```

## Bottom Sheet

> Seperti dialog tetapi muncul dibawah layar
> Menggunakan fungsi bawaan flutter showModalBottomSheet
> Membutuhkan dua properi yaitu context dan builder

```
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                context: context,
                builder: (context) => const ProfileSheet(),
              );
            },
            icon: const Icon(Icons.account_circle),
          )

```