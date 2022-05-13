import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_project/constant/styles.dart';
import 'package:gif_project/controller/cubit/trendy_gifs_controller/trendy_gifs_cubit.dart';
import 'package:gif_project/controller/cubit/gif_view_controller/view_gifs_cubit.dart';
import 'package:gif_project/view/widget/gif_item.dart';

class TrendyGifs extends StatefulWidget {
  const TrendyGifs({Key? key}) : super(key: key);
  @override
  State<TrendyGifs> createState() => _TrendyGifsState();
}

class _TrendyGifsState extends State<TrendyGifs> {
  List<dynamic> allGifs = [];

  @override
  void initState() {
    super.initState();
    //now let's initialize the cubit to call our we service
    setState(() {
      allGifs = BlocProvider.of<TrendyGifsCubit>(context).getTrendyGifs("1");
    });
  }

  @override
  void dispose() {
    allGifs.clear();
    BlocProvider.of<ViewGifsCubit>(context).close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trendy Gifs",
          style: appBarStyle,
        ),
      ),
      body: BlocBuilder<TrendyGifsCubit, TrendyGifsState>(
        builder: (context, state) {
          if (state is TrendyGifsLoaded) {
            allGifs = (state).trendyGifs;
            return GridView.builder(
                itemCount: allGifs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, i) {
                  return GifItem(
                    allGifs: allGifs, //List of Gifs
                    i: i, //counter
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
