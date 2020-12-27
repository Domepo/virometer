// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


import 'dart:convert';

Welcome welcomeFromJson(String str) =>  Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        this.objectIdFieldName,
        this.uniqueIdField,
        this.globalIdFieldName,
        this.geometryType,
        this.spatialReference,
        this.fields,
        this.features,
    });

    String objectIdFieldName;
    UniqueIdField uniqueIdField;
    String globalIdFieldName;
    String geometryType;
    SpatialReference spatialReference;
    List<Field> fields;
    List<Feature> features;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        objectIdFieldName: json["objectIdFieldName"],
        uniqueIdField: UniqueIdField.fromJson(json["uniqueIdField"]),
        globalIdFieldName: json["globalIdFieldName"],
        geometryType: json["geometryType"],
        spatialReference: SpatialReference.fromJson(json["spatialReference"]),
        fields: List<Field>.from(json["fields"].map((x) => Field.fromJson(x))),
        features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "objectIdFieldName": objectIdFieldName,
        "uniqueIdField": uniqueIdField.toJson(),
        "globalIdFieldName": globalIdFieldName,
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
        this.cases,
        this.deaths,
    });

    int cases;
    int deaths;

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        cases: json["cases"],
        deaths: json["deaths"],
    );

    Map<String, dynamic> toJson() => {
        "cases": cases,
        "deaths": deaths,
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
    });

    String name;
    String type;
    String alias;
    String sqlType;
    dynamic domain;
    dynamic defaultValue;

    factory Field.fromJson(Map<String, dynamic> json) => Field(
        name: json["name"],
        type: json["type"],
        alias: json["alias"],
        sqlType: json["sqlType"],
        domain: json["domain"],
        defaultValue: json["defaultValue"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "alias": alias,
        "sqlType": sqlType,
        "domain": domain,
        "defaultValue": defaultValue,
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
