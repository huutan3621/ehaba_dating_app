import 'package:flutter/material.dart';

class match_page extends StatefulWidget {
  @override
  _match_pageState createState() => _match_pageState();
}

class _match_pageState extends State<match_page> {
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.green
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: PageController(viewportFraction: 0.8),
        scrollDirection: Axis.vertical,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: AnimatedSwitcher(
              transitionBuilder: (child, animation) {
                return SlideTransition(
                    child: child,
                    position:
                        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
                            .animate(animation));
              },
              duration: Duration(milliseconds: 200),
              child: Dismissible(
                movementDuration: Duration(milliseconds: 1),
                resizeDuration: Duration(milliseconds: 1),
                onDismissed: (direction) {
                  setState(() {
                    colors.remove(colors[index]);
                  });
                },
                key: ValueKey(colors[index]),
                child: Container(
                  width: (200 + index * 75).toDouble(),
                  color: colors[index],
                ),
              ),
            ),
          );
        });
  }
}
