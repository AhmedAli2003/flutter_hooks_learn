import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

TextEditingController useMyTextEditingController() => use(const _MyTextEditingControllerHook());

class _MyTextEditingControllerHook extends Hook<TextEditingController> {
  const _MyTextEditingControllerHook();

  @override
  _MyTextEditingControllerHookState createState() => _MyTextEditingControllerHookState();
}

class _MyTextEditingControllerHookState extends HookState<TextEditingController, Hook<TextEditingController>> {
  late final TextEditingController controller;
  @override
  void initHook() {
    super.initHook();
    print('Hello from initHook');
    controller = TextEditingController();
  }

  @override
  TextEditingController build(BuildContext context) {
    print('Hello from Build Hook');
    return controller;
  }

  @override
  void dispose() {
    print('Hello from Dispose Hook');
    controller.dispose();
    super.dispose();
  }
}
