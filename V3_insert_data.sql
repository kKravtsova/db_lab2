INSERT INTO "language" ("name")
SELECT DISTINCT ClassLangName
FROM all;

INSERT INTO "sex" ("name")
SELECT DISTINCT SEXTYPENAME
FROM all;

INSERT INTO "eoType" ("name")
SELECT DISTINCT EOTYPENAME
FROM all;

INSERT INTO "status" ("name")
SELECT DISTINCT UkrTestStatus
FROM all;

INSERT INTO "classProfile" ("name")
SELECT DISTINCT ClassProfileNAME
FROM all;

INSERT INTO "terType" ("name")
SELECT DISTINCT TerTypeName
FROM all;

INSERT INTO "teritory" ("name", "areaname", "regname", "regtypename", "type")
SELECT DISTINCT ON (all.TerName) all.TerName, all.AreaName, all.RegName, all.RegTypeName, "terType"."id"
FROM all
LEFT JOIN "terType"
ON all.TerTypeName = "terType"."name";

INSERT INTO "eo" ("name", "parent", "ter", "type")
SELECT DISTINCT ON (all.EOName) all.EOName, all.EOParent, "teritory"."id", "eoType"."id"
FROM all
LEFT JOIN "teritory"
ON all.TerName = "teritory"."name"
LEFT JOIN "eoType"
ON all.EOTypeName = "eoType"."name";

INSERT INTO "students" ("outid", "year", "sex", "classlang", "ter", "classProf", "eoid")
SELECT DISTINCT ON (all.outID) all.outID, all.Birth, "sex"."id", "language"."id", "teritory"."id", "classProfile"."id", "eo"."id"
FROM all
LEFT JOIN "sex"
ON all.SEXTYPENAME = "sex"."name"
LEFT JOIN "language"
ON all.ClassLangName = "language"."name"
LEFT JOIN "teritory"
ON all.TerName = "teritory"."name"
LEFT JOIN "classProfile"
ON all.ClassProfileNAME = "classProfile"."name"
LEFT JOIN "eo"
ON all.EONAME = "eo"."name";

INSERT INTO "result" ("authorId", "name", "eoid", "status", "Ball", "Ball100", "Ball12")
SELECT outID, UkrTest, "eo"."id", "status"."id", UkrBall, UkrBall100, UkrBall12
FROM all
LEFT JOIN "eo"
ON all.UkrPTTerName = "eo"."name"
LEFT JOIN "status"
ON all.UkrTestStatus = "status"."name";

INSERT INTO "result" ("authorId", "name", "eoid", "lang", "status", "Ball", "Ball100", "Ball12")
SELECT outID, histTest, "eo"."id", "language"."id", "status"."id", histBall, histBall100, histBall12
FROM all
LEFT JOIN "eo"
ON all.histPTTerName = "eo"."name"
LEFT JOIN "language"
ON all.histLang = "language"."name"
LEFT JOIN "status"
ON all.histTestStatus = "status"."name";

INSERT INTO "result" ("authorId", "name", "eoid", "lang", "status", "Ball", "Ball100", "Ball12")
SELECT outID, mathTest, "eo"."id", "language"."id", "status"."id", mathBall, mathBall100, mathBall12
FROM all
LEFT JOIN "eo"
ON all.mathPTTerName = "eo"."name"
LEFT JOIN "language"
ON all.ClassLangName = "language"."name"
LEFT JOIN "status"
ON all.mathTestStatus = "status"."name"

INSERT INTO "result" ("authorId", "name", "eoid", "lang", "status", "Ball", "Ball100", "Ball12")
SELECT outID, physTest, "eo"."id", "language"."id", "status"."id", physBall, physBall100, physBall12
FROM all
LEFT JOIN "eo"
ON all.physPTTerName = "eo"."name"
LEFT JOIN "language"
ON all.ClassLangName = "language"."name"
LEFT JOIN "status"
ON all.physTestStatus = "status"."name"

INSERT INTO "result" ("authorId", "name", "eoid", "lang", "status", "Ball", "Ball100", "Ball12")
SELECT outID, chemTest, "eo"."id", "language"."id", "status"."id", chemBall, chemBall100, chemBall12
FROM all
LEFT JOIN "eo"
ON all.chemPTTerName = "eo"."name"
LEFT JOIN "language"
ON all.ClassLangName = "language"."name"
LEFT JOIN "status"
ON all.chemTestStatus = "status"."name"

INSERT INTO "result" ("authorId", "name", "eoid", "lang", "status", "Ball", "Ball100", "Ball12")
SELECT outID, bioTest, "eo"."id", "language"."id", "status"."id", bioBall, bioBall100, bioBall12
FROM all
LEFT JOIN "eo"
ON all.bioPTTerName = "eo"."name"
LEFT JOIN "language"
ON all.ClassLangName = "language"."name"
LEFT JOIN "status"
ON all.bioTestStatus = "status"."name"

INSERT INTO "result" ("authorId", "name", "eoid", "lang", "status", "Ball", "Ball100", "Ball12")
SELECT outID, geoTest, "eo"."id", "language"."id", "status"."id", geoBall, geoBall100, geoBall12
FROM all
LEFT JOIN "eo"
ON all.geoPTTerName = "eo"."name"
LEFT JOIN "language"
ON all.ClassLangName = "language"."name"
LEFT JOIN "status"
ON all.geoTestStatus = "status"."name"

INSERT INTO "result" ("authorId", "name", "eoid", "status", "Ball", "Ball100", "Ball12")
SELECT outID, engTest, "eo"."id", "status"."id", engBall, engBall100, engBall12
FROM all
LEFT JOIN "eo"
ON all.engPTTerName = "eo"."name"
LEFT JOIN "status"
ON all.engTestStatus = "status"."name"

INSERT INTO "result" ("authorId", "name", "eoid", "status", "Ball", "Ball100", "Ball12")
SELECT outID, fraTest, "eo"."id", "status"."id", fraBall, fraBall100, fraBall12
FROM all
LEFT JOIN "eo"
ON all.fraPTTerName = "eo"."name"
LEFT JOIN "status"
ON all.fraTestStatus = "status"."name"

INSERT INTO "result" ("authorId", "name", "eoid", "status", "Ball", "Ball100", "Ball12")
SELECT outID, deuTest, "eo"."id", "status"."id", deuBall, deuBall100, deuBall12
FROM all
LEFT JOIN "eo"
ON all.deuPTTerName = "eo"."name"
LEFT JOIN "status"
ON all.deuTestStatus = "status"."name"

INSERT INTO "result" ("authorId", "name", "eoid", "status", "Ball", "Ball100", "Ball12")
SELECT outID, spaTest, "eo"."id", "status"."id", spaBall, spaBall100, spaBall12
FROM all
LEFT JOIN "eo"
ON all.spaPTTerName = "eo"."name"
LEFT JOIN "status"
ON all.spaTestStatus = "status"."name"