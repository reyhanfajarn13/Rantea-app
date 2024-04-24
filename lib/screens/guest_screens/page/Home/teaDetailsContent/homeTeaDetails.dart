import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../highlightTeaContent/listTeaContentContainer.dart';
import 'screenTeaDetails.dart';
import '../teaDetailsContent/data/firebase-storage-controller.dart';

class homeTeaDetails extends StatelessWidget {
  const homeTeaDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final FirebaseStorageService storageService = FirebaseStorageService();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            Container(
              child: Text(
                "Jelajahi Bubuk Teh",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 24,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Row(
              children: [
                const Spacer(),
                Column(
                  children: [
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
                        description:
                            'Pekoe Fannings (PF) adalah salah satu varietas teh hitam yang memiliki daun yang lebih kecil dari varietas lainnya. Istilah "pekoe" biasanya mengacu pada kualitas tertentu dari daun teh, sementara "fannings" merujuk pada ukuran daun yang sangat kecil. PF merupakan salah satu jenis teh hitam yang masuk kedalam golongan mutu 1 dan menjadi jenis teh hitam yang dikirim ke berbagai negara tujuan ekspor PTPN VIII Kebun Rancabali. Teh hitam PF ini sangat dinikmati oleh masyarakat Asia karena mempunyai rasa yang khas.',
                        mesh: '18',
                        massaJenis: '290-295cc/100g ',
                        tingkatMutu: '1(Satu)',
                        jenisPemasaran: 'Ekspor',
                        funFact:
                            'Teh hitam Pekoe Fannings sering kali menghasilkan minuman yang kuat dan beraroma, karena luas permukaan daun yang lebih kecil memungkinkan cepatnya pelepasan rasa dan aroma saat diseduh. Ini membuatnya menjadi pilihan yang populer untuk teh sarapan dan minuman teh yang kuat lainnya.',
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
                        description:
                            'Dust adalah jenis teh hitam yang mempunyai ukurannya kecil seperti debu. Teh hitam dust termasuk salah satu jenis teh hitam golongan mutu 1. Teh hitam dust menjadi salah satu andalan PTPN dalam memenuhi kebutuhan pasar internasional. Teh ini telah berhasil dijual ke berbagai negara, seperti Jerman, Jepang, Inggris, dan negara-negara lainnya.',
                        mesh: '22-60',
                        massaJenis: '245-255cc/100g',
                        tingkatMutu: '1(Satu)',
                        jenisPemasaran: 'Ekspor',
                        funFact:
                            '"Dust" adalah ukuran daun yang paling kecil dan paling halus. Teh berukuran dust biasanya memiliki waktu perendaman yang lebih pendek daripada daun teh yang lebih besar, dan mereka sering digunakan dalam pembuatan teh celup atau teh kantong. Teh berukuran dust juga sering dijumpai dalam campuran teh sarapan atau teh komersial.',
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
                    //     content: " ",
                    //     pict: 'lib/images/teh.png',
                    //     nextpage: null),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
