import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

extension<T> on Iterable<T?> {
  Iterable<T> removeNulls() {
    return where((e) => e != null).cast();
  }
}

const url =
    'https://plus.unsplash.com/premium_photo-1691960547773-2393c0559208?q=80&w=1632&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

Future<Image> getImage() {
  return NetworkAssetBundle(
    Uri.parse(url),
  ).load(url).then((data) => data.buffer.asUint8List()).then((data) => Image.memory(data));
}

class Example3 extends HookWidget {
  const Example3({super.key});

  @override
  Widget build(BuildContext context) {
    final futureImage = useMemoized(getImage);

    final image = useMemoized(() => Image.network(url));

    final snapshot = useFuture(futureImage);

    return Column(
      children: [
        snapshot.data,
        const Spacer(),
        image,
      ].removeNulls().toList(),
    );
  }
}
