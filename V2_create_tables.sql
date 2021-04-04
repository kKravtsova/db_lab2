CREATE TABLE "students" (
  "outid" int PRIMARY KEY,
  "year" int,
  "sex" int,
  "classlang" int,
  "ter" int,
  "classProf" int,
  "eoid" int
);

CREATE TABLE "sex" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar UNIQUE
);

CREATE TABLE "language" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar UNIQUE
);

CREATE TABLE "teritory" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar UNIQUE,
  "areaname" varchar,
  "regname" varchar,
  "regtypename" varchar,
  "type" int
);

CREATE TABLE "terType" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar UNIQUE
);

CREATE TABLE "classProfile" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar UNIQUE
);

CREATE TABLE "eo" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar UNIQUE,
  "parent" varchar,
  "ter" int,
  "type" int
);

CREATE TABLE "eoType" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar UNIQUE
);

CREATE TABLE "result" (
  "id" SERIAL PRIMARY KEY,
  "authorId" int,
  "name" varchar,
  "eoid" int,
  "lang" int,
  "status" int,
  "Ball" int,
  "Ball100" int,
  "Ball12" int
);

CREATE TABLE "status" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar UNIQUE
);

ALTER TABLE "students" ADD FOREIGN KEY ("sex") REFERENCES "sex" ("id");

ALTER TABLE "students" ADD FOREIGN KEY ("ter") REFERENCES "teritory" ("id");

ALTER TABLE "eo" ADD FOREIGN KEY ("ter") REFERENCES "teritory" ("id");

ALTER TABLE "result" ADD FOREIGN KEY ("eoid") REFERENCES "eo" ("id");

ALTER TABLE "students" ADD FOREIGN KEY ("classProf") REFERENCES "classProfile" ("id");

ALTER TABLE "students" ADD FOREIGN KEY ("classlang") REFERENCES "language" ("id");

ALTER TABLE "result" ADD FOREIGN KEY ("lang") REFERENCES "language" ("id");

ALTER TABLE "teritory" ADD FOREIGN KEY ("type") REFERENCES "terType" ("id");

ALTER TABLE "eo" ADD FOREIGN KEY ("type") REFERENCES "eoType" ("id");

ALTER TABLE "students" ADD FOREIGN KEY ("eoid") REFERENCES "eo" ("id");

ALTER TABLE "result" ADD FOREIGN KEY ("authorId") REFERENCES "students" ("outid");

ALTER TABLE "result" ADD FOREIGN KEY ("status") REFERENCES "status" ("id");
