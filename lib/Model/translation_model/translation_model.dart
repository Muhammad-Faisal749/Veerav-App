class TranslationModel {
  final String languageName;
  final String countryName;

  TranslationModel({required this.languageName, required this.countryName});
}

List<TranslationModel> TranslationList = [
  TranslationModel(languageName: "en", countryName: "UK"),
  TranslationModel(languageName: "zh", countryName: "CN"),
  TranslationModel(languageName: "nl", countryName: "NL"),
  TranslationModel(languageName: "fil", countryName: "PH"),
  TranslationModel(languageName: "fr", countryName: "FR"),
  TranslationModel(languageName: "ka", countryName: "GE"),
  TranslationModel(languageName: "de", countryName: "DE"),
  TranslationModel(languageName: "el", countryName: "GR"),
  TranslationModel(languageName: "id", countryName: "ID"),
  TranslationModel(languageName: "it", countryName: "IT"),
  TranslationModel(languageName: "pl", countryName: "PL"),
  TranslationModel(languageName: "ro", countryName: "RO"),
  TranslationModel(languageName: "sk", countryName: "SK"),
  TranslationModel(languageName: "es", countryName: "ES"),
  TranslationModel(languageName: "vi", countryName: "VN"),
];
