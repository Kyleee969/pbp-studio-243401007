import 'package:flutter/material.dart';

void main() {
  runApp(const GuyubApp());
}

class GuyubApp extends StatelessWidget {
  const GuyubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guyub',
      home: const DaftarKartu(),
    );
  }
}

class DaftarKartu extends StatelessWidget {
  const DaftarKartu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Guyub'), centerTitle: true),
      body: ListView.builder(
        itemCount: daftarKartu.length,
        itemBuilder: (context, index) {
          final item = daftarKartu[index];
          return ListTile(
            title: Text(item.judul),
            subtitle: Text(
              '${item.kunci} · ${item.penanggungJawab ?? 'belum ada penanggung jawab'}',
            ),
            trailing: Text(item.status),
          );
        },
      ),
    );
  }
}


class ItemBacklog {
  const ItemBacklog({
    required this.kunci,
    required this.judul,
    required this.jenis,
    required this.poin,
    required this.status,
    this.penanggungJawab,
  });

  final String kunci;
  final String judul;
  final String jenis;
  final int poin;
  final String status;
  final String? penanggungJawab;
}

const List<ItemBacklog> daftarKartu = [
  ItemBacklog(
    kunci: 'GYB-001',
    judul: 'Halaman menu roti',
    jenis: 'story',
    poin: 5,
    status: 'Done',
    penanggungJawab: 'Sekar',
  ),
  ItemBacklog(
    kunci: 'GYB-002',
    judul: 'Form pesanan',
    jenis: 'story',
    poin: 5,
    status: 'Review',
    penanggungJawab: 'Bayu',
  ),
  ItemBacklog(
    kunci: 'GYB-003',
    judul: 'Tombol pesan tidak aktif di Safari',
    jenis: 'bug',
    poin: 2,
    status: 'In Progress',
    penanggungJawab: 'Dimas',
  ),
  ItemBacklog(
    kunci: 'GYB-004',
    judul: 'Ongkir dihitung per kecamatan',
    jenis: 'story',
    poin: 3,
    status: 'To Do',
    penanggungJawab: 'Bayu',
  ),
  ItemBacklog(
    kunci: 'GYB-005',
    judul: 'Foto produk lambat dimuat',
    jenis: 'bug',
    poin: 2,
    status: 'To Do',
  ),
];

