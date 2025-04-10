import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskly/splasher.dart';

/// This entry point should be used for production only
void main() async {
  runApp(
    const ProviderScope(child: Splasher()),
  );
}
