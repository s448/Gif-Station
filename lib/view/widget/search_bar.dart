import 'package:flutter/material.dart';
import 'package:gif_project/constant/colors.dart';
import 'package:gif_project/constant/styles.dart';

class SearchBar extends StatelessWidget {
  final Function(String value) onSubmit;

  const SearchBar({
    Key? key,
    required this.searchController,
    required this.onSubmit,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        controller: searchController,
        cursorColor: primaryColor,
        onFieldSubmitted: onSubmit,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintText: "Search for Gifs..",
            hintStyle: hintStyle,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(25.0),
            ),
            suffixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey.shade400),
      ),
    );
  }
}
