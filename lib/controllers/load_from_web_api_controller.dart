import 'package:either_option/either_option.dart';
import 'package:get/get.dart';
import 'package:strapiapp/shared/constants/app_assets.dart';
import 'package:strapiapp/shared/models/artist_by_user_id.dart';
import 'package:strapiapp/shared/repositories/artist_repository.dart';

class LoadFromWebApiController extends GetxController {
  ArtistRepository artistRepository = ArtistRepository();

  RxBool isLoading = RxBool(false);

  setLoading(bool value) => isLoading.value = value;

  RxString message = RxString("");

  setMessage(String value) => message.value = value;

  RxList<Artist> artistsByUserId = RxList<Artist>();

  Future getAll() async {
    setLoading(true);

    artistsByUserId.clear();

//    Either<String, List<Artist>> resArtists = await artistRepository
//        .getArtistByUserId(userId: AppAssets.USER_ID, jwt: AppAssets.JWT);
//    resArtists.fold((msg) => print(msg), (res) {
//      artistsByUserId.value = res;
//    });

    List<Artist> resArtists = await artistRepository
        .getArtist(userId: AppAssets.USER_ID, jwt: AppAssets.JWT);

      artistsByUserId.value = resArtists;


    setMessage("Carregado!");
    setLoading(false);
  }
}
