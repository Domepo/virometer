// To parse this JSON data, do
//
//     final covidGerDistricts = covidGerDistrictsFromJson(jsonString);

import 'dart:convert';

CovidGerDistricts covidGerDistrictsFromJson(String str) => CovidGerDistricts.fromJson(json.decode(str));

String covidGerDistrictsToJson(CovidGerDistricts data) => json.encode(data.toJson());

class CovidGerDistricts {
    CovidGerDistricts({
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

    factory CovidGerDistricts.fromJson(Map<String, dynamic> json) => CovidGerDistricts(
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
        this.objectid,
        this.ade,
        this.gf,
        this.bsg,
        this.rs,
        this.ags,
        this.sdvRs,
        this.gen,
        this.bez,
        this.ibz,
        this.bem,
        this.nbd,
        this.snL,
        this.snR,
        this.snK,
        this.snV1,
        this.snV2,
        this.snG,
        this.fkS3,
        this.nuts,
        this.rs0,
        this.ags0,
        this.wsk,
        this.ewz,
        this.kfl,
        this.debkgId,
        this.shapeArea,
        this.shapeLength,
        this.deathRate,
        this.cases,
        this.deaths,
        this.casesPer100K,
        this.casesPerPopulation,
        this.bl,
        this.blId,
        this.county,
        this.lastUpdate,
        this.cases7Per100K,
        this.recovered,
        this.ewzBl,
        this.cases7BlPer100K,
        this.cases7Bl,
        this.death7Bl,
        this.cases7Lk,
        this.death7Lk,
        this.cases7Per100KTxt,
    });

    int objectid;
    int ade;
    int gf;
    int bsg;
    String rs;
    String ags;
    String sdvRs;
    String gen;
    Bez bez;
    int ibz;
    Bem bem;
    Nbd nbd;
    String snL;
    String snR;
    String snK;
    String snV1;
    String snV2;
    String snG;
    FkS3 fkS3;
    String nuts;
    String rs0;
    String ags0;
    String wsk;
    int ewz;
    double kfl;
    String debkgId;
    double shapeArea;
    double shapeLength;
    double deathRate;
    int cases;
    int deaths;
    double casesPer100K;
    double casesPerPopulation;
    Bl bl;
    String blId;
    String county;
    LastUpdate lastUpdate;
    double cases7Per100K;
    dynamic recovered;
    int ewzBl;
    double cases7BlPer100K;
    int cases7Bl;
    int death7Bl;
    int cases7Lk;
    int death7Lk;
    String cases7Per100KTxt;

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        objectid: json["OBJECTID"],
        ade: json["ADE"] == null ? null : json["ADE"],
        gf: json["GF"] == null ? null : json["GF"],
        bsg: json["BSG"] == null ? null : json["BSG"],
        rs: json["RS"],
        ags: json["AGS"] == null ? null : json["AGS"],
        sdvRs: json["SDV_RS"] == null ? null : json["SDV_RS"],
        gen: json["GEN"],
        bez: bezValues.map[json["BEZ"]],
        ibz: json["IBZ"] == null ? null : json["IBZ"],
        bem: json["BEM"] == null ? null : bemValues.map[json["BEM"]],
        nbd: json["NBD"] == null ? null : nbdValues.map[json["NBD"]],
        snL: json["SN_L"] == null ? null : json["SN_L"],
        snR: json["SN_R"] == null ? null : json["SN_R"],
        snK: json["SN_K"] == null ? null : json["SN_K"],
        snV1: json["SN_V1"] == null ? null : json["SN_V1"],
        snV2: json["SN_V2"] == null ? null : json["SN_V2"],
        snG: json["SN_G"] == null ? null : json["SN_G"],
        fkS3: json["FK_S3"] == null ? null : fkS3Values.map[json["FK_S3"]],
        nuts: json["NUTS"] == null ? null : json["NUTS"],
        rs0: json["RS_0"] == null ? null : json["RS_0"],
        ags0: json["AGS_0"] == null ? null : json["AGS_0"],
        wsk: json["WSK"] == null ? null : json["WSK"],
        ewz: json["EWZ"],
        kfl: json["KFL"] == null ? null : json["KFL"].toDouble(),
        debkgId: json["DEBKG_ID"] == null ? null : json["DEBKG_ID"],
        shapeArea: json["Shape__Area"].toDouble(),
        shapeLength: json["Shape__Length"].toDouble(),
        deathRate: json["death_rate"].toDouble(),
        cases: json["cases"],
        deaths: json["deaths"],
        casesPer100K: json["cases_per_100k"].toDouble(),
        casesPerPopulation: json["cases_per_population"].toDouble(),
        bl: blValues.map[json["BL"]],
        blId: json["BL_ID"],
        county: json["county"],
        lastUpdate: lastUpdateValues.map[json["last_update"]],
        cases7Per100K: json["cases7_per_100k"].toDouble(),
        recovered: json["recovered"],
        ewzBl: json["EWZ_BL"],
        cases7BlPer100K: json["cases7_bl_per_100k"].toDouble(),
        cases7Bl: json["cases7_bl"],
        death7Bl: json["death7_bl"],
        cases7Lk: json["cases7_lk"],
        death7Lk: json["death7_lk"],
        cases7Per100KTxt: json["cases7_per_100k_txt"],
    );

    Map<String, dynamic> toJson() => {
        "OBJECTID": objectid,
        "ADE": ade == null ? null : ade,
        "GF": gf == null ? null : gf,
        "BSG": bsg == null ? null : bsg,
        "RS": rs,
        "AGS": ags == null ? null : ags,
        "SDV_RS": sdvRs == null ? null : sdvRs,
        "GEN": gen,
        "BEZ": bezValues.reverse[bez],
        "IBZ": ibz == null ? null : ibz,
        "BEM": bem == null ? null : bemValues.reverse[bem],
        "NBD": nbd == null ? null : nbdValues.reverse[nbd],
        "SN_L": snL == null ? null : snL,
        "SN_R": snR == null ? null : snR,
        "SN_K": snK == null ? null : snK,
        "SN_V1": snV1 == null ? null : snV1,
        "SN_V2": snV2 == null ? null : snV2,
        "SN_G": snG == null ? null : snG,
        "FK_S3": fkS3 == null ? null : fkS3Values.reverse[fkS3],
        "NUTS": nuts == null ? null : nuts,
        "RS_0": rs0 == null ? null : rs0,
        "AGS_0": ags0 == null ? null : ags0,
        "WSK": wsk == null ? null : wsk,
        "EWZ": ewz,
        "KFL": kfl == null ? null : kfl,
        "DEBKG_ID": debkgId == null ? null : debkgId,
        "Shape__Area": shapeArea,
        "Shape__Length": shapeLength,
        "death_rate": deathRate,
        "cases": cases,
        "deaths": deaths,
        "cases_per_100k": casesPer100K,
        "cases_per_population": casesPerPopulation,
        "BL": blValues.reverse[bl],
        "BL_ID": blId,
        "county": county,
        "last_update": lastUpdateValues.reverse[lastUpdate],
        "cases7_per_100k": cases7Per100K,
        "recovered": recovered,
        "EWZ_BL": ewzBl,
        "cases7_bl_per_100k": cases7BlPer100K,
        "cases7_bl": cases7Bl,
        "death7_bl": death7Bl,
        "cases7_lk": cases7Lk,
        "death7_lk": death7Lk,
        "cases7_per_100k_txt": cases7Per100KTxt,
    };
}

enum Bem { EMPTY, SONDERVERBAND }

final bemValues = EnumValues({
    "--": Bem.EMPTY,
    "Sonderverband": Bem.SONDERVERBAND
});

enum Bez { KREISFREIE_STADT, KREIS, LANDKREIS, STADTKREIS, BEZIRK }

final bezValues = EnumValues({
    "Bezirk": Bez.BEZIRK,
    "Kreis": Bez.KREIS,
    "Kreisfreie Stadt": Bez.KREISFREIE_STADT,
    "Landkreis": Bez.LANDKREIS,
    "Stadtkreis": Bez.STADTKREIS
});

enum Bl { SCHLESWIG_HOLSTEIN, HAMBURG, NIEDERSACHSEN, BREMEN, NORDRHEIN_WESTFALEN, HESSEN, RHEINLAND_PFALZ, BADEN_WRTTEMBERG, BAYERN, SAARLAND, BRANDENBURG, MECKLENBURG_VORPOMMERN, SACHSEN, SACHSEN_ANHALT, THRINGEN, BERLIN }

final blValues = EnumValues({
    "Baden-Württemberg": Bl.BADEN_WRTTEMBERG,
    "Bayern": Bl.BAYERN,
    "Berlin": Bl.BERLIN,
    "Brandenburg": Bl.BRANDENBURG,
    "Bremen": Bl.BREMEN,
    "Hamburg": Bl.HAMBURG,
    "Hessen": Bl.HESSEN,
    "Mecklenburg-Vorpommern": Bl.MECKLENBURG_VORPOMMERN,
    "Niedersachsen": Bl.NIEDERSACHSEN,
    "Nordrhein-Westfalen": Bl.NORDRHEIN_WESTFALEN,
    "Rheinland-Pfalz": Bl.RHEINLAND_PFALZ,
    "Saarland": Bl.SAARLAND,
    "Sachsen": Bl.SACHSEN,
    "Sachsen-Anhalt": Bl.SACHSEN_ANHALT,
    "Schleswig-Holstein": Bl.SCHLESWIG_HOLSTEIN,
    "Thüringen": Bl.THRINGEN
});

enum FkS3 { R, K }

final fkS3Values = EnumValues({
    "K": FkS3.K,
    "R": FkS3.R
});

enum LastUpdate { THE_070120210000_UHR }

final lastUpdateValues = EnumValues({
    "07.01.2021, 00:00 Uhr": LastUpdate.THE_070120210000_UHR
});

enum Nbd { JA, NEIN }

final nbdValues = EnumValues({
    "ja": Nbd.JA,
    "nein": Nbd.NEIN
});

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
    Type type;
    String alias;
    SqlType sqlType;
    dynamic domain;
    dynamic defaultValue;
    int length;

    factory Field.fromJson(Map<String, dynamic> json) => Field(
        name: json["name"],
        type: typeValues.map[json["type"]],
        alias: json["alias"],
        sqlType: sqlTypeValues.map[json["sqlType"]],
        domain: json["domain"],
        defaultValue: json["defaultValue"],
        length: json["length"] == null ? null : json["length"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "type": typeValues.reverse[type],
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

enum Type { ESRI_FIELD_TYPE_OID, ESRI_FIELD_TYPE_SMALL_INTEGER, ESRI_FIELD_TYPE_STRING, ESRI_FIELD_TYPE_INTEGER, ESRI_FIELD_TYPE_DOUBLE }

final typeValues = EnumValues({
    "esriFieldTypeDouble": Type.ESRI_FIELD_TYPE_DOUBLE,
    "esriFieldTypeInteger": Type.ESRI_FIELD_TYPE_INTEGER,
    "esriFieldTypeOID": Type.ESRI_FIELD_TYPE_OID,
    "esriFieldTypeSmallInteger": Type.ESRI_FIELD_TYPE_SMALL_INTEGER,
    "esriFieldTypeString": Type.ESRI_FIELD_TYPE_STRING
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
