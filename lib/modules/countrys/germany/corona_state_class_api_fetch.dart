// To parse this JSON data, do
//
//     final covidStateGermany = covidStateGermanyFromJson(jsonString);

import 'dart:convert';

CovidStateGermany covidStateGermanyFromJson(String str) => CovidStateGermany.fromJson(json.decode(str));

String covidStateGermanyToJson(CovidStateGermany data) => json.encode(data.toJson());

class CovidStateGermany {
    CovidStateGermany({
        this.objectIdFieldName,
        this.uniqueIdField,
        this.globalIdFieldName,
        this.geometryProperties,
        this.geometryType,
        this.spatialReference,
        this.fields,
        this.features,
    });

    String objectIdFieldName;
    UniqueIdField uniqueIdField;
    String globalIdFieldName;
    GeometryProperties geometryProperties;
    String geometryType;
    SpatialReference spatialReference;
    List<Field> fields;
    List<Feature> features;

    factory CovidStateGermany.fromJson(Map<String, dynamic> json) => CovidStateGermany(
        objectIdFieldName: json["objectIdFieldName"],
        uniqueIdField: UniqueIdField.fromJson(json["uniqueIdField"]),
        globalIdFieldName: json["globalIdFieldName"],
        geometryProperties: GeometryProperties.fromJson(json["geometryProperties"]),
        geometryType: json["geometryType"],
        spatialReference: SpatialReference.fromJson(json["spatialReference"]),
        fields: List<Field>.from(json["fields"].map((x) => Field.fromJson(x))),
        features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "objectIdFieldName": objectIdFieldName,
        "uniqueIdField": uniqueIdField.toJson(),
        "globalIdFieldName": globalIdFieldName,
        "geometryProperties": geometryProperties.toJson(),
        "geometryType": geometryType,
        "spatialReference": spatialReference.toJson(),
        "fields": List<dynamic>.from(fields.map((x) => x.toJson())),
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
    };
}

class Feature {
    Feature({
        this.attributes,
    });

    Attributes attributes;

    factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        attributes: Attributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "attributes": attributes.toJson(),
    };
}

class Attributes {
    Attributes({
        this.objectid1,
        this.lanEwAgs,
        this.lanEwGen,
        this.lanEwBez,
        this.lanEwEwz,
        this.objectid,
        this.fallzahl,
        this.aktualisierung,
        this.agsTxt,
        this.globalId,
        this.faelle100000Ew,
        this.shapeArea,
        this.shapeLength,
        this.death,
        this.cases7BlPer100K,
        this.cases7Bl,
        this.death7Bl,
        this.cases7BlPer100KTxt,
    });

    int objectid1;
    String lanEwAgs;
    String lanEwGen;
    String lanEwBez;
    int lanEwEwz;
    int objectid;
    int fallzahl;
    int aktualisierung;
    String agsTxt;
    String globalId;
    double faelle100000Ew;
    double shapeArea;
    double shapeLength;
    int death;
    double cases7BlPer100K;
    int cases7Bl;
    int death7Bl;
    String cases7BlPer100KTxt;

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        objectid1: json["OBJECTID_1"],
        lanEwAgs: json["LAN_ew_AGS"],
        lanEwGen: json["LAN_ew_GEN"],
        lanEwBez: json["LAN_ew_BEZ"],
        lanEwEwz: json["LAN_ew_EWZ"],
        objectid: json["OBJECTID"],
        fallzahl: json["Fallzahl"],
        aktualisierung: json["Aktualisierung"],
        agsTxt: json["AGS_TXT"],
        globalId: json["GlobalID"],
        faelle100000Ew: json["faelle_100000_EW"].toDouble(),
        shapeArea: json["Shape__Area"].toDouble(),
        shapeLength: json["Shape__Length"].toDouble(),
        death: json["Death"],
        cases7BlPer100K: json["cases7_bl_per_100k"].toDouble(),
        cases7Bl: json["cases7_bl"],
        death7Bl: json["death7_bl"],
        cases7BlPer100KTxt: json["cases7_bl_per_100k_txt"],
    );

    Map<String, dynamic> toJson() => {
        "OBJECTID_1": objectid1,
        "LAN_ew_AGS": lanEwAgs,
        "LAN_ew_GEN": lanEwGen,
        "LAN_ew_BEZ": lanEwBez,
        "LAN_ew_EWZ": lanEwEwz,
        "OBJECTID": objectid,
        "Fallzahl": fallzahl,
        "Aktualisierung": aktualisierung,
        "AGS_TXT": agsTxt,
        "GlobalID": globalId,
        "faelle_100000_EW": faelle100000Ew,
        "Shape__Area": shapeArea,
        "Shape__Length": shapeLength,
        "Death": death,
        "cases7_bl_per_100k": cases7BlPer100K,
        "cases7_bl": cases7Bl,
        "death7_bl": death7Bl,
        "cases7_bl_per_100k_txt": cases7BlPer100KTxt,
    };
}

class Field {
    Field({
        this.name,
        this.type,
        this.alias,
        this.sqlType,
        this.domain,
        this.defaultValue,
        this.length,
    });

    String name;
    String type;
    String alias;
    SqlType sqlType;
    dynamic domain;
    dynamic defaultValue;
    int length;

    factory Field.fromJson(Map<String, dynamic> json) => Field(
        name: json["name"],
        type: json["type"],
        alias: json["alias"],
        sqlType: sqlTypeValues.map[json["sqlType"]],
        domain: json["domain"],
        defaultValue: json["defaultValue"],
        length: json["length"] == null ? null : json["length"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "alias": alias,
        "sqlType": sqlTypeValues.reverse[sqlType],
        "domain": domain,
        "defaultValue": defaultValue,
        "length": length == null ? null : length,
    };
}

enum SqlType { SQL_TYPE_OTHER, SQL_TYPE_DOUBLE }

final sqlTypeValues = EnumValues({
    "sqlTypeDouble": SqlType.SQL_TYPE_DOUBLE,
    "sqlTypeOther": SqlType.SQL_TYPE_OTHER
});

class GeometryProperties {
    GeometryProperties({
        this.shapeAreaFieldName,
        this.shapeLengthFieldName,
        this.units,
    });

    String shapeAreaFieldName;
    String shapeLengthFieldName;
    String units;

    factory GeometryProperties.fromJson(Map<String, dynamic> json) => GeometryProperties(
        shapeAreaFieldName: json["shapeAreaFieldName"],
        shapeLengthFieldName: json["shapeLengthFieldName"],
        units: json["units"],
    );

    Map<String, dynamic> toJson() => {
        "shapeAreaFieldName": shapeAreaFieldName,
        "shapeLengthFieldName": shapeLengthFieldName,
        "units": units,
    };
}

class SpatialReference {
    SpatialReference({
        this.wkid,
        this.latestWkid,
    });

    int wkid;
    int latestWkid;

    factory SpatialReference.fromJson(Map<String, dynamic> json) => SpatialReference(
        wkid: json["wkid"],
        latestWkid: json["latestWkid"],
    );

    Map<String, dynamic> toJson() => {
        "wkid": wkid,
        "latestWkid": latestWkid,
    };
}

class UniqueIdField {
    UniqueIdField({
        this.name,
        this.isSystemMaintained,
    });

    String name;
    bool isSystemMaintained;

    factory UniqueIdField.fromJson(Map<String, dynamic> json) => UniqueIdField(
        name: json["name"],
        isSystemMaintained: json["isSystemMaintained"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "isSystemMaintained": isSystemMaintained,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
