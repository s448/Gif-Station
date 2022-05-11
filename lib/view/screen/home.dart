import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_project/constant/colors.dart';
import 'package:gif_project/constant/strings.dart';
import 'package:gif_project/data/model/lists_of_data.dart';
import 'package:gif_project/constant/styles.dart';
import 'package:gif_project/controller/cubit/gif_view_cubit.dart';
import 'package:gif_project/data/repository/gif_view_repository.dart';
import 'package:gif_project/data/web_service/gif_view_web_services.dart';
import 'package:gif_project/view/widget/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<dynamic> allCategories = [];
  @override
  void initState() {
    super.initState();
    //getting the categories list
    setState(() {
      allCategories = BlocProvider.of<HomeCubit>(context).getAllCategories('8');
    });
    //listening for the search bar controller change
    searchController.addListener(() {
      if (kDebugMode) {
        print("Listenning");
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    BlocProvider.of<HomeCubit>(context).getAllCategories('8');
    HomeCubit(HomeRepository(HomeWebServices())).close();
    allCategories.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gif Station'),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: AnimSearchBar(
        //       width: MediaQuery.of(context).size.width * 0.90,
        //       rtl: true,
        //       color: primaryColor,
        //       textController: textController,
        //       helpText: 'Search for Gifs & stickers',
        //       onSuffixTap: () {
        //         setState(() {
        //           textController.clear();
        //         });
        //       },
        //     ),
        //   ),
        // ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              SearchBar(searchController: searchController),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Categories",
                    style: boldStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              // BlocBuilder<HomeCubit, HomeState>(
              //   builder: (context, state) {
              //     if (state is CategoriesDataLoaded) {
              //       allCategories = (state).categories;
              //       return SizedBox(
              //         width: MediaQuery.of(context).size.width,
              //         height: MediaQuery.of(context).size.height / 6,
              //         child: ListView.builder(
              //           shrinkWrap: true,
              //           scrollDirection: Axis.horizontal,
              //           itemCount: allCategories.length,
              //           itemBuilder: (context, index) {
              //             //category item
              //             return InkWell(
              //               onTap: (() => {
              //                     print(">>>>>>>>>>>>>>>>>>>" +
              //                         allCategories[index].name.toString()),
              //                     Navigator.pushNamed(
              //                         context, gifViewScreenRoute,
              //                         arguments:
              //                             allCategories[index].name.toString()),
              //                   }),
              //               child: Container(
              //                 padding: const EdgeInsets.all(8.0),
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(15.0)),
              //                 width: MediaQuery.of(context).size.width / 2,
              //                 height: MediaQuery.of(context).size.height / 6,
              //                 child: GridTile(
              //                   child: ClipRRect(
              //                     borderRadius: BorderRadius.circular(15),
              //                     child: Image.network(
              //                       allCategories[index]
              //                           .gif
              //                           .images
              //                           .downsizedSmall
              //                           .mp4,
              //                       fit: BoxFit.cover,
              //                     ),
              //                   ),
              //                   footer: Container(
              //                     decoration: const BoxDecoration(
              //                         color: Colors.black54,
              //                         borderRadius: BorderRadius.only(
              //                             bottomLeft: Radius.circular(15.0),
              //                             bottomRight: Radius.circular(15.0))),
              //                     padding: const EdgeInsets.all(8.0),
              //                     width: double.infinity,
              //                     alignment: Alignment.bottomCenter,
              //                     child: Text(
              //                       allCategories[index].name,
              //                       style: const TextStyle(color: Colors.white),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             );
              //           },
              //         ),
              //       );
              //     } else {
              //       return const Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     }
              //   },
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, allCategoriesRoute,
                          arguments: '40');
                    },
                    child: const Text("see all categories >"),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              for (var i = 0; i < homeButtons.length; i++)
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.pink),
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  padding: const EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Image.asset(homeButtons[i]['image']),
                            const VerticalDivider(
                              thickness: 2.0,
                              indent: 5,
                            ),
                            Text(homeButtons[i]['name'])
                          ],
                        ),
                      ),
                      Text(homeButtons[i]['description'].toString())
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
