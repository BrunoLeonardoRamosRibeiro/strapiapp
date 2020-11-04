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

  Future<Either<String, ArtistByUserId>> getArtistByUserId(
      {@required String userId, @required String jwt}) async {
    print('ArtistByUserId');

    ArtistByUserId artistByUserId = ArtistByUserId();

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

        artistByUserId = ArtistByUserId.fromJson(json.decode(response.body));

        List<Artist> followedArtists;
        Iterable listaArtists = json.decode(response.body)['artists'];
        followedArtists = listaArtists.map((model) => Artist.fromJson(model)).toList();
        followedArtists.forEach((element) {
          print('ARTISTA SEGUIDO ===> '+element.name);
        });

        sharedPref.save("followedArtists", followedArtists);

        sharedPref.save("artistByUserId", artistByUserId);
        //sharedPref.save("fanByUserId", fanByUserId);
        return Right(artistByUserId);
      } else {
        artistByUserId = null;
        return Left('Erro ${response.statusCode} artistByUserId ');
      }
    } catch (e) {
      artistByUserId = null;
      return Left('Sem de Conexão');
    }
  }


}