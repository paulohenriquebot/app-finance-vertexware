// lib/utils/app_colors.dart

import 'package:flutter/material.dart';

// Definindo uma paleta de cores com diferentes opacidades para o tom principal
Map<int, Color> _swatchOpacity = {
  50: const Color.fromRGBO(237, 141, 76, .1),
  100: const Color.fromRGBO(237, 141, 76, .2),
  200: const Color.fromRGBO(237, 141, 76, .3),
  300: const Color.fromRGBO(237, 141, 76, .4),
  400: const Color.fromRGBO(237, 141, 76, .5),
  500: const Color.fromRGBO(237, 141, 76, .6),
  600: const Color.fromRGBO(237, 141, 76, .7),
  700: const Color.fromRGBO(237, 141, 76, .8),
  800: const Color.fromRGBO(237, 141, 76, .9),
  900: const Color.fromRGBO(237, 141, 76, 1),
};

abstract class AppColors {
  // Cores principais
  static const Color primary = Color.fromRGBO(237, 141, 76, 1); // Laranja
  static const Color primaryLight = Color(0xFF726AB4); // Roxo claro
  static const Color primaryDark = Color.fromRGBO(255, 255, 255, 1); // Branco
  static const Color primaryText = Colors.white; // Texto principal
  static const Color grey = Color(0XFFF2F2F2); // Cinza claro
  static const Color lightGrey = Color(0XFFFCFCFC); // Cinza muito claro
  static const Color white = Colors.white; // Branco
  static const Color black = Colors.black; // Preto
  static const Color error = Colors.redAccent; // Vermelho de erro
  static const Color hoverActive = Color.fromRGBO(114, 106, 180, 1); // Cor do hover
  static const Color buttonPrimary = Color(0xFFED8D4C); // Cor do botão primário
  static const Color buttonSecondary = Color(0xFF9472FF); // Cor do botão secundário

  // MaterialColor para o tom primário
  static MaterialColor primarySwatchColor = MaterialColor(0xFFED8D4C, _swatchOpacity);
}
