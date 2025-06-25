enum AuthUserEnum { student, parent, teacher }

extension AuthUserEnumExtension on AuthUserEnum {
  String get key {
    switch (this) {
      case AuthUserEnum.student:
        return 'student';
      case AuthUserEnum.parent:
        return 'parent';
      case AuthUserEnum.teacher:
        return 'teacher';
    }
  }

  String get name {
    switch (this) {
      case AuthUserEnum.student:
        return 'student';
      case AuthUserEnum.parent:
        return 'parent';
      case AuthUserEnum.teacher:
        return 'teacher';
    }
  }

  static AuthUserEnum? fromString(String value) {
    switch (value.toLowerCase()) {
      case 'student':
        return AuthUserEnum.student;
      case 'parent':
        return AuthUserEnum.parent;
      case 'teacher':
        return AuthUserEnum.teacher;
      default:
        return null;
    }
  }
}
