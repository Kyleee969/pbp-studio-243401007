
import 'package:flutter/material.dart';

import 'data.dart';

void main() => runApp(const MaterialApp(home: LayarDaftar()));



// Tulis semua kode Anda di berkas ini. Kerjakan langkah U1 sampai U6 di SOAL-UTS-PBP.pdf.
// Kode yang belum jalan jadikan komentar (Cmd + / atau Ctrl + /) supaya aplikasi tetap berjalan.
// 
// Contoh U2, membuka layar baru (hapus tanda // bila dipakai):
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => Scaffold(
//         appBar: AppBar(title: Text(kos.nama)),
//         body: Center(child: Text(kos.alamat)),
//       ),
//     ),
//   );

// Layar daftar. Sudah StatefulWidget, karena di U5 kos yang terpilih disimpan di sini.
class LayarDaftar extends StatefulWidget {
  const LayarDaftar({super.key});

  @override
  State<LayarDaftar> createState() => _LayarDaftarState();
}

class _LayarDaftarState extends State<LayarDaftar> {
  // U5: kos yang tampil di kanan pada layar lebar.
  Kos dipilih = daftarKos.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kos Sekitar Kampus')),

      // U1 dan U5
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Tampilan layar lebar
          if (constraints.maxWidth >= 600) {
            return Row(
              children: [
                SizedBox(
                  width: 320,
                  child: ListView.builder(
                    itemCount: daftarKos.length,
                    itemBuilder: (context, index) {
                      final kos = daftarKos[index];

                      return ListTile(
                        title: Text(kos.nama),
                        subtitle: Text('${kos.jenis} • ${kos.hargaTeks}'),
                        trailing: Text(
                          kos.penuh
                              ? 'Penuh'
                              : '${kos.kamarKosong} kamar',
                        ),
                        onTap: () {
                          setState(() {
                            dipilih = kos;
                          });
                        },
                      );
                    },
                  ),
                ),

                // U5: detail di sebelah kanan
                Expanded(
                  child: DetailKos(
                    key: ValueKey(dipilih.kode),
                    kos: dipilih,
                  ),
                ),
              ],
            );
          }

          // Tampilan layar kecil
          return ListView.builder(
            itemCount: daftarKos.length,
            itemBuilder: (context, index) {
              final kos = daftarKos[index];

              return ListTile(
                title: Text(kos.nama),
                subtitle: Text('${kos.jenis} • ${kos.hargaTeks}'),
                trailing: Text(
                  kos.penuh ? 'Penuh' : '${kos.kamarKosong} kamar',
                ),
                onTap: () {
                  // U2: membuka halaman detail
                  Navigator.push(context,MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(title: Text(kos.nama)),
                        body: DetailKos(kos: kos),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

// U3 dan U4. Isi layar detail, tanpa Scaffold. Sudah StatefulWidget, karena tombol survei berubah.
class DetailKos extends StatefulWidget {
  const DetailKos({super.key, required this.kos});

  final Kos kos;

  @override
  State<DetailKos> createState() => _DetailKosState();
}

class _DetailKosState extends State<DetailKos> {
  // U4: status tombol survei.
  bool disurvei = false;

  @override
  Widget build(BuildContext context) {
    // Tulis isi detail di sini. Di dalam class State, kos dibaca dengan widget.kos.

    // U3: menampilkan detail kos
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.kos.nama,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text('Kode: ${widget.kos.kode}'),
          Text('Jenis: ${widget.kos.jenis}'),
          Text('Alamat: ${widget.kos.alamat}'),
          Text('Harga: ${widget.kos.hargaTeks}'),

          Text(
            widget.kos.penuh
                ? 'Kamar penuh'
                : 'Kamar kosong: ${widget.kos.kamarKosong}',
          ),

          const SizedBox(height: 10),

          const Text(
            'Fasilitas:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          // Menampilkan fasilitas satu per satu
          for (final fasilitas in widget.kos.fasilitas)
            Text('• $fasilitas'),

          const SizedBox(height: 20),

          // U4: tombol survei
          ElevatedButton(
            onPressed: widget.kos.penuh
                ? null
                : () {
                    setState(() {
                      disurvei = !disurvei;
                    });
                  },
            child: Text(
              disurvei
                  ? 'Sudah disurvei'
                  : 'Tandai sudah disurvei',
            ),
          ),
        ],
      ),
    );
  }
}
