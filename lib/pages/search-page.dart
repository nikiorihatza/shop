import 'package:animated_background/animated_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  String title = "SEARCH";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: double.infinity,
          height: 45,
          padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
          child: TextField(
            obscureText: true,
            cursorColor: Color.fromARGB(255, 130, 93, 247),
            decoration: InputDecoration(
              labelText: 'Search...',
              fillColor: Colors.white,
              labelStyle:
                  const TextStyle(color: Color.fromARGB(255, 130, 93, 247)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              focusColor: const Color.fromARGB(255, 130, 93, 247),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 130, 93, 247), width: 2.0),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
