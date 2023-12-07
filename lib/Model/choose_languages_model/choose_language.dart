//Model of Choose Languages
class ChooseLanguagesModel {
  String flagName;
  String languageName;

  ChooseLanguagesModel({required this.flagName, required this.languageName});
}

List<ChooseLanguagesModel> languageLists = [
  ChooseLanguagesModel(flagName: "gb", languageName: "English"),
  ChooseLanguagesModel(flagName: "cn", languageName: "Chinese"),
  ChooseLanguagesModel(flagName: "nl", languageName: "Dutch"),
  ChooseLanguagesModel(flagName: "ph", languageName: "Filipino"),
  ChooseLanguagesModel(flagName: "fr", languageName: "French"),
  ChooseLanguagesModel(flagName: "ge", languageName: "Georgian"),
  ChooseLanguagesModel(flagName: "de", languageName: "Germany"),
  ChooseLanguagesModel(flagName: "gr", languageName: "Greek"),
  ChooseLanguagesModel(flagName: "id", languageName: "Indonesian"),
  ChooseLanguagesModel(flagName: "it", languageName: "Italian"),
  ChooseLanguagesModel(flagName: "pl", languageName: "Polish"),
  ChooseLanguagesModel(flagName: "ro", languageName: "Romanian"),
  ChooseLanguagesModel(flagName: "sk", languageName: "Slovak"),
  ChooseLanguagesModel(flagName: "es", languageName: "Spanish"),
  ChooseLanguagesModel(flagName: "vn", languageName: "Vietnamese"),
];

