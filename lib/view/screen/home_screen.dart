import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_project/constant/strings.dart';
import 'package:gif_project/constant/styles.dart';
import 'package:gif_project/controller/cubit/home_controller/home_cubit.dart';
import 'package:gif_project/data/admob_helper/admob_helper.dart';
import 'package:gif_project/view/widget/drawer.dart';
import 'package:gif_project/view/widget/home_button.dart';
import 'package:gif_project/view/widget/search_bar.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //admob integration
  late BannerAd bannerAd;
  bool isBannerAdReady = false;
  AppOpenAd? myAppOpenAd;

  loadAppOpenAd() {
    AppOpenAd.load(
        adUnitId: AdmobHelper.adOpenAppId, //Your ad Id from admob
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(onAdLoaded: (ad) {
          myAppOpenAd = ad;
          myAppOpenAd!.show();
        }, onAdFailedToLoad: (error) {
          if (kDebugMode) {
            print("_______________OPENN APP FAILED TO LOAD ?????");
          }
        }),
        orientation: AppOpenAd.orientationPortrait);
  }

  loadAdBanner() {
    bannerAd = BannerAd(
      adUnitId: AdmobHelper.adBannerId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          if (kDebugMode) {
            print('Failed to load a banner ad: ${err.message}');
          }
          isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    bannerAd.load();
  }

  TextEditingController searchController = TextEditingController();
  List<dynamic> allCategories = [];
  String query = "";
  @override
  void initState() {
    super.initState();
    loadAdBanner();
    loadAppOpenAd();
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
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: Text(
          'Gif Station',
          style: appBarStyle,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 18,
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
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                                    //Capitalizing the name
                                    "${allCategories[index].name[0].toUpperCase()}${allCategories[index].name.substring(1).toLowerCase()}",
                                    style: categoryStyle,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, allCategoriesRoute,
                          arguments: '40');
                    },
                    child: Row(
                      children: [
                        Text(
                          "See all categories",
                          style: seeAllCategoriesButtonStyle,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ],
                    ),
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
              isBannerAdReady
                  ? Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: bannerAd.size.width.toDouble(),
                        height: bannerAd.size.height.toDouble(),
                        child: AdWidget(ad: bannerAd),
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                    ),
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
