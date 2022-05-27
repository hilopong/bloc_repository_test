import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Models/product_model.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Product>> getprdlist(int catecode) async {

      var result = await http.get(Uri.parse(
          'https://webapi.superdesk.co.kr/AdminProduct/GetPrdList/?companyidx=' +
              catecode.toString()));
      var result2 = jsonDecode(result.body);

      List<Product> retdata = [];

      for (int i = 0; i < result2.length; i++) {
        Product prdval = Product(
            I_idx: result2[i]['I_idx'],
            NVC_prdName: result2[i]['NVC_prdName'],
            NVC_ImgName:
                "https://webapi.superdesk.co.kr/Content/Prd/PrdOrigin/" +
                    result2[i]['NVC_ImgName'],
            I_discountPrice: result2[i]['I_discountPrice']);
        retdata.add(prdval);
      }

      return retdata;
    }

    return FutureBuilder(
      future: getprdlist(36),
      builder: (context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: SizedBox(
                    height: 165,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: ProductCard(product: snapshot.data![index]),
                          );
                        })),
                //ProductCard(product: Product.products[0])
              ),
            ),
          );
        } else {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          );
          // return Center(child: CircularProgressIndicator());
        }
      },
    );

    // return Scaffold(
    //   body: GridView.builder(
    //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 1,
    //         childAspectRatio: 2.4,
    //       ),
    //       itemCount: customprd.length,
    //       itemBuilder: (context,index){
    //         return Center(
    //           child: ProductCard(product: customprd[index]),
    //         );
    //       }
    //   ),
    // );
  }
}
