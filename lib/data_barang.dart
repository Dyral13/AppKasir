class DataBarang {
  static const Map<String, DetailProduk> daftarHarga = {
    'SS01': const DetailProduk(nama: 'Susu Ultra', harga: '7000'),
    'SS02': const DetailProduk(nama: 'Milku', harga: '3000'),
    'SS03': const DetailProduk(nama: 'Susu Ultra1L', harga: '28000'),
    'SS04': const DetailProduk(nama: 'Bengbeng', harga: '1500'),
    'SS05': const DetailProduk(nama: 'Beras 5kg', harga: '68000'),
  };
}

class DetailProduk {
  final String nama;
  final String harga;

  const DetailProduk({required this.nama, required this.harga});
}

class DataBarang {
  static const Map<String, DetailProduk> daftarHarga = {
    'SS01': const DetailProduk(nama: 'Susu Ultra', harga: '7000'),
    'SS02': const DetailProduk(nama: 'Milku', harga: '3000'),
    'SS03': const DetailProduk(nama: 'Susu Ultra1L', harga: '28000'),
    'SS04': const DetailProduk(nama: 'Bengbeng', harga: '1500'),
    'SS05': const DetailProduk(nama: 'Beras 5kg', harga: '68000'),
  };
}

class DetailProduk {
  final String nama;
  final String harga;

  const DetailProduk({required this.nama, required this.harga});
}

// CETAKAN BARU UNTUK KERANJANG
class DetailPesanan {
  final String nama;
  final int harga;
  final int qty;
  final int subtotal;

  DetailPesanan({
    required this.nama,
    required this.harga,
    required this.qty,
    required this.subtotal,
  });
}
