import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_project/constant/strings.dart';
import 'package:gif_project/constant/styles.dart';
import 'package:gif_project/controller/cubit/home_cubit.dart';
import 'package:gif_project/view/widget/home_button.dart';
import 'package:gif_project/view/widget/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<dynamic> allCategories = [];
  String query = "";
  @override
  void initState() {
    super.initState();
    //getting the categories list
    setState(() {
      allCategories = BlocProvider.of<HomeCubit>(context).getCategories('12');
    });
    //listening for the search bar controller change
    searchController.addListener(() {
      setState(() {
        query = searchController.text;
      });
      if (kDebugMode) {
        print(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gif Station'),
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
              //there is a listener in initState to listen for changes
              // so as no need for onChanged()
              SearchBar(
                searchController: searchController,
                //click submit button to navigate to the view screen with the search query to view
                onSubmit: ((val) => Navigator.pushNamed(
                      context,
                      gifViewScreenRoute,
                      arguments: query,
                    )),
              ),
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
              //the bloc builder of the categories section used to
              //build the first 8 categories
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is CategoriesDataLoaded) {
                    allCategories = (state).categories;
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 6,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: allCategories.length,
                        itemBuilder: (context, index) {
                          //category item
                          return InkWell(
                            onTap: (() => {
                                  Navigator.pushNamed(
                                    context,
                                    gifViewScreenRoute,
                                    arguments:
                                        allCategories[index].name.toString(),
                                  ),
                                }),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0)),
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height / 6,
                              child: GridTile(
                                //gif of every category
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    allCategories[index]
                                        .gif
                                        .images
                                        .original
                                        .webp,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                //the name of every category
                                footer: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15.0),
                                          bottomRight: Radius.circular(15.0))),
                                  padding: const EdgeInsets.all(8.0),
                                  width: double.infinity,
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    allCategories[index].name,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                    //while getting the requist data it show circular progress indicator
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              //to navigate to a screen include all the categories
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
              //the main buttons >>>>

              //trending Gifs section
              HomeButton(
                  index: 0,
                  function: () {
                    Navigator.pushNamed(context, trendyGifsScreenRoute);
                  }),
              //the gifs that you gave a star to return whenever you want
              HomeButton(index: 1, function: () {}),
              //Stickers section
              HomeButton(
                  index: 2,
                  function: () {
                    Navigator.pushNamed(context, stickersScreenRoute);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
