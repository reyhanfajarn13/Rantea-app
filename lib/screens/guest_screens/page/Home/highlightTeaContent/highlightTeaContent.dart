import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../teaDetailsContent/data/firebase-storage-controller.dart';
import '../teaDetailsContent/homeTeaDetails.dart';
import '../teaDetailsContent/screenTeaDetails.dart';
import 'listTeaContentContainer.dart';

class highlightTeaContent extends StatelessWidget {
  const highlightTeaContent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final FirebaseStorageService storageService = FirebaseStorageService();
    return Row(
      children: [
        const Spacer(),
        Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Jelajah Bubuk Teh",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 0.17,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            listTeaContentContainer(
              content: "Broken Pecko",
              pict: 'lib/images/teh.png',
              nextpage: screenTeaDetails(
                title: 'Broken Pecko',
                description:
                    'Broken Pekoe (BP) merupakan salah satu teh hitam yang mempunyai nilai mutu tertinggi yaitu mutu 1 dari berbagai teh hitam yang diproduksi oleh PTPN VIII Kebun Rancabali. Bubuk teh hitam BP ini menjadi andalan PTPN VIII dalam memenuhi kebutuhan ekspor hingga ke Benua Eropa.',
                mesh: '12/14',
                massaJenis: '245-250 cc/100g',
                tingkatMutu: '1(Satu)',
                jenisPemasaran: 'Ekspor',
                funFact:
                    'Teh hitam BP ini menghasilkan aroma yang kuat, rasa pekat, nikmat dan warna hasil seduhan yang jernih. Teh hitam BP  memiliki beberapa manfaat potensial bagi kesehatan, yaitu menjaga kesehatan jantung, menyokong fungsi otak, mendukung metabolisme dan penurunan berat badan. Akan tetapi, penting untuk diingat dalam mengonsumsi produk-produk seperti teh hitam, jangan lupa untuk konsultasikan dengan profesional kesehatan jika Anda memiliki kekhawatiran spesifik.',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            listTeaContentContainer(
              content: "Pecko Fanning",
              pict: 'lib/images/teh.png',
              nextpage: screenTeaDetails(
                title: 'Pecko Fanning',
                description: ' ',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            listTeaContentContainer(
              content: "Broken Tea",
              pict: 'lib/images/teh.png',
              nextpage: screenTeaDetails(
                title: 'Broken Tea',
                description:
                    'Broken Tea (BT) adalah jenis teh hitam di mana daun-daun teh telah dipecah-pecah menjadi potongan-potongan kecil dan mempunyai tekstur lebih ringan dibanding BOPF dan BP. Teh ini termasuk kedalam golongan mutu 1 dalam kelas teh hitam. Teh hitam BT telah berhasil dijual ke berbagai negara, seperti Inggris, Mesir, dan negara-negara lainnya di Benua Eropa dan Asia.',
                mesh: '12/14',
                massaJenis: '410-420 cc/100g',
                tingkatMutu: '1(Satu)',
                jenisPemasaran: 'Ekspor',
                funFact:
                    'Broken tea teh hitam cenderung memiliki rasa yang kuat dan pekat, serta warna yang gelap, karena luas permukaan yang lebih besar dari potongan-potongan kecil daun teh memungkinkan ekstraksi zat-zat dalam daun teh lebih efisien saat direndam dalam air panas. Ini membuatnya menjadi pilihan yang populer untuk diseduh dalam teh celup dan teh kantong. Teh hitam broken juga sering digunakan dalam campuran teh untuk menciptakan profil rasa yang khas.',
              ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => homeTeaDetails()),
                );
              },
              child: Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Lihat Semua",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF56A37E),
                      letterSpacing: 0.17,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: Color(0xFF56A37E),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            listTeaContentContainer(
              content: "Broken Orange Pecko Fanning",
              pict: 'lib/images/teh.png',
              nextpage: screenTeaDetails(
                title: 'Broken Orange Pecko Fanning',
                description:
                    'Broken Orange Pekoe Fannings (BOPF) adalah bubuk teh hitam yang berasal dari daun muda dan tangkai muda yang tergulung dan pecah. Ukuran partikel lebih kecil daripada BOP. BOPF menjadi salah satu teh hitam yang mempunyai mutu tinggi, yaitu mutu 1 dari berbagai teh hitam yang diproduksi oleh PTPN VIII Kebun Rancabali. Bubuk teh hitam BOPF memenuhi kebutuhan permintaan teh dunia melalui pasar internasional.',
                mesh: '14',
                massaJenis: '330-335 cc/100g',
                tingkatMutu: '1(Satu)',
                jenisPemasaran: 'Ekspor',
                funFact:
                    'Teh dengan grade BOPF cenderung memberikan minuman yang lebih kuat dan beraroma karena permukaan yang lebih besar dari daun teh yang telah dipatahkan menjadi bagian yang lebih kecil. Mereka sering digunakan dalam pembuatan teh celup atau teh kantong.  Seperti halnya teh hitam pada umumnya, Broken Orange Pekoe Fannings juga memiliki potensi manfaat kesehatan yang mencakup kandungan antioksidan, dukungan terhadap kesehatan jantung dan otak, serta kemungkinan perlindungan terhadap risiko beberapa jenis kanker. Namun, efeknya dapat bervariasi tergantung pada cara penyeduhan, kuantitas yang dikonsumsi, dan faktor-faktor lainnya.',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            listTeaContentContainer(
              content: "Dust",
              pict: 'lib/images/teh.png',
              nextpage: screenTeaDetails(
                title: 'Dust',
                description: ' ',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: size.height * 0.13,
              width: size.width * 0.48,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
            )
            // listTeaContentContainer(
            //     content: " ", pict: 'lib/images/teh.png', nextpage: null),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
