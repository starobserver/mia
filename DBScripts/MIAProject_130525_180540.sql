-- Group [Group]
create table "APP"."GROUP" (
   "OID"  integer  not null,
   "GROUPNAME"  varchar(255),
  primary key ("OID")
);


-- Module [Module]
create table "APP"."MODULE" (
   "OID"  integer  not null,
   "MODULEID"  varchar(255),
   "MODULENAME"  varchar(255),
  primary key ("OID")
);


-- User [User]
create table "APP"."USER" (
   "OID"  integer  not null,
   "USERNAME"  varchar(255),
   "PASSWORD"  varchar(255),
   "EMAIL"  varchar(255),
  primary key ("OID")
);


-- Person [ent1]
create table "APP"."PERSON_2" (
   "OID"  integer  not null,
   "BIRTHDATE"  date,
   "TEL"  varchar(255),
   "ZIP"  varchar(255),
   "CITY"  varchar(255),
   "STREETNR"  varchar(255),
   "STREET"  varchar(255),
   "NAME"  varchar(255),
   "GENDER"  varchar(255),
  primary key ("OID")
);


-- Chat [ent2]
create table "APP"."CHAT_2" (
   "OID"  integer  not null,
  primary key ("OID")
);


-- ChatEntry [ent3]
create table "APP"."CHATENTRY_2" (
   "OID"  integer  not null,
   "TIME"  timestamp,
   "TEXT"  varchar(255),
  primary key ("OID")
);


-- Interest [ent4]
create table "APP"."INTEREST_2" (
   "OID"  integer  not null,
   "DESCRIPTION"  varchar(255),
  primary key ("OID")
);


-- Friends [ent9]
create table "APP"."FRIENDS_3" (
   "OID"  integer  not null,
  primary key ("OID")
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "APP"."GROUP"  add column  "MODULE_OID"  integer;
alter table "APP"."GROUP"   add constraint FK_GROUP_MODULE foreign key ("MODULE_OID") references "APP"."MODULE" ("OID");


-- Group_Module [Group2Module_Module2Group]
create table "APP"."GROUP_MODULE" (
   "GROUP_OID"  integer not null,
   "MODULE_OID"  integer not null,
  primary key ("GROUP_OID", "MODULE_OID")
);
alter table "APP"."GROUP_MODULE"   add constraint FK_GROUP_MODULE_GROUP foreign key ("GROUP_OID") references "APP"."GROUP" ("OID");
alter table "APP"."GROUP_MODULE"   add constraint FK_GROUP_MODULE_MODULE foreign key ("MODULE_OID") references "APP"."MODULE" ("OID");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "APP"."USER"  add column  "GROUP_OID"  integer;
alter table "APP"."USER"   add constraint FK_USER_GROUP foreign key ("GROUP_OID") references "APP"."GROUP" ("OID");


-- User_Group [User2Group_Group2User]
create table "APP"."USER_GROUP" (
   "USER_OID"  integer not null,
   "GROUP_OID"  integer not null,
  primary key ("USER_OID", "GROUP_OID")
);
alter table "APP"."USER_GROUP"   add constraint FK_USER_GROUP_USER foreign key ("USER_OID") references "APP"."USER" ("OID");
alter table "APP"."USER_GROUP"   add constraint FK_USER_GROUP_GROUP foreign key ("GROUP_OID") references "APP"."GROUP" ("OID");


-- Person_Friends [rel11]
alter table "APP"."FRIENDS_3"  add column  "PERSON_2_OID"  integer;
alter table "APP"."FRIENDS_3"   add constraint FK_FRIENDS_3_PERSON_2 foreign key ("PERSON_2_OID") references "APP"."PERSON_2" ("OID");


-- Friends_Person [rel12]
create table "APP"."FRIENDS_PERSON_2" (
   "FRIENDS_3_OID"  integer not null,
   "PERSON_2_OID"  integer not null,
  primary key ("FRIENDS_3_OID", "PERSON_2_OID")
);
alter table "APP"."FRIENDS_PERSON_2"   add constraint FK_FRIENDS_PERSON_2_FRIENDS_3 foreign key ("FRIENDS_3_OID") references "APP"."FRIENDS_3" ("OID");
alter table "APP"."FRIENDS_PERSON_2"   add constraint FK_FRIENDS_PERSON_2_PERSON_2 foreign key ("PERSON_2_OID") references "APP"."PERSON_2" ("OID");


-- User_Person [rel13]
alter table "APP"."PERSON_2"  add column  "USER_OID"  integer;
alter table "APP"."PERSON_2"   add constraint FK_PERSON_2_USER foreign key ("USER_OID") references "APP"."USER" ("OID");


-- participant1 [rel2]
alter table "APP"."PERSON_2"  add column  "CHAT_2_OID"  integer;
alter table "APP"."PERSON_2"   add constraint FK_PERSON_2_CHAT_2 foreign key ("CHAT_2_OID") references "APP"."CHAT_2" ("OID");


-- participant2 [rel3]
alter table "APP"."PERSON_2"  add column  "CHAT_2_OID_2"  integer;
alter table "APP"."PERSON_2"   add constraint FK_PERSON_2_CHAT_2_2 foreign key ("CHAT_2_OID_2") references "APP"."CHAT_2" ("OID");


-- ChatEntry_Author [rel4]
alter table "APP"."PERSON_2"  add column  "CHATENTRY_2_OID"  integer;
alter table "APP"."PERSON_2"   add constraint FK_PERSON_2_CHATENTRY_2 foreign key ("CHATENTRY_2_OID") references "APP"."CHATENTRY_2" ("OID");


-- Chat_ChatEntry [rel5]
alter table "APP"."CHAT_2"  add column  "CHATENTRY_2_OID"  integer;
alter table "APP"."CHAT_2"   add constraint FK_CHAT_2_CHATENTRY_2 foreign key ("CHATENTRY_2_OID") references "APP"."CHATENTRY_2" ("OID");


-- Person_Interest [rel6]
create table "APP"."PERSON_INTEREST_2" (
   "PERSON_2_OID"  integer not null,
   "INTEREST_2_OID"  integer not null,
  primary key ("PERSON_2_OID", "INTEREST_2_OID")
);
alter table "APP"."PERSON_INTEREST_2"   add constraint FK_PERSON_INTEREST_2_PERSON_2 foreign key ("PERSON_2_OID") references "APP"."PERSON_2" ("OID");
alter table "APP"."PERSON_INTEREST_2"   add constraint FK_PERSON_INTEREST_2_INTEREST foreign key ("INTEREST_2_OID") references "APP"."INTEREST_2" ("OID");


