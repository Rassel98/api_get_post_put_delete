class UModel {
  UModel({
      this.createdAt, 
      this.name, 
      this.avatar, 
      this.id, 
      this.qualifications,});

  UModel.fromJson(dynamic json) {
    createdAt = json['createdAt'];
    name = json['name'];
    avatar = json['avatar'];
    id = json['id'];
    if (json['qualifications'] != null) {
      qualifications = [];
      json['qualifications'].forEach((v) {
        qualifications?.add(Qualifications.fromJson(v));
      });
    }
  }
  String? createdAt;
  String? name;
  String? avatar;
  String? id;
  List<Qualifications>? qualifications;
UModel copyWith({  String? createdAt,
  String? name,
  String? avatar,
  String? id,
  List<Qualifications>? qualifications,
}) => UModel(  createdAt: createdAt ?? this.createdAt,
  name: name ?? this.name,
  avatar: avatar ?? this.avatar,
  id: id ?? this.id,
  qualifications: qualifications ?? this.qualifications,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = createdAt;
    map['name'] = name;
    map['avatar'] = avatar;
    map['id'] = id;
    if (qualifications != null) {
      map['qualifications'] = qualifications?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Qualifications {
  Qualifications({
      this.degree, 
      this.completionData,});

  Qualifications.fromJson(dynamic json) {
    degree = json['degree'];
    completionData = json['completionData'];
  }
  String? degree;
  String? completionData;
Qualifications copyWith({  String? degree,
  String? completionData,
}) => Qualifications(  degree: degree ?? this.degree,
  completionData: completionData ?? this.completionData,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['degree'] = degree;
    map['completionData'] = completionData;
    return map;
  }

}