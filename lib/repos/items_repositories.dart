// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:admin_panel/models/item_model.dart';

class ItemsRepository {
  String url = 'http://localhost:8080/';
  Future<List<ItemModel>> getItems() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List result = json.decode(utf8.decode(response.bodyBytes));
        return result.map(((e) => ItemModel.fromJson(e))).toList();
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      return ItemsRepository().getItems();
    }
  }
}

class AddItems {
  String postUrl = 'http://localhost:8080/create';
  String? name;
  String? price;
  String? description;
  String? image;

  AddItems({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });

  addItems() async {
    try {
      return await http.post(Uri.parse(postUrl),
          body: json.encode({
            "image": image,
            "name": name,
            "price": price,
            "description": description,
            "paused": false
          }),
          headers: _setHeaders());
    } catch (e) {
      addItems();
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

class Deleteitems {
  String postUrl = 'http://localhost:8080/delete';
  String id;

  Deleteitems({required this.id});

  deleteItems() async {
    try {
      return await http.post(Uri.parse(postUrl),
          body: json.encode({"id": id}), headers: _setHeaders());
    } catch (e) {
      deleteItems();
    }
  }
}

class Updateitems {
  String postUrl = 'http://localhost:8080/update';
  String id;
  String? name;
  String? price;
  String? description;
  String? image;

  Updateitems(
      {required this.id, this.description, this.image, this.name, this.price});

  updateitems() async {
    try {
      return await http.post(Uri.parse(postUrl),
          body: json.encode({
            "id": id,
            "name": name,
            "price": price,
            "description": description,
            "image": image,
            "paused": false
          }),
          headers: _setHeaders());
    } catch (e) {
      updateitems();
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

_setHeaders() => {
      'Content-type': 'application/json',
      'Aceept': 'application/json',
    };


