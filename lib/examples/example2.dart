import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// This is a stateless widget that uses hooks for state management
class Example2 extends HookWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a TextEditingController using a hook. The controller is reused across rebuilds.
    final controller = useTextEditingController();
    // Create a piece of state to hold the trimmed text. The state is managed by the useState hook.
    final text = useState('');

    // useEffect is used to run side effects, like adding event listeners.
    // It runs when the widget is first built and when dependencies change.
    useEffect(() {
      // Add a listener to the controller to update the text state whenever the text in the TextField changes.
      controller.addListener(() {
        // Update the text state with the trimmed text from the controller.
        text.value = controller.text.trim();
      });

      // Return null as no cleanup is needed in this case. 
      // If we needed to remove the listener, we would return a cleanup function here.
      return null;
    }, [controller]); // Dependency array, ensuring the effect runs only when the controller changes.

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextField widget uses the controller created by the useTextEditingController hook.
            TextField(
              controller: controller,
            ),
            // Display the current value of the text state
            // which updates whenever the text in the TextField changes.
            Text(text.value),
          ],
        ),
      ),
    );
  }
}
