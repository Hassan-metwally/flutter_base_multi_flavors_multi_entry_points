import 'package:flutter/material.dart';

import '../../../../core/core.dart';

enum StroeStatusEnum {
  opened("opened"),
  closed("closed");

  final String? value;
  const StroeStatusEnum(this.value);

  static StroeStatusEnum fromString(String value) {
    switch (value) {
      case "opened":
        return opened;
      case "closed":
        return closed;
      default:
        return closed;
    }
  }

  String get title {
    switch (this) {
      case StroeStatusEnum.opened:
        return appLocalizer.open;
      case StroeStatusEnum.closed:
        return appLocalizer.closed;
    }
  }

  Color get bgColor {
    switch (this) {
      case StroeStatusEnum.opened:
        return AppColors.success50;
      case StroeStatusEnum.closed:
        return AppColors.red50;
    }
  }

  Color get titlColor {
    switch (this) {
      case StroeStatusEnum.opened:
        return AppColors.success500;
      case StroeStatusEnum.closed:
        return AppColors.error;
    }
  }
}
