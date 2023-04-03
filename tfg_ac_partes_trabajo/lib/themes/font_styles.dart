import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FontStyles {
  FontStyles(this._color);

  final Color _color;

  TextStyle getOblik32Regular() {
    return TextStyle(
      fontFamily: 'Oblik',
      fontSize: 32,
      fontWeight: FontWeight.w400,
      color: _color,
    );
  }

  TextStyle getOblik32RegularItalic() {
    return TextStyle(
      fontFamily: 'Oblik',
      fontSize: 32,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
      color: _color,
    );
  }

  TextStyle getOblik32Bold() {
    return TextStyle(
      fontFamily: 'Oblik',
      fontSize: 32,
      fontWeight: FontWeight.w900,
      color: _color,
    );
  }

  TextStyle getOblik32BoldItalic() {
    return TextStyle(
      fontFamily: 'Oblik',
      fontSize: 32,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
      color: _color,
    );
  }

  TextStyle getSourceSansPro22Regular() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 22,
      fontWeight: FontWeight.w400,
      color: _color,
    );
  }

  TextStyle getSourceSansPro24Regular() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: _color,
    );
  }

  TextStyle getSourceSansPro28Regular() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 28,
      fontWeight: FontWeight.w400,
      color: _color,
    );
  }

  TextStyle getSourceSansPro24RegularItalic() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 24,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
      color: _color,
    );
  }

  TextStyle getSourceSansPro24SemiBold() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: _color,
    );
  }

  TextStyle getSourceSansPro24Bold() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: _color,
    );
  }

  TextStyle getSourceSansPro24SemiBoldItalic() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,
      color: _color,
    );
  }

  TextStyle getSourceSansPro18Regular() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: _color,
    );
  }

  TextStyle getSourceSansPro18RegularItalic() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 18,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
      color: _color,
    );
  }

  TextStyle getSourceSansPro18SemiBold() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 18,
      overflow: TextOverflow.clip,
      fontWeight: FontWeight.w600,
      color: _color,
    );
  }

  TextStyle getSourceSansPro18SemiBoldItalic() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,
      color: _color,
    );
  }

  TextStyle getSourceSansPro20Regular() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: _color,
    );
  }

  TextStyle getSourceSansPro20RegularItalic() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 20,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
      color: _color,
    );
  }

  TextStyle getSourceSansPro20SemiBold() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 20,
      overflow: TextOverflow.clip,
      fontWeight: FontWeight.w600,
      color: _color,
    );
  }

  TextStyle getSourceSansPro20Bold() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 20,
      overflow: TextOverflow.clip,
      fontWeight: FontWeight.w700,
      color: _color,
    );
  }

  TextStyle getSourceSansPro20SemiBoldItalic() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,
      color: _color,
    );
  }

  TextStyle getSourceSansPro16Regular() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: _color,
    );
  }

  TextStyle getSourceSansPro15Regular() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: _color,
    );
  }

  TextStyle getSourceSansPro16RegularOverflow() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: _color,
      overflow: TextOverflow.ellipsis,
    );
  }

  TextStyle getSourceSansPro16RegularItalic() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
      color: _color,
    );
  }

  TextStyle getSourceSansPro16SemiBold() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: _color,
    );
  }

  TextStyle getSourceSansPro16SemiBoldItalic() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,
      color: _color,
    );
  }

  TextStyle getSourceSansPro14Regular() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: _color,
    );
  }

  TextStyle getSourceSansPro14RegularItalic() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
      color: _color,
    );
  }

  TextStyle getSourceSansPro14SemiBold() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: _color,
    );
  }

  TextStyle getSourceSansPro14SemiBoldUnderLined(bool underline) {
    return TextStyle(
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      fontFamily: 'SourceSansPro',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: _color,
    );
  }

  TextStyle getSourceSansPro14SemiBoldItalic() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,
      color: _color,
    );
  }

  TextStyle getSourceSansPro14Bold() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: _color,
    );
  }

  TextStyle getSourceSansPro16Bold() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: _color,
    );
  }

  TextStyle getSourceSansPro18Bold() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: _color,
    );
  }

  TextStyle getSourceSansPro14BoldItalic() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.italic,
      color: _color,
    );
  }

  TextStyle getSourceSansPro12Regular() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: _color,
    );
  }

  TextStyle getSourceSansPro13Regular() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: _color,
    );
  }

  TextStyle getSourceSansPro12RegularItalic() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.italic,
      color: _color,
    );
  }

  TextStyle getSourceSansPro12SemiBold() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: _color,
    );
  }

  TextStyle getSourceSansPro12Bold() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: _color,
    );
  }

  TextStyle getSourceSansPro12SemiBoldItalic() {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,
      color: _color,
    );
  }

  TextStyle getSourceSansProBold(double size) {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: _color,
    );
  }

  TextStyle getSourceSansProRegular(double size) {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: _color,
    );
  }

  TextStyle getSourceSansProSemiBold(double size) {
    return TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: _color,
    );
  }
}
