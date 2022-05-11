import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_project/constant/strings.dart';
import 'package:gif_project/controller/cubit/gif_view_cubit.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  List<dynamic> allCategories = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      allCategories =
          BlocProvider.of<HomeCubit>(context).getAllCategories('40');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Categories'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is CategoriesDataLoaded) {
            return ListView.builder(
              itemCount: allCategories.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: (() {
                      Navigator.pushNamed(
                        context,
                        gifViewScreenRoute,
                        arguments: allCategories[index].name.toString(),
                      );
                    }),
                    child: Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(6.0),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(allCategories[index].name),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                            )
                          ],
                        )));
              },
            );
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
