import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Example3 extends HookWidget {
  const Example3({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);

    // Bad: everytime the counter changes and the ui rebuilds, the fetchData will be called
    // final future = useFuture(fetchData());

    // when the checker value changes, (when the counter is of 10's multipliers)
    // the useMemoized will be called again
    final checker = counter.value ~/ 10;

    final result = useMemoized(() => fetchData(i: checker), [checker]);
    final future = useFuture(result);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Example 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            future.hasData ? Text(future.data!) : const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text(counter.value.toString()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }

  Future<String> fetchData({int i = 1}) async {
    debugPrint('Fetching data...');
    await Future.delayed(const Duration(seconds: 2));
    return 'Hello $i';
  }
}
