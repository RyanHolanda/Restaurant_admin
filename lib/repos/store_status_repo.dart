import 'dart:convert';

import 'package:admin_panel/models/store_status_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class StoreStatusRepositorie {
  String url = 'https://black-beard-burguer-406f0.web.app/storestatus';
  Future<List<StoreStatusModel>> getStoreStatus() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List result = json.decode(utf8.decode(response.bodyBytes));
        return result.map(((e) => StoreStatusModel.fromJson(e))).toList();
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      return StoreStatusRepositorie().getStoreStatus();
    }
  }
}

class UpdateStoreStatus {
  String postUrl =
      'https://black-beard-burguer-406f0.web.app/update/storestatus';
  String id;
  String storestatus;

  UpdateStoreStatus({required this.id, required this.storestatus});

  updateitems() async {
    try {
      return await http.post(Uri.parse(postUrl),
          body: json.encode({
            "id": id,
            "storestatus": storestatus,
          }),
          headers: setHeaders());
    } catch (e) {
      updateitems();
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

setHeaders() => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
