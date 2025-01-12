import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:giga_pelanggan/controller/loginController.dart';
import 'package:giga_pelanggan/global/style.dart';
import 'package:giga_pelanggan/models/tagihan.dart';
import 'package:giga_pelanggan/module/tagihan/detail_tagihan_view.dart';
import 'package:giga_pelanggan/shared/currencyFormat.dart';

class TagihanView extends StatefulWidget {
  const TagihanView({super.key});

  @override
  _TagihanViewState createState() => _TagihanViewState();
}

class _TagihanViewState extends State<TagihanView> {
  final dio = Dio();
  List<DataTagihanModel> listTagihan = [];
  String apiUrl =
      "https://rest1.cianjurwifi.com/api/v2/plg/tagihan-byplg/${LoginController.otp}";

  getTagihan() async {
    final response = await dio.post(apiUrl,
        data: ({
          "nomor": LoginController.nomor,
          "otp": LoginController.otp,
        }),
        options: Options(headers: {
          "Authorization": "Bearer ${LoginController.accesstoken}",
        }));

    List data = response.data;

    setState(() {
      listTagihan =
          data.map((item) => DataTagihanModel.fromJson(item)).toList();
      listTagihan
          .sort((a, b) => (a.stsTagihan ?? '').compareTo(b.stsTagihan ?? ''));
    });
  }

  @override
  void initState() {
    getTagihan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GColors.primaryColor,
        title: const Text(
          'List Tagihan',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: listTagihan.length,
                itemBuilder: (context, index) {
                  return getCard(index);
                }),
          )
        ],
      ),
    );
  }

  Widget getCard(index) {
    final tagihan = listTagihan[index];
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailTagihanView(tagihan: tagihan)));
        },
        leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: tagihan.stsTagihan == "sudah dibayar via CS"
                  ? const Color(0xff00b400)
                  : const Color(0xffb40000),
              borderRadius: BorderRadius.circular(60 / 2),
            )),
        title: Text(
          tagihan.pelanggan.toString(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "Tagihan : bulan ${tagihan.bulan.toString()} - ${tagihan.tahun.toString()}"
          "\n"
          "Status : ${tagihan.stsTagihan.toString()}"
          "\n"
          "Total : ${CurrencyFormat.convertToIdr(int.tryParse(tagihan.totalPrice.toString()), 2)}",
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
