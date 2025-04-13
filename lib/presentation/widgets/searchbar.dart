import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_models/home/home_screen_bloc.dart';
import '../view_models/home/home_screen_event.dart';

class SearchBarWidget extends StatefulWidget {
  final String hintText;
  final IconData? suffixIcon;

  const SearchBarWidget({
    super.key,
    required this.hintText,
    required this.suffixIcon,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    // Unfocused keyboard
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(mounted){
        _focusNode.unfocus();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Do nothing here, just prevent parent listeners
      },
      child: TextField(
        autofocus: false,
        controller: _controller,
        focusNode: _focusNode,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        autocorrect: false,
        enableSuggestions: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey.shade500),
          ),
          prefixIcon: const Icon(
            Icons.search_outlined,
            size: 35,
            color: Colors.grey,
          ),
          suffixIcon: Icon(
            widget.suffixIcon,
            size: 30,
            color: Colors.blueAccent.shade700,
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey.shade200),
        ),
        onChanged: (filterKey) {
          context.read<HomeScreenBloc>().add(SearchItems(filterKey));
        },
        onSubmitted: (value) {
          // Clear focus when submitted
          _focusNode.unfocus();
        },
      ),
    );
  }
}