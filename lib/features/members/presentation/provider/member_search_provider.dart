import 'package:flutter_riverpod/legacy.dart';

final memberSearchProvider = StateProvider<String>((ref) => '');
final isSearchingProvider = StateProvider<bool>((ref) => false);
