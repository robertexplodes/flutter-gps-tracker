class Setting {
  static List<Setting> settings = [];

  Function() onChange;
  String name;

  Setting(this.onChange, this.name);
}
