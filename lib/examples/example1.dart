import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Stream<String> getStream() => Stream.periodic(
      const Duration(seconds: 1),
      (_) => DateTime.now().toIso8601String(),
    );

class Example1 extends HookWidget {
  const Example1({super.key});

  @override
  Widget build(BuildContext context) {
    final date = useStream(getStream());
    return Scaffold(
      appBar: AppBar(
        title: Text(date.data ?? 'App Bar'),
      ),
    );
  }
}
