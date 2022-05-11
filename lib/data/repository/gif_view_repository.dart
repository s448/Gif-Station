import 'package:gif_project/data/web_service/gif_view_web_services.dart';

class HomeRepository {
  HomeWebServices homeWebServices;
  HomeRepository(this.homeWebServices);

  //for calling the web service to request getting the gifs
  Future<List<dynamic>> searchForGif(String limit) async {
    final allGifs = await homeWebServices.searchForGif(limit);
    return allGifs;
  }

  //get categories & all categories
  Future<List<dynamic>> getCategories(String query) async {
    final allCategories = await homeWebServices.getCategories(query);
    return allCategories;
  }

  //get the list of the trendy gifs from the http request of web service
  Future<List<dynamic>> getTrendyGifs(String limit) async {
    final allTrendyGifs = await homeWebServices.getTrendyGifs(limit);
    return allTrendyGifs;
  }

  //get Lsit of Stickers from http request of web service
  Future<List<dynamic>> getStickers(String limit) async {
    final allStickers = await homeWebServices.getStickers(limit);
    return allStickers;
  }
}
