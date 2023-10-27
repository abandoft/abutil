import 'package:flutter/widgets.dart';

/// Wrap your root App widget in this widget and call [Reboot.begin] to restart your app.
class Reboot extends StatefulWidget {
  final Widget child;

  Reboot({Key? key, required this.child}) : super(key: key);

  @override
  _RebootState createState() => _RebootState();

  static begin(BuildContext context) {
    context.findAncestorStateOfType<_RebootState>()!.rebootApp();
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
    return KeyedSubtree(
      key: _key,
      child: widget.child,
    );
  }
}