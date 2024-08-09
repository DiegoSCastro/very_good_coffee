import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('en'));

  void setLocale(Locale locale) => emit(locale);

  void setEnglish() => setLocale(const Locale('en'));
  void setPortuguese() => setLocale(const Locale('pt'));
  void setSpanish() => setLocale(const Locale('es'));
}
