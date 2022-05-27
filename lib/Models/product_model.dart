import 'package:equatable/equatable.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Product extends Equatable {
  final int I_idx;
  final String NVC_prdName;
  final String NVC_ImgName;
  final int I_discountPrice;

  const Product({
    required this.I_idx,
    required this.NVC_prdName,
    required this.NVC_ImgName,
    required this.I_discountPrice,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        I_idx,
        NVC_prdName,
        NVC_ImgName,
        I_discountPrice,
      ];

  static Future<List<Product>> getprdlist(int catecode) async {
    var result = await http.get(Uri.parse(
        'https://webapi.superdesk.co.kr/AdminProduct/GetPrdList/?companyidx=' +
            catecode.toString()));
    var result2 = jsonDecode(result.body);

    List<Product> retdata = [];

    for (int i = 0; i < result2.length; i++) {
      Product prdval = Product(I_idx: result2[i]['I_idx'],
        NVC_prdName: result2[i]['NVC_prdName'],
        NVC_ImgName: result2[i]['NVC_ImgName'],
        I_discountPrice: result2[i]['I_discountPrice']);
      retdata.add(prdval);
    }

    return retdata;
  }

  static List<Product> products = [
    Product(
      I_idx: 367326,
      NVC_prdName: '9 in 1 슈퍼 미니 다기능 멀티..',
      NVC_ImgName: 'https://webapi.superdesk.co.kr/Content/Prd/PrdOrigin/P000383887.jpg',
      I_discountPrice: 24000,
    ),
    Product(
      I_idx: 362160,
      NVC_prdName: '3D 남자 여자 누드 토르소 실리콘..',
      NVC_ImgName: 'https://webapi.superdesk.co.kr/Content/Prd/PrdOrigin/P000378336.jpg',
      I_discountPrice: 22000,
    ),
    Product(
      I_idx: 362159,
      NVC_prdName: '샤이닝 잭 니콜슨 두상 조각 책장 ..',
      NVC_ImgName: 'https://webapi.superdesk.co.kr/Content/Prd/PrdOrigin/P000378335.jpg',
      I_discountPrice: 43000,
    ),
    Product(
      I_idx: 353009,
      NVC_prdName: '1/24 수영복 금발 소녀 피규어 ..',
      NVC_ImgName: 'https://webapi.superdesk.co.kr/Content/Prd/PrdOrigin/P000383887.jpg',
      I_discountPrice: 40000,
    ),
    Product(
      I_idx: 353009,
      NVC_prdName: '9 in 1 슈퍼 미니 다기능 멀티..',
      NVC_ImgName: 'https://webapi.superdesk.co.kr/Content/Prd/PrdOrigin/P000368485.jpg',
      I_discountPrice: 24000,
    ),
    Product(
      I_idx: 353008,
      NVC_prdName: '1/10 판타지 여자 흉상 레진 키..',
      NVC_ImgName: 'https://webapi.superdesk.co.kr/Content/Prd/PrdOrigin/P000368484.jpg',
      I_discountPrice: 28000,
    ),
    Product(
      I_idx: 352271,
      NVC_prdName: '야광 테이프 비상출구 안전 경고 보..',
      NVC_ImgName: 'https://webapi.superdesk.co.kr/Content/Prd/PrdOrigin/P000367682.jpg',
      I_discountPrice: 10000,
    ),

  ];
}
