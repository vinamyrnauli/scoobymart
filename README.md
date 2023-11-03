## 📖**ASSIGNMENTS PBP**📖
<details>
<summary>📋Assignment 7</summary>

## **DAFTAR ISI**
* [Perbedaan *stateless* dan *stateful widget* dalam Flutter](#a-perbedaan-utama-stateless-dan-stateful-widget-dalam-flutter)
* [Penjelasan *Widget* dan Fungsinya](#b-penjelasan-widget-dan-fungsinya)
* [Implementasi *Checklist*](#c-implementasi-checklist-part-1)
* [BONUS](#d-bonus-part-1)
<hr>


## **A. Perbedaan Utama *stateless* dan *stateful Widget* dalam Konteks Pengembangan Aplikasi Flutter**
| *Stateless Widget* | *Stateful Widget* |
| --- | --- |
| *Widget* statis | *Widget* dinamis |
| Hanya diperbaharui saat diinisialisasi | Berubah secara dinamis|
| Tidak memiliki `setState()`. Hanya akan dirender sekali dan tidak dapat diperbaharui sendiri | Memiliki internal `setState()` dan dapat dirender ulang jika data masukkan berubah |
| Tidak dapat diperbaharui selama *runtime*, kecuali terjadi peristiwa eksternal | Dapat diperbaharui selama *runtime* berdasarkan tindakan pengguna atau perubahan data |
| Contoh: Text, Icon, dan RaisedButton | Contoh: Checkbox, Tombol Radio, dan Slider |

<br>

*Source:*
* https://www.geeksforgeeks.org/difference-between-stateless-and-stateful-widget-in-flutter/
* https://blog.logrocket.com/difference-between-stateless-stateful-widgets-flutter/
<br>

## **B. Penjelasan *Widget* dan Fungsinya**
| Nama *Widget* | Fungsi |
| --- | --- |
| `MyHomePage` | *Stateless widget* untuk mengatur tampilan utama aplikasi |
| `Scaffold` | Untuk kerangka utama dari halaman, yang mencakup `AppBar` dan `Body` |
| `AppBar` | Untuk menampilkan bilah atas pada halaman, yaitu `ScoobyMart` |
| `SingleChildScrollView` | Untuk membuat area konten yang dapat digulir jika konten melebihi ukuran layar |
| `Padding` | Untuk menambahkan jarak di sekitar *widget-child* |
| `Column` | Untuk mengatur *widget-children* secara vertikal |
| `Text` | Untuk menampilkan teks `Welcome to ScoobyMart!` pada tengah halaman |
| `GridView.count` | Untuk membuat tata letak grid dengan jumlah kolom yang tetap |
| `ShopItem` | Kelas yang mendefinisikan item toko yang memiliki nama, ikon, dan warna |
| `ShopCard` | Untuk mewakili *card* yang menampilkan item toko |
| `Material` | Untuk mengatur bahan dasar *card* dengan warna latar belakang yang sesuai |
| `InkWell` | Untuk membuat area responsif terhadap sentuhan (*tap*) |
| `Container` | Untuk mengelola tata letak dan konten dalam *card* |
| `Icon` | Untuk menampilkan ikon dalam kartu |
| `SnackBar` | Untuk menampilkan pesan singkat yang muncul di bawah layar saat item toko diklik |
| `MyApp` | Untuk menginisialisasi dan mengkonfigurasi aplikasi |
| `MaterialApp` | Untuk mengkonfigurasi dan mengatur tema aplikasi, termasuk `title`, `theme`, dan `home` |
| `ColorScheme` | Untuk mengatur palet warna dalam aplikasi |
| `useMaterial3` | Untuk mengaktifkan penggunaan `Material You` |

<br>

*Source:*
* https://www.geeksforgeeks.org/what-is-widgets-in-flutter/
<br>

## **C. Implementasi *Checklist* Part 1**
#### Membuat Proyek Flutter Baru
1. Pertama kali, saya membuat folder dengan nama `scoobymart`. 
<br>

2. Kedua, saya *generate* proyek Flutter baru dengan nama `scoobymart`. Lalu, masuk ke dalam direktori proyek seperti berikut.
```bash
flutter create scoobymart
cd scoobymart
```
<br>

3. Ketiga, saya menjalanlan proyek melalui Command Prompt seperti berikut.
```bash
flutter run
```
<br>

4. Selanjutnya, saya juga menjalankan perintah untuk *enable web support* dan menjalankan proyek di aplikasi Google Chrome seperti berikut.
```bash
flutter config --enable-web
flutter run -d chrome
```
<br>

5. Lalu, saya melakukan `git init` pada *root folder* dan `add`, `commit`, `push` proyek ke repositori baru di GitHub dengan nama `scoobymart`.
<br>

#### Merapikan Struktur Proyek
1. Pertama, saya membuat file baru bernama `menu.dart` pada direktori `scoobymart/lib` dan mengimpor kode seperti berikut.
```dart
import 'package:flutter/material.dart';
```
<br>

2. Pada `main.dart`, saya memotong kode baris ke-39 sampai akhir yang berisi *class* seperti berikut. Lalu, saya pindahkan ke `menu.dart`.
```dart
class MyHomePage ... {
    ...
}

class _MyHomePageState ... {
    ...
}
```
<br>

3. Selanjutnya, saya mengimpor suatu kode untuk menghilangkan *error* pada `main.dart` seperti berikut.
```bash
import 'package:scoobymart/menu.dart';
```
<br>

#### Membuat Widget Sederhana pada Flutter
1. Awalnya, saya membuka file `main.dart`. Lalu, mengubah kodenya pada bagian tema aplikasi yang mempunyai tipe `Material Color` seperti berikut.
```dart
colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
```
<br>

2. Kedua, saya menghapus `MyHomePage(title: 'Flutter Demo Home Page')` pada file `main.dart` menjadi seperti berikut.
```dart
MyHomePage()
```
<br>

3. Pada file `menu.dart`, saya mengubah sifat *widget* menjadi *stateless* dengan melakukan perubahan pada `({super.key, required this.title})` menjadi `({Key? key}) : super(key: key);` dan menghapus `final String title;` sampai bawah serta menambahkan *Widget Build* sehingga terlihat seperti berikut.
```dart
class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            ...
        );
    }
}
```
<br>

4. Kemudian, saya menambahkan teks dan *card* serta memulai *define* tipe pada list yang saya punya seperti berikut.
```dart
class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}
```
<br>

5. Lalu, pada bagian bawah kode `MyHomePage({Key? key}) : super(key: key);`, saya menambahkan nama, harga, dan ikon barang seperti berikut.
```dart
final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Colors.pink),
    ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.lightGreen),
    ShopItem("Logout", Icons.logout, Colors.blue),
  ];
```
<br>

6. Kemudian, saya menambahkan kode dalam *widget build* seperti berikut.
```dart
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ScoobyMart',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Welcome to ScoobyMart!', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
``` 
<br>

7. Dikarenakan masih terdapat *error*, saya harus membuat *widget stateless* untuk menampilkan *card* seperti berikut.
```dart
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
<br>

8. Terakhir, saya melakukan `add`, `commit`, `push` pada repositori `scoobymart` di GitHub.
<br>

## **D. BONUS Part 1**
Berikut adalah bukti bahwa saya mengimplementasikan warna-warna yang berbeda untuk setiap tombol (`Lihat Item`, `Tambah Item`, dan `Logout`) seperti berikut.
![BONUS](/img/bonus1.jpg)
</details>
