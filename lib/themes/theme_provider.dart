import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:musicapp/themes/light_mode.dart';

StateProvider themeProvider = StateProvider<ThemeData>((ref) => lightMode);
