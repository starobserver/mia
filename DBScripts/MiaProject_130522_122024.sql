-- Friends [ent9]
create table "APP"."FRIENDS_2" (
   "OID"  integer  not null,
  primary key ("OID")
);


-- Person_Friends [rel11]
alter table "APP"."FRIENDS_2"  add column  "PERSON_OID"  integer;
alter table "APP"."FRIENDS_2"   add constraint FK_FRIENDS_2_PERSON foreign key ("PERSON_OID") references "APP"."PERSON" ("OID");


-- Friends_Person [rel12]
create table "APP"."FRIENDS_PERSON" (
   "FRIENDS_2_OID"  integer not null,
   "PERSON_OID"  integer not null,
  primary key ("FRIENDS_2_OID", "PERSON_OID")
);
alter table "APP"."FRIENDS_PERSON"   add constraint FK_FRIENDS_PERSON_FRIENDS_2 foreign key ("FRIENDS_2_OID") references "APP"."FRIENDS_2" ("OID");
alter table "APP"."FRIENDS_PERSON"   add constraint FK_FRIENDS_PERSON_PERSON foreign key ("PERSON_OID") references "APP"."PERSON" ("OID");


