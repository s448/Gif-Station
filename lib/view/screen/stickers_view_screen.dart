import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_project/controller/cubit/stickers_view_cubit.dart';
import 'package:gif_project/view/widget/gif_item.dart';

class StickersScreen extends StatefulWidget {
  const StickersScreen({Key? key}) : super(key: key);

  @override
  State<StickersScreen> createState() => _StickersScreenState();
}

class _StickersScreenState extends State<StickersScreen> {
  //empty list to store the returned stickers inside it
  List<dynamic> allStickers = [];

  @override
  void initState() {
    super.initState();
    //now let's initialize the cubit to call our we service
    setState(() {
      allStickers =
          BlocProvider.of<StickersViewCubit>(context).getStickers("10");
    });
  }

  @override
  void dispose() {
    BlocProvider.of<StickersViewCubit>(context).close();
    allStickers.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stickers"),
      ),
      body: BlocBuilder<StickersViewCubit, StickersViewState>(
        builder: (context, state) {
          if (state is StickersLoaded) {
            allStickers = (state).stickers;
            return GridView.builder(
                itemCount: allStickers.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, i) {
                  return GifItem(
                    allGifs: allStickers, //List of Stickers
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
