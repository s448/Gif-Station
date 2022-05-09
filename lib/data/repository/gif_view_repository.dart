import 'package:gif_project/data/web_service/gif_view_web_services.dart';

class HomeRepository {
  HomeWebServices homeWebServices;
  HomeRepository(this.homeWebServices);

  //for calling the web service to request getting the gifs
  Future<List<dynamic>> getTrendyGifs() async {
    final allGifs = await homeWebServices.getTrendyGifs();
    return allGifs;
  }

  //for calling the web service to request getting the cateories [name,gif url]
  Future<List<dynamic>> getCategories() async {
    final allCategories = await homeWebServices.getCategories();
    return allCategories;
  }
}
