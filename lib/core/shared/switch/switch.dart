import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget{
  final bool value;
  final ValueChanged<bool> onChanged;
  final Icon activeIcon;
  final Icon deActiveIcon;
  final Color activeColor;
  final Color deActiveColor;

  CustomSwitch({
    required this.value,
    required this.onChanged,
    required this.activeIcon,
    required this.deActiveIcon,
    required this.activeColor,
    required this.deActiveColor,
  });

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.onChanged(!widget.value);
      },
      child: AnimatedContainer(
          duration:const Duration(milliseconds: 300),
        width: 75,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: widget.value ? widget.activeColor : widget.deActiveColor,
        ),
        alignment: widget.value ? Alignment.centerRight : Alignment.centerLeft,
        padding: const EdgeInsets.all(5),
        child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
          child: widget.value ? widget.activeIcon : widget.deActiveIcon,
        ),
      ),
    );
  }
}