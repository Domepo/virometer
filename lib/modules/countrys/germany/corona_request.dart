// To parse this JSON data, do
//
//     final covidGerStates = covidGerStatesFromJson(jsonString);

import 'dart:convert';

CovidGerStates covidGerStatesFromJson(String str) => CovidGerStates.fromJson(json.decode(str));

String covidGerStatesToJson(CovidGerStates data) => json.encode(data.toJson());

class CovidGerStates {
    CovidGerStates({
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

    factory CovidGerStates.fromJson(Map<String, dynamic> json) => CovidGerStates(
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
        this.county,
    });

    int cases;
    int deaths;
    String county;

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        cases: json["cases"],
        deaths: json["deaths"],
        county: json["county"],
    );

    Map<String, dynamic> toJson() => {
        "cases": cases,
        "deaths": deaths,
        "county": county,
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
    String sqlType;
    dynamic domain;
    dynamic defaultValue;
    int length;

    factory Field.fromJson(Map<String, dynamic> json) => Field(
        name: json["name"],
        type: json["type"],
        alias: json["alias"],
        sqlType: json["sqlType"],
        domain: json["domain"],
        defaultValue: json["defaultValue"],
        length: json["length"] == null ? null : json["length"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "alias": alias,
        "sqlType": sqlType,
        "domain": domain,
        "defaultValue": defaultValue,
        "length": length == null ? null : length,
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
