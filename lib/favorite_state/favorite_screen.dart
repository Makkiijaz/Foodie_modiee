import 'package:flutter/material.dart';
import 'package:food_app/favorite_state/favorite_list.dart';
import 'package:food_app/favorite_state/favorite_provider.dart';
import 'package:food_app/theme_changer/theme_changer_provider.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<int> selectedRes = [];
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF97F35),
        title: const Center(
          child: Text('FavoriteList'),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10))),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoriteItems(),
                  ));
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Consumer<FavoriteProvider>(
                builder: (context, value, child) {
                  return ListTile(
                      onTap: () {
                        if (value.selectedRes.contains(index)) {
                          value.RemoveItem(index);
                        } else {
                          value.SelectedRest(index);
                        }
                      },
                      title: Text('Item$index'),
                      trailing: value.selectedRes.contains(index)
                          ? const Icon(
                              Icons.favorite,
                              color: Color(0xffF97F35),
                            )
                          : const Icon(
                              Icons.favorite_outline_rounded,
                              color: Color(0xffF97F35),
                            ));
                },
              );
            },
          )),
        ],
      ),
    );
  }
}
