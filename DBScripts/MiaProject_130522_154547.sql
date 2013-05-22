-- User_Person [rel13]
alter table "APP"."PERSON"  add column  "USER_2_OID"  integer;
alter table "APP"."PERSON"   add constraint FK_PERSON_USER_2 foreign key ("USER_2_OID") references "APP"."USER_2" ("OID");


