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
          "Nunc vitae est adipiscing cursus. Semper gravida vestibulum fermentum tristique massa ultrices proin nam gravida. Massa sem et posuere lacus."),
  OnboardModels(
      logo: 'lib/images/logo_rantea_2.png',
      image: "lib/images/onboard_2.png",
      title: "Kenali Jenis Teh Lebih Dekat",
      description:
          "Nunc vitae est adipiscing cursus. Semper gravida vestibulum fermentum tristique massa ultrices proin nam gravida. Massa sem et posuere lacus."),
  OnboardModels(
      logo: 'lib/images/logo_rantea_2.png',
      image: "lib/images/onboard_3.png",
      title: "Temukan Aroma Yang Tepat Untuk Anda",
      description:
          "Nunc vitae est adipiscing cursus. Semper gravida vestibulum fermentum tristique massa ultrices proin nam gravida. Massa sem et posuere lacus."),
];
