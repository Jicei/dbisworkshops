CREATE TABLE "Users"
(
"id" NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
"username" NVARCHAR2(20) UNIQUE NOT NULL,
"password" NVARCHAR2(100) NOT NULL,
"country_id" NUMBER
);


CREATE TABLE "Country"
(
"id" number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
"name" NVARCHAR2(100) NOT NULL
);

CREATE TABLE "NumbersAid"
(
"id" NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
"phone_number" NVARCHAR2(100) NOT NULL,
"country_id" NUMBER NOT NULL
);
CREATE TABLE "Hospital"
(
"id" NUMBER GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT by 1),
"name" NVARCHAR2(100) NOT NULL,
"adress" NVARCHAR2(250) NOT NULL,
"country_id" NUMBER NOT NULL
);

CREATE TABLE "Symptom"
(
"id" NUMBER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT by 1),
"name" NVARCHAR2(100) NOT NULL,
"Description" NVARCHAR2(500) NOT NULL
);
CREATE TABLE "Note"
(
"id" NUMBER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT by 1),
"name" NVARCHAR2(100) NOT NULL,
"Description" NVARCHAR2(500),
"user_id" NUMBER NOT NULL
);

ALTER TABLE "Users"
ADD CONSTRAINT pk_Users PRIMARY KEY("id");

ALTER TABLE "Country"
ADD CONSTRAINT pk_Coutnry PRIMARY KEY("id");

ALTER TABLE "Users"
ADD CONSTRAINT fk_Users_country FOREIGN KEY("country_id") REFERENCES "Country"("id");

ALTER TABLE "NumbersAid"
ADD CONSTRAINT pk_NumbersAid PRIMARY KEY("id");

ALTER TABLE "NumbersAid"
ADD CONSTRAINT fk_NumbersAid_country FOREIGN KEY("country_id") REFERENCES "Country"("id");

ALTER TABLE "Hospital"
ADD CONSTRAINT pk_Hospital PRIMARY KEY("id");

ALTER TABLE "Hospital"
ADD CONSTRAINT fk_Hospital_country FOREIGN KEY("country_id") REFERENCES "Country"("id");

ALTER TABLE "Symptom"
ADD CONSTRAINT pk_Symptom PRIMARY KEY("id");

ALTER TABLE "Note"
ADD CONSTRAINT pk_note PRIMARY KEY("id");

ALTER TABLE "Note"
ADD CONSTRAINT fk_Note_user FOREIGN KEY("user_id") REFERENCES "Users"("id");