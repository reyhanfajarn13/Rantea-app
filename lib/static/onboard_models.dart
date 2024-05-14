class OnboardModels {
  final String logo, image, title, description;

  OnboardModels({
    required this.logo,
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnboardModels> demo_data = [
  OnboardModels(
      logo: 'lib/images/logo_rantea_2.png',
      image: 'lib/images/onboard_1.png',
      title: "Deteksi Mutu Bubuk Daun Teh",
      description:
          "Hi! Aku Rantea, aplikasi yang dapat mendeteksi warna dan partikel dari bubuk teh hitam yang diuji dengan menggunakan kamera smartphone MinTea. Rantea juga sudah didukung oleh teknologi Deep Learning dan sistem penyimpanannya sudah terintegrasi oleh cloud database lho!"),
  OnboardModels(
      logo: 'lib/images/logo_rantea_2.png',
      image: "lib/images/onboard_2.png",
      title: "Kenali Jenis Teh Lebih Dekat",
      description:
          "Aku boleh sebut kamu ManTea? agar kita saling kenal sama seperti mengenal jenis teh. Rantea juga dapat mengenali berbagai jenis teh hitam ortodoks yang telah diolah. Rantea juga menyediakan beberapa artikel bubuk teh hitam."),
  OnboardModels(
      logo: 'lib/images/logo_rantea_2.png',
      image: "lib/images/onboard_3.png",
      title: "Temukan Aroma Yang Tepat Untuk Anda",
      description:
          "Dengan mengenali berbagai jenis teh hitam yang mempunyai kualitas dan khasiat yang khas. Rantea harap ManTea dapat menikmati manfaat dari teh hitam dengan aroma dan kenikmatan yang khas. Tentu sesuai dengan dosis yang dianjurkan ya, ManTea."),
];
