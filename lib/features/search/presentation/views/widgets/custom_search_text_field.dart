import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    this.onPressed,
    required this.searchController,
  });
  final void Function()? onPressed;
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: 'Search',
        enabledBorder: outLineInputBorder(),
        focusedBorder: outLineInputBorder(),
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 24,
            color: Color(0xF2CECECE),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder outLineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
