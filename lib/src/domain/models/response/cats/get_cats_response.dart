import 'package:cat_app/src/domain/models/models.dart';

class GetCatsResponse {

  final List<CatEntity> cats;

  GetCatsResponse({
    required this.cats,
  });

  GetCatsResponse.fromList(List<dynamic> list) : cats = list.map((e) => CatEntity.fromMap(e)).toList();

}