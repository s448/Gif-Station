import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_project/constant/styles.dart';
import 'package:gif_project/controller/cubit/gif_view_controller/view_gifs_cubit.dart';
import 'package:gif_project/view/widget/gif_item.dart';

class GifViewScreen extends StatefulWidget {
  const GifViewScreen({Key? key, required this.query}) : super(key: key);
  final String query;
  // final String limit;
  @override
  // ignore: no_logic_in_create_state
  State<GifViewScreen> createState() =>
      // ignore: no_logic_in_create_state
      _GifViewScreenState(
        query: query,
      );
}

class _GifViewScreenState extends State<GifViewScreen> {
  final String query;
  // final String limit;
  List<dynamic> allGifs = [];
  _GifViewScreenState({
    required this.query,
  });
  @override
  void initState() {
    super.initState();
    //now let's initialize the cubit to call our we service
    setState(() {
      allGifs = BlocProvider.of<ViewGifsCubit>(context).getAllGifs(query);
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
          //Capitalizing the app bar text
          "${query[0].toUpperCase()}${query.substring(1).toLowerCase()}",
          style: appBarStyle,
        ),
      ),
      body: BlocBuilder<ViewGifsCubit, ViewGifsState>(
        builder: (context, state) {
          if (state is GifsLoaded) {
            allGifs = (state).gifs;
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
