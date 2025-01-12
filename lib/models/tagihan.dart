class DataTagihanModel {
  String? rundomid;
  String? realid;
  String? tglBayar;
  String? totalPrice;
  String? pelanggan;
  String? nomor;
  String? sending;
  String? stsTagihan;
  String? tahun;
  String? bulan;
  String? email;
  String? nohpTelp;
  String? produk;
  String? cancel;

  DataTagihanModel(
      {this.rundomid,
      this.realid,
      this.tglBayar,
      this.totalPrice,
      this.pelanggan,
      this.nomor,
      this.sending,
      this.stsTagihan,
      this.tahun,
      this.bulan,
      this.email,
      this.nohpTelp,
      this.produk,
      this.cancel});

  DataTagihanModel.fromJson(Map<String, dynamic> json) {
    rundomid = json['rundomid'];
    realid = json['realid'];
    tglBayar = json['tgl_bayar'];
    totalPrice = json['total_price'];
    pelanggan = json['pelanggan'];
    nomor = json['nomor'];
    sending = json['sending'];
    stsTagihan = json['sts_tagihan'];
    tahun = json['tahun'];
    bulan = json['bulan'];
    email = json['email'];
    nohpTelp = json['nohp_telp'];
    produk = json['produk'];
    cancel = json['cancel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rundomid'] = rundomid;
    data['realid'] = realid;
    data['tgl_bayar'] = tglBayar;
    data['total_price'] = totalPrice;
    data['pelanggan'] = pelanggan;
    data['nomor'] = nomor;
    data['sending'] = sending;
    data['sts_tagihan'] = stsTagihan;
    data['tahun'] = tahun;
    data['bulan'] = bulan;
    data['email'] = email;
    data['nohp_telp'] = nohpTelp;
    data['produk'] = produk;
    data['cancel'] = cancel;
    return data;
  }
}
