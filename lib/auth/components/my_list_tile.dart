import 'package:flutter/material.dart';

class MyListTile extends StatefulWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;
  final Color? textColor;

  const MyListTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.textColor, 
  });

  @override
  _MyListTileState createState() => _MyListTileState();
  
}

class _MyListTileState extends State<MyListTile> {
  Color _color = Colors.black;

  @override
  Widget build(BuildContext context) {
    _color = Theme.of(context).colorScheme.inversePrimary;
    
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: InkWell(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
        onTapCancel: () {
          setState(() {
            _color = Colors.black;
          });
        },
        onTapDown: (_) {
          setState(() {
            _color = Colors.grey;
          });
        },
        child: ListTile(
          leading: Icon(
            widget.icon,
            color: _color,
          ),
          title: Text(widget.text,
          style: TextStyle(
              color: widget.textColor ?? Theme.of(context).colorScheme.onSurface, 
            ),
          ),
        ),
      ),
    );
  }
}

