import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, required this.onSubmitted});
  final void Function(String) onSubmitted;
  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      onSubmitted: (value) => {
        if (widget.onSubmitted != null) {widget.onSubmitted(value)}
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(right: 24),
        hintStyle: TextStyle(color: Colors.grey[400]),
        hintText: 'search',
        prefixIcon: const Icon(Icons.search),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
