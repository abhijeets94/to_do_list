import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:to_do_list/screens/create_note.dart';
import 'package:to_do_list/screens/homepage.dart';
import 'package:to_do_list/screens/notes.dart';

generateRoutes() => [
      GetPage(
        name: HomePage.routeName,
        page: () => HomePage(),
        transition: Transition.circularReveal,
      ),
      GetPage(
        name: CreateNote.routeName,
        page: () => CreateNote(),
        transition: Transition.circularReveal,
      ),
      GetPage(
        name: Notes.routeName,
        page: () => Notes(),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(
          milliseconds: 300,
        ),
      ),
    ];
