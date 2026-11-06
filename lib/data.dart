// Data UTS PBP. Berkas ini sudah lengkap; tidak perlu diubah.

class Kos {
  final String kode;
  final String nama;
  final String alamat;
  final int harga;
  final String jenis;
  final List<String> fasilitas;
  final int kamarKosong;

  const Kos(
    this.kode,
    this.nama,
    this.alamat,
    this.harga,
    this.jenis,
    this.fasilitas,
    this.kamarKosong,
  );

  // Contoh: 850000 menjadi 'Rp850.000 per bulan'.
  String get hargaTeks {
    final angka = harga.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+$)'),
      (m) => '${m[1]}.',
    );
    return 'Rp$angka per bulan';
  }

  bool get penuh => kamarKosong == 0;
}

const daftarKos = [
  Kos('KOS-01', 'Kos Melati', 'Jl. Kedung Baruk 12', 850000, 'Putri',
      ['WiFi', 'Kamar mandi dalam', 'Dapur bersama'], 2),
  Kos('KOS-02', 'Wisma Rungkut', 'Jl. Rungkut Madya 41', 1200000, 'Putra',
      ['WiFi', 'AC', 'Kamar mandi dalam', 'Parkir motor'], 0),
  Kos('KOS-03', 'Kos Pak Harto', 'Jl. Medokan Ayu 7', 650000, 'Campur',
      ['Parkir motor'], 4),
  Kos('KOS-04', 'Griya Penjaringan', 'Jl. Penjaringan Sari 3', 1500000, 'Putri',
      ['WiFi', 'AC', 'Kamar mandi dalam', 'Laundry'], 1),
  Kos('KOS-05', 'Kos Bu Ning', 'Jl. Kedung Asem 19', 750000, 'Putra',
      ['WiFi', 'Dapur bersama'], 0),
  Kos('KOS-06', 'Pondok Wonorejo', 'Jl. Wonorejo Timur 8', 950000, 'Campur',
      ['WiFi', 'Kamar mandi dalam', 'Parkir mobil'], 3),
];
