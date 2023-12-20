import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as htp;
import 'package:wallpaper_flutter_demo4/core/utils/constants.dart';
import 'package:wallpaper_flutter_demo4/core/utils/log.dart';
import 'package:wallpaper_flutter_demo4/features/models/photo_model.dart';

class Apis {
  Future<List<PhotoModel>> getphotos() async {
    try {
      final url = Uri.parse(
        API_URL + API_KEY,
      );
      final res = await compute(apiIsolate, url);
      Log.showLog(res.body);
      final List data = json.decode(res.body);
      return data
          .map((e) => PhotoModel.fromJson(e))
          .toList()
          .cast<PhotoModel>();
    } catch (e) {
      Log.showLog(e.toString());
      return <PhotoModel>[];
    }
  }
}

Future<htp.Response> apiIsolate(Uri url) async {
  final http = htp.Client();

  return http.get(url);
}
