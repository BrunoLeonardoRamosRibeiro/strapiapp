import 'dart:convert';

import 'package:either_option/either_option.dart';
import 'package:flutter/material.dart';
import 'package:strapiapp/shared/constants/app_assets.dart';
import 'package:strapiapp/shared/models/artist_by_user_id.dart';
import 'package:http/http.dart' as http;
import 'package:strapiapp/shared/services/shared_local_service.dart';

class ArtistRepository {
  ArtistRepository();

  SharedPref sharedPref = SharedPref();

  Future<Either<String, List<Artist>>> getArtistByUserId(
      {@required String userId, @required String jwt}) async {
    print('ArtistByUserId');

    List<Artist> followedArtists;

    try {
      var url = '${AppAssets.BASE_URL}${AppAssets.URL_ARTISTS_BY_USER_ID}$userId';
      var header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $jwt",
      };

      print(url);

      var response = await http.get(url, headers: header);
      print(response.statusCode);

      if (response.statusCode == 200) {

        Iterable listaArtists = json.decode(response.body)['artists'];
        followedArtists = listaArtists.map((model) => Artist.fromJson(model)).toList();

        followedArtists.forEach((element) {
          print('Nome do Artista => ${element.name}');
        });

        sharedPref.save("followedArtists", followedArtists);

        return Right(followedArtists);
      } else {
        followedArtists = null;
        return Left('Erro ${response.statusCode} followedArtists ');
      }
    } catch (e) {
      followedArtists = null;
      return Left('Exceção: $e');
    }
  }

  Future<List<Artist>> getArtist(
      {@required String userId, @required String jwt}) async {
    print('ArtistByUserId');

    List<Artist> followedArtists;

      var url = '${AppAssets.BASE_URL}${AppAssets.URL_ARTISTS_BY_USER_ID}$userId';
      var header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $jwt",
      };

      print(url);

      var response = await http.get(url, headers: header);
      print(response.statusCode);

      if (response.statusCode == 200) {

        Iterable listaArtists = json.decode(response.body)['artists'];
        followedArtists = listaArtists.map((model) => Artist.fromJson(model)).toList();



        followedArtists.forEach((element) {
          print('Nome do Artista => ${element.name}');
        });

        sharedPref.save("followedArtists", followedArtists);

        return followedArtists;
      } else {
        followedArtists = null;
        return followedArtists;
      }
  }


  Future<List<Artist>> fetchFollowedArtistsOffLine() async {
    List<Artist> followedArtists;

    Iterable lista = await sharedPref.read("followedArtists");
    followedArtists = lista.map((model) => Artist.fromJson(model)).toList();

    return followedArtists;
  }


}