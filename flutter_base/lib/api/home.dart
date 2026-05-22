// 封装 api，返回业务所需要的数据结构
import 'package:flutter_base/constants/index.dart';
import 'package:flutter_base/utils/DioRequest.dart';
import 'package:flutter_base/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  return (await dioRequest.get(HttpConstants.BANNER_LIST) as List).map((item) {
    return BannerItem.fromJSON(item as Map<String, dynamic>);
  }).toList();
}

Future<List<CategoryItem>> getCategoryListAPI() async {
  return (await dioRequest.get(HttpConstants.CATEGORY_LIST) as List).map((
    item,
  ) {
    return CategoryItem.fromJSON(item as Map<String, dynamic>);
  }).toList();
}
