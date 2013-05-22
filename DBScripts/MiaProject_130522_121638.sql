-- Group [Group]
create table "APP"."GROUP_2" (
   "OID"  integer  not null,
   "GROUPNAME"  varchar(255),
  primary key ("OID")
);


-- Module [Module]
create table "APP"."MODULE_2" (
   "OID"  integer  not null,
   "MODULEID"  varchar(255),
   "MODULENAME"  varchar(255),
  primary key ("OID")
);


-- User [User]
create table "APP"."USER_2" (
   "OID"  integer  not null,
   "USERNAME"  varchar(255),
   "PASSWORD"  varchar(255),
   "EMAIL"  varchar(255),
  primary key ("OID")
);


-- Person [ent1]
create table "APP"."PERSON" (
   "OID"  integer  not null,
   "BIRTHDATE"  date,
   "TEL"  varchar(255),
   "ZIP"  varchar(255),
   "CITY"  varchar(255),
   "STREETNR"  varchar(255),
   "STREET"  varchar(255),
   "MAIL"  varchar(255),
   "NAME"  varchar(255),
   "GENDER"  smallint,
  primary key ("OID")
);


-- Chat [ent2]
create table "APP"."CHAT" (
   "OID"  integer  not null,
  primary key ("OID")
);


-- ChatEntry [ent3]
create table "APP"."CHATENTRY" (
   "OID"  integer  not null,
   "TIME"  timestamp,
   "TEXT"  varchar(255),
  primary key ("OID")
);


-- Interest [ent4]
create table "APP"."INTEREST" (
   "OID"  integer  not null,
   "DESCRIPTION"  varchar(255)  not null,
  primary key ("OID", "DESCRIPTION")
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "APP"."GROUP_2"  add column  "MODULE_2_OID"  integer;
alter table "APP"."GROUP_2"   add constraint FK_GROUP_2_MODULE_2 foreign key ("MODULE_2_OID") references "APP"."MODULE_2" ("OID");


-- Group_Module [Group2Module_Module2Group]
create table "APP"."GROUP_MODULE_2" (
   "GROUP_2_OID"  integer not null,
   "MODULE_2_OID"  integer not null,
  primary key ("GROUP_2_OID", "MODULE_2_OID")
);
alter table "APP"."GROUP_MODULE_2"   add constraint FK_GROUP_MODULE_2_GROUP_2 foreign key ("GROUP_2_OID") references "APP"."GROUP_2" ("OID");
alter table "APP"."GROUP_MODULE_2"   add constraint FK_GROUP_MODULE_2_MODULE_2 foreign key ("MODULE_2_OID") references "APP"."MODULE_2" ("OID");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "APP"."USER_2"  add column  "GROUP_2_OID"  integer;
alter table "APP"."USER_2"   add constraint FK_USER_2_GROUP_2 foreign key ("GROUP_2_OID") references "APP"."GROUP_2" ("OID");


-- User_Group [User2Group_Group2User]
create table "APP"."USER_GROUP_2" (
   "USER_2_OID"  integer not null,
   "GROUP_2_OID"  integer not null,
  primary key ("USER_2_OID", "GROUP_2_OID")
);
alter table "APP"."USER_GROUP_2"   add constraint FK_USER_GROUP_2_USER_2 foreign key ("USER_2_OID") references "APP"."USER_2" ("OID");
alter table "APP"."USER_GROUP_2"   add constraint FK_USER_GROUP_2_GROUP_2 foreign key ("GROUP_2_OID") references "APP"."GROUP_2" ("OID");


-- Friends [rel1]
create table "APP"."FRIENDS" (
   "PERSON_OID"  integer not null,
   "PERSON_OID_2"  integer not null,
  primary key ("PERSON_OID", "PERSON_OID_2")
);
alter table "APP"."FRIENDS"   add constraint FK_FRIENDS_PERSON foreign key ("PERSON_OID") references "APP"."PERSON" ("OID");
alter table "APP"."FRIENDS"   add constraint FK_FRIENDS_PERSON_2 foreign key ("PERSON_OID_2") references "APP"."PERSON" ("OID");


-- participant1 [rel2]
alter table "APP"."PERSON"  add column  "CHAT_OID"  integer;
alter table "APP"."PERSON"   add constraint FK_PERSON_CHAT foreign key ("CHAT_OID") references "APP"."CHAT" ("OID");


-- participant2 [rel3]
alter table "APP"."PERSON"  add column  "CHAT_OID_2"  integer;
alter table "APP"."PERSON"   add constraint FK_PERSON_CHAT_2 foreign key ("CHAT_OID_2") references "APP"."CHAT" ("OID");


-- ChatEntry_Author [rel4]
alter table "APP"."PERSON"  add column  "CHATENTRY_OID"  integer;
alter table "APP"."PERSON"   add constraint FK_PERSON_CHATENTRY foreign key ("CHATENTRY_OID") references "APP"."CHATENTRY" ("OID");


-- Chat_ChatEntry [rel5]
alter table "APP"."CHAT"  add column  "CHATENTRY_OID"  integer;
alter table "APP"."CHAT"   add constraint FK_CHAT_CHATENTRY foreign key ("CHATENTRY_OID") references "APP"."CHATENTRY" ("OID");


-- Person_Interest [rel6]
create table "APP"."PERSON_INTEREST" (
   "PERSON_OID"  integer not null,
   "INTEREST_OID"  integer not null,
   "INTEREST_DESCRIPTION"  varchar(255) not null,
  primary key ("PERSON_OID", "INTEREST_OID", "INTEREST_DESCRIPTION")
);
alter table "APP"."PERSON_INTEREST"   add constraint FK_PERSON_INTEREST_PERSON foreign key ("PERSON_OID") references "APP"."PERSON" ("OID");
alter table "APP"."PERSON_INTEREST"   add constraint FK_PERSON_INTEREST_INTEREST foreign key ("INTEREST_OID", "INTEREST_DESCRIPTION") references "APP"."INTEREST" ("OID", "DESCRIPTION");


