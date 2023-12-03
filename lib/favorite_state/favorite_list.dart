import 'package:flutter/material.dart';
import 'package:food_app/favorite_state/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoriteItems extends StatefulWidget {
  const FavoriteItems({super.key});

  @override
  State<FavoriteItems> createState() => _FavoriteItemsState();
}

class _FavoriteItemsState extends State<FavoriteItems> {

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF97F35),
        title: const Center(
          child: Text('FavoriteItems'),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10))),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: favoriteProvider.selectedRes.length,
                itemBuilder: (context, index) {
                  return Consumer<FavoriteProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                          onTap: () {
                            if (favoriteProvider.selectedRes.contains(index)) {
                              value.RemoveItem(index);
                            } else {
                              favoriteProvider.SelectedRest(index);
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
              ))
        ],
      ),
    );
  }
}
