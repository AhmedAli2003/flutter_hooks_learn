import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/*
class Example2WithStatefullApproach extends StatefulWidget {
  const Example2WithStatefullApproach({super.key});

  @override
  State<Example2WithStatefullApproach> createState() => _Example2WithStatefullApproachState();
}

class _Example2WithStatefullApproachState extends State<Example2WithStatefullApproach> {
  Timer? timer;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        counter = t.tick;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example 2'),
      ),
      body: Center(
        child: Text(counter.toString()),
      ),
    );
  }
}
*/

// The same code as above with hooks approach

class Example2 extends HookWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);

    // like initState, useEffect will be performed once
    // if one if the keys in the list (second param) changed, then useEffect will run again
    useEffect(() {
      debugPrint('Hello from useEffect'); // will be printed once
      final timer = Timer.periodic(const Duration(seconds: 1), (t) {
        counter.value = t.tick;
      });
      return timer.cancel; // dispose the timer (like dispose above)
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Example 2'),
      ),
      body: Center(
        child: Text(counter.value.toString()),
      ),
    );
  }
}
