import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String title;
  const CustomButton({super.key, required this.title});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      width: width * 0.95,
      height: height * 0.06,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 166, 91),
          borderRadius: BorderRadius.circular(8)),
      child: Text(
        widget.title,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
