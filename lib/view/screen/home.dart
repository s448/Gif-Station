import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_project/controller/cubit/gif_view_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textController = TextEditingController();
  List<dynamic> allCategories = [];
  @override
  void initState() {
    super.initState();
    //getting the categories list
    setState(() {
      allCategories = BlocProvider.of<HomeCubit>(context).getAllCategories();
    });
    //listening for the search bar controller change
    textController.addListener(() {
      if (kDebugMode) {
        print("Listenning");
      }
    });
    // print(allCategories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('GifStation'),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: AnimSearchBar(
      //         width: MediaQuery.of(context).size.width * 0.90,
      //         rtl: true,
      //         color: primaryColor,
      //         textController: textController,
      //         helpText: 'Search for Gifs & stickers',
      //         onSuffixTap: () {
      //           setState(() {
      //             textController.clear();
      //           });
      //         },
      //       ),
      //     ),
      //   ],
      // ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 75.0,
                height: 75.0,
                child: Image.asset(
                  'assets/icons/logo.png',
                ),
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is CategoriesDataLoaded) {
                    allCategories = (state).categories;
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 98,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: allCategories.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 95,
                            child: GridTile(
                              child: Image.network(
                                allCategories[index].gif.images.original.url,
                                fit: BoxFit.cover,
                              ),
                              footer: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                height: 10,
                                color: Colors.grey,
                                child: Text(allCategories[index].name),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
