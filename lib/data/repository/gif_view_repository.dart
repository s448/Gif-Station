import 'package:gif_project/data/web_service/gif_view_web_services.dart';

class HomeRepository {
  HomeWebServices homeWebServices;
  HomeRepository(this.homeWebServices);

  //for calling the web service to request getting the gifs
  Future<List<dynamic>> getTrendyGifs(String query, String limit) async {
    final allGifs = await homeWebServices.getTrendyGifs(query, limit);
    return allGifs;
  }

  //for calling the web service to request getting the cateories [name,gif url]
  Future<List<dynamic>> getCategories(String limit) async {
    final allCategories = await homeWebServices.getCategories(limit);
    return allCategories;
  }

  Future<List<dynamic>> getGifs(String query) async {
    final allGifs = await homeWebServices.searchForGifsAndStickers(query);
    return allGifs;
  }
}
