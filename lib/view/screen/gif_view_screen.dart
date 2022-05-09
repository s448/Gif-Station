import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_project/controller/cubit/gif_view_cubit.dart';
import 'package:gif_project/view/widget/gif_item.dart';

class GifViewScreen extends StatefulWidget {
  const GifViewScreen({Key? key}) : super(key: key);

  @override
  State<GifViewScreen> createState() => _GifViewScreenState();
}

class _GifViewScreenState extends State<GifViewScreen> {
  List<dynamic> allGifs = [];
  @override
  void initState() {
    super.initState();
    //now let's initialize the cubit to call our we service
    setState(() {
      allGifs = BlocProvider.of<HomeCubit>(context).getAllGifs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("title"),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeDataLoaded) {
            allGifs = (state).gifs;
            return GridView.builder(
                itemCount: allGifs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, i) {
                  if (kDebugMode) {
                    print(allGifs[i].images.original.url);
                  }
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
