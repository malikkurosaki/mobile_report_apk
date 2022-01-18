class ModelDashboard {
  List<Penjualan>? penjualan;
  Revenue? revenue;
  Avarage? avarage;
  Compliment? compliment;

  ModelDashboard({penjualan, revenue, avarage, compliment});

  ModelDashboard.fromJson(Map<String, dynamic> json) {
    if (json['penjualan'] != null) {
      penjualan = <Penjualan>[];
      json['penjualan'].forEach((v) {
        penjualan!.add(Penjualan.fromJson(v));
      });
    }
    revenue =
        json['revenue'] != null ? Revenue.fromJson(json['revenue']) : null;
    avarage =
        json['avarage'] != null ?  Avarage.fromJson(json['avarage']) : null;
    compliment = json['compliment'] != null
        ?  Compliment.fromJson(json['compliment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (penjualan != null) {
      data['penjualan'] = penjualan!.map((v) => v.toJson()).toList();
    }
    if (revenue != null) {
      data['revenue'] = revenue!.toJson();
    }
    if (avarage != null) {
      data['avarage'] = avarage!.toJson();
    }
    if (compliment != null) {
      data['compliment'] = compliment!.toJson();
    }
    return data;
  }
}

class Penjualan {
  String? group;
  String? total;
  String? net;
  int? prosentase;

  Penjualan({group, total, net, prosentase});

  Penjualan.fromJson(Map<String, dynamic> json) {
    group = json['group'];
    total = json['total'];
    net = json['net'];
    prosentase = json['prosentase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['group'] = group;
    data['total'] = total;
    data['net'] = net;
    data['prosentase'] = prosentase;
    return data;
  }
}

class Revenue {
  String? gross;
  String? net;
  String? pax;
  int? bill;

  Revenue({gross, net, pax, bill});

  Revenue.fromJson(Map<String, dynamic> json) {
    gross = json['gross'];
    net = json['net'];
    pax = json['pax'];
    bill = json['bill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['gross'] = gross;
    data['net'] = net;
    data['pax'] = pax;
    data['bill'] = bill;
    return data;
  }
}

class Avarage {
  String? net;
  String? gross;

  Avarage({net, gross});

  Avarage.fromJson(Map<String, dynamic> json) {
    net = json['net'];
    gross = json['gross'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['net'] = net;
    data['gross'] = gross;
    return data;
  }
}

class Compliment {
  int? total;
  String? pax;
  int? totalBill;

  Compliment({total, pax, totalBill});

  Compliment.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pax = json['pax'];
    totalBill = json['totalBill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['total'] = total;
    data['pax'] = pax;
    data['totalBill'] = totalBill;
    return data;
  }
}


class ModelOut {
  String? kodeOut;
  String? namaOut;

  ModelOut({kodeOut, namaOut});

  ModelOut.fromJson(Map<String, dynamic> json) {
    kodeOut = json['kode_out'];
    namaOut = json['nama_out'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kode_out'] = kodeOut;
    data['nama_out'] = namaOut;
    return data;
  }
}


class ModelDep {
  String? namaDept;
  String? unitBisnis;

  ModelDep({namaDept, unitBisnis});

  ModelDep.fromJson(Map<String, dynamic> json) {
    namaDept = json['nama_dept'];
    unitBisnis = json['unit_bisnis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama_dept'] = namaDept;
    data['unit_bisnis'] = unitBisnis;
    return data;
  }
}

class ModelDashboardV2 {
  String? name;
  Data? data;

  ModelDashboardV2({this.name, this.data});

  ModelDashboardV2.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Sum? sSum;
  Sum? sAvg;
  Count? cCount;

  Data({this.sSum, this.sAvg, this.cCount});

  Data.fromJson(Map<String, dynamic> json) {
    sSum = json['_sum'] != null ? new Sum.fromJson(json['_sum']) : null;
    sAvg = json['_avg'] != null ? new Sum.fromJson(json['_avg']) : null;
    cCount = json['_count'] != null ? new Count.fromJson(json['_count']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sSum != null) {
      data['_sum'] = this.sSum!.toJson();
    }
    if (this.sAvg != null) {
      data['_avg'] = this.sAvg!.toJson();
    }
    if (this.cCount != null) {
      data['_count'] = this.cCount!.toJson();
    }
    return data;
  }
}

class Sum {
  String? total;
  String? pax;
  String? net;
  String? taxrp;
  String? serrp;
  String? gtotal;
  String? cash;

  Sum(
      {this.total,
      this.pax,
      this.net,
      this.taxrp,
      this.serrp,
      this.gtotal,
      this.cash});

  Sum.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pax = json['pax'];
    net = json['net'];
    taxrp = json['taxrp'];
    serrp = json['serrp'];
    gtotal = json['gtotal'];
    cash = json['cash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['pax'] = this.pax;
    data['net'] = this.net;
    data['taxrp'] = this.taxrp;
    data['serrp'] = this.serrp;
    data['gtotal'] = this.gtotal;
    data['cash'] = this.cash;
    return data;
  }
}

class Count {
  int? total;
  int? pax;
  int? net;
  int? taxrp;
  int? serrp;
  int? gtotal;
  int? cash;

  Count(
      {this.total,
      this.pax,
      this.net,
      this.taxrp,
      this.serrp,
      this.gtotal,
      this.cash});

  Count.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pax = json['pax'];
    net = json['net'];
    taxrp = json['taxrp'];
    serrp = json['serrp'];
    gtotal = json['gtotal'];
    cash = json['cash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['pax'] = this.pax;
    data['net'] = this.net;
    data['taxrp'] = this.taxrp;
    data['serrp'] = this.serrp;
    data['gtotal'] = this.gtotal;
    data['cash'] = this.cash;
    return data;
  }
}

