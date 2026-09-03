import 'data_barang.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Kasir()));
}

class Kasir extends StatefulWidget {
  @override
  State<Kasir> createState() => _KasirState();
}

class _KasirState extends State<Kasir> {
  //Memegang nama, kode dan harga dari data_barang lalu diberikan di main
  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();
  //menambahkan fungsi dari tombol tambah ke keranjang
  List<DetailPesanan> _barangKeranjang = [];

  void _tambahKeranjang() {
    if (_qtyController.text.isNotEmpty) {
      int HargaBarang = int.parse(_hargaController.text);
      int QtyBarang = int.parse(_qtyController.text);
      int angkaAkhir = QtyBarang * HargaBarang;
      String NamaBarang = _namaController.text;

      setState(() {
        _barangKeranjang.add(
          DetailPesanan(
            nama: NamaBarang,
            harga: HargaBarang,
            qty: QtyBarang,
            subtotal: angkaAkhir,
          ),
        );
      });
    }
  }

  int totalHarga() {
    int total = 0;
    for (DetailPesanan item in _barangKeranjang) {
      total = total + item.subtotal;
    }
    return total;
  }

  void _cekBarang(String kode) {
    if (DataBarang.daftarHarga.containsKey(kode)) {
      setState(() {
        _hargaController.text = DataBarang.daftarHarga[kode]!.harga;
        _namaController.text = DataBarang.daftarHarga[kode]!.nama;
      });
    } else {
      setState(() {
        _hargaController.text = '';
        _namaController.text = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        backgroundColor: Colors.indigo[50],
        leading: Icon(
          Icons.menu,
          size: 30,
          color: const Color.fromARGB(255, 33, 97, 35),
        ),
        title: Text(
          "TRANSAKSI BARU",
          style: TextStyle(
            color: const Color.fromARGB(255, 33, 97, 35),
            fontWeight: FontWeight(900),
          ),
        ),
        actions: [Icon(Icons.more_vert, size: 40)],
      ),

      body: Container(
        padding: EdgeInsets.all(16.0), //membuat jarak dari sisi2 layar
        //Menu untuk menaruh kode barang dan qty
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // membuat rata kiri
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _kodeController,
                    onChanged: (value) {
                      _cekBarang(value);
                    },
                    decoration: InputDecoration(
                      icon: Icon(CupertinoIcons.pencil_circle_fill),
                      labelText: 'Kode Barang:',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 3),
                SizedBox(
                  width: 70,
                  child: TextField(
                    controller: _qtyController,
                    decoration: InputDecoration(
                      labelText: 'qty:',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),

            //colom kebawah
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 200, 245, 205),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //mengendalikan nama produk
                  Text(
                    'Produk: ${_namaController.text}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight(600),
                    ),
                  ),
                  const SizedBox(height: 6), //jarak
                  //Mengendalikan harga
                  Text(
                    'Rp: ${_hargaController.text}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight(600),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              child: ElevatedButton.icon(
                onPressed: _tambahKeranjang,
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Color.fromARGB(255, 33, 97, 35),
                ),
                label: Text(
                  'Tambah ke Keranjang',
                  style: TextStyle(color: Color.fromARGB(255, 33, 97, 35)),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _barangKeranjang.length,
                itemBuilder: (context, index) {
                  final item = _barangKeranjang[index];
                  return ListTile(
                    title: Text(
                      item.nama,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${item.qty} x Rp. ${item.harga}'),
                    trailing: Text('Rp ${item.subtotal}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      //=========================================================
      //Tombol dibawah
      //Tombol dibawah
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // <-- Membuka daftar isi Column
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Mendorong teks ke ujung kiri dan kanan
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Rp ${totalHarga()}', // Memanggil kalkulator[cite: 3]
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ), // <-- Error 1: Kelebihan kurung ')' sudah dihapus di sini
                ],
              ), // <-- Error 2: Widget Row sudah ditutup dengan benar di sini
              //==================================================
              //jarak tombol bayar dengan total harga
              const SizedBox(height: 16),

              //Tombol bayar
              ElevatedButton(
                onPressed: () {}, // Tempat menaruh fungsi bayar nanti[cite: 3]
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text(
                  'Bayar',
                  style: TextStyle(color: Color.fromARGB(255, 33, 97, 35)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//=================================================================
//Revisi
