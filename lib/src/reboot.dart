import 'package:flutter/widgets.dart';

/// Wraps an app subtree and allows rebuilding it with a new key.
class Reboot extends StatefulWidget {
  /// Creates a restartable app subtree.
  const Reboot({super.key, required this.child});

  /// The subtree to rebuild when [begin] or [maybeBegin] is called.
  final Widget child;

  @override
  State<Reboot> createState() => _RebootState();

  /// Rebuilds the nearest [Reboot] subtree above [context].
  static void begin(BuildContext context) {
    final bool restarted = maybeBegin(context);
    if (!restarted) {
      throw FlutterError(
        'Reboot.begin was called with a context that does not contain a Reboot '
        'ancestor. Wrap the root widget with Reboot before calling begin.',
      );
    }
  }

  /// Rebuilds the nearest [Reboot] subtree above [context], if one exists.
  static bool maybeBegin(BuildContext context) {
    final _RebootState? state = context.findAncestorStateOfType<_RebootState>();
    state?.rebootApp();
    return state != null;
  }
}

class _RebootState extends State<Reboot> {
  Key _key = UniqueKey();

  void rebootApp() {
    setState(() {
      _key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(key: _key, child: widget.child);
  }
}
