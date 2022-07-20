import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationBox extends StatelessWidget {
  final String title;
  final Widget child;

  const InformationBox({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 200.0),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24.0,
            ),
          ),
          const Divider(),
          child,
        ],
      ),
    );
  }
}
