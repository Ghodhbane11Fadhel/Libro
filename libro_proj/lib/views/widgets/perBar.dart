
import 'package:flutter/material.dart';




class perBar extends StatelessWidget with PreferredSizeWidget{

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
              backgroundColor: const Color(0xff3f457b),
              leading: PopupMenuButton(
                  icon: const Icon(Icons.menu),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Column(
                            children: [
                              const Text("username"),
                              Image.asset('images/icons/logolibro.png')
                            ],
                          ),
                        ),
                        PopupMenuItem(
                            child: Row(
                          children: const [
                            Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            Text("Search"),
                          ],
                        )),
                        PopupMenuItem(
                            child: Row(
                          children: const [
                            Icon(Icons.settings, color: Colors.black),
                            Text("Settings")
                          ],
                        )),
                        PopupMenuItem(
                            child: Row(
                          children: const [
                            Icon(Icons.wb_sunny, color: Colors.black),
                            Text("Dark mode")
                          ],
                        )),
                        PopupMenuItem(
                            child: Row(
                          children: const [
                            Icon(Icons.help, color: Colors.black),
                            Text("Help")
                          ],
                        )),
                        PopupMenuItem(
                          onTap: ()=>Navigator.of(context).pop(),
                            child: Row(
                          children: const [
                            Icon(Icons.logout, color: Colors.black),
                            Text("Log out")
                          ],
                        )),
                      ]),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              ],
              title: Text("Libro" , style: TextStyle(fontFamily: 'Pacifico'),)
             );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}