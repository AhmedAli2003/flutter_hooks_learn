import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Example1 extends HookWidget {
  const Example1({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Example 1'),
      ),
      body: Center(
        child: Text(counter.value.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
