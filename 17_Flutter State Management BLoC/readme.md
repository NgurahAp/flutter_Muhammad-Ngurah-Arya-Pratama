# Flutter State Management BLoC
> Singkatan dari Business Logic Component
> Memisahkan antara business logic dengan UI

## Kenapa harus Menggunakan BLOC?
- Simple (Mudah digunakan)
- Powerful (Dapat mempercepat tugas tertentu)
- Testable (Mudah untuk dilakukan pengujian)

## Cara Kerja
1. Menerima event sebagai input
2. Dianalisa dan dikelola di dalam BLoc
3. Menghasilkan State sebagai output

### Stream
- Rangkaian proses secara async
- Actor utama di dalam BLoC

## Latihan BLoC
> Membuat counter app yang bisa menambah dan mengurangi nilai pada layar

1. Tambahkan package flutter_bloc dan equatable
2. Membuat 3 file dart baru yaitu counter_bloc.dart, counter_event.dart, dan counter_state.dart
3. Rambahkan event di counter_event.dart
```
import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}
```
4. Tambahkan state untuk menyimpan nilai counter di counter_state.dart
```
import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int value;
  const CounterState(this.value);

  @override
  List<Object?> get props => [];
}
```
5. Menambahkan logika bisnis di counter_bloc.dart. Gunakan fungsi emit untuk mengirim state terbaru
```
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_form/bloc/counter_event.dart';
import 'package:task_form/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    on<Increment>((event, emit) => emit(CounterState(state.value + 1)));

    on<Decrement>((event, emit) => emit(CounterState(state.value - 1)));
  }
}
```
6. Tambahkan BlocProvider di main.dart
```
class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'roboto'),
        routes: {
          '/': (_) => const ContactScreen(),
          '/galerry': (_) => const GalleryScreen(),
          '/image_view': (_) => const ImageViewerScreen(),
        },
      ),
    );
  }
}
```
7. Buat file screen untuk halaman BLoc
```
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_form/bloc/counter_bloc.dart';
import 'package:task_form/bloc/counter_event.dart';
import 'package:task_form/bloc/counter_state.dart';

class BlocScreen extends StatefulWidget {
  const BlocScreen({super.key});

  @override
  State<BlocScreen> createState() => _BlocScreenState();
}

class _BlocScreenState extends State<BlocScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter BLoC'),
        ),
        body: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${state.value}',
                    style: const TextStyle(fontSize: 50),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(Increment());
                    },
                    child: const Text('Increment'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(Decrement());
                    },
                    child: const Text('Decremenet'),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

```