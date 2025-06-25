enum GenderEnum {
  male,
  female,
}

extension GenderExtension on GenderEnum {
  String get name {
    switch (this) {
      case GenderEnum.male:
        return "Male";
      case GenderEnum.female:
        return "Female";
    }
  }

  String get key {
    switch (this) {
      case GenderEnum.male:
        return "male";
      case GenderEnum.female:
        return "female";
    }
  }

  static GenderEnum? fromKey(String? key) {
    for (var gender in GenderEnum.values) {
      if (gender.key == key) return gender;
    }
    return null;
  }
}
