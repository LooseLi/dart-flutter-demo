import 'package:flutter_base/constants/index.dart';
import 'package:flutter_base/models/home.dart';
import 'package:flutter_base/utils/DioRequest.dart';

Future<GoodsDetailsItems> getGuessListAPI(Map<String, dynamic> params) async {
  return GoodsDetailsItems.fromJSON(
    await dioRequest.get(HttpConstants.GUESS_LIST, params: params),
  );
}
