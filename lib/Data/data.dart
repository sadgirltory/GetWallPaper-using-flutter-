

import 'package:wallpaperapp/models/CatatoriesModel.dart';

String apikey = "563492ad6f917000010000019ecf1316a6dd47198e94a65e004d57a4";
List<CategoriesModel> getCatagories(){

  List<CategoriesModel> catagories = new List();
  CategoriesModel categoriesModel = new CategoriesModel();

  categoriesModel.imageUrl = "https://images.pexels.com/photos/2130793/pexels-photo-2130793.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.catagoriesName = "Street Art";
  catagories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imageUrl = "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.catagoriesName = "Wild Life";
  catagories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imageUrl = "https://images.pexels.com/photos/709552/pexels-photo-709552.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.catagoriesName = "Nature ";
  catagories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imageUrl = "https://images.pexels.com/photos/373912/pexels-photo-373912.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.catagoriesName = "City";
  catagories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imageUrl = "https://images.pexels.com/photos/2045600/pexels-photo-2045600.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.catagoriesName = "Motivation";
  catagories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imageUrl = "https://images.pexels.com/photos/296735/pexels-photo-296735.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.catagoriesName = "Bikes";
  catagories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imageUrl = "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.catagoriesName = "Cars";
  catagories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  return catagories;
}