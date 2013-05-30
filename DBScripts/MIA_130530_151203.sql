-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `user` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
  primary key (`oid`)
);


-- Person [ent1]
create table `person` (
   `oid`  integer  not null,
   `birthdate`  date,
   `tel`  varchar(255),
   `zip`  varchar(255),
   `city`  varchar(255),
   `streetnr`  varchar(255),
   `street`  varchar(255),
   `name`  varchar(255),
   `gender`  varchar(255),
  primary key (`oid`)
);


-- Chat [ent2]
create table `chat` (
   `oid`  integer  not null,
  primary key (`oid`)
);


-- ChatEntry [ent3]
create table `chatentry` (
   `oid`  integer  not null,
   `time`  datetime,
   `text`  varchar(255),
  primary key (`oid`)
);


-- Interest [ent4]
create table `interest` (
   `oid`  integer  not null,
   `description`  varchar(255),
  primary key (`oid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid`  integer;
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
);
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid`  integer;
alter table `user`   add index fk_user_group (`group_oid`), add constraint fk_user_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`user_oid`, `group_oid`)
);
alter table `user_group`   add index fk_user_group_user (`user_oid`), add constraint fk_user_group_user foreign key (`user_oid`) references `user` (`oid`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);


-- Friends [rel1]
create table `friends_2` (
   `person_oid`  integer not null,
   `person_oid_2`  integer not null,
  primary key (`person_oid`, `person_oid_2`)
);
alter table `friends_2`   add index fk_friends_2_person (`person_oid`), add constraint fk_friends_2_person foreign key (`person_oid`) references `person` (`oid`);
alter table `friends_2`   add index fk_friends_2_person_2 (`person_oid_2`), add constraint fk_friends_2_person_2 foreign key (`person_oid_2`) references `person` (`oid`);


-- User_Person [rel13]
alter table `person`  add column  `user_oid`  integer;
alter table `person`   add index fk_person_user (`user_oid`), add constraint fk_person_user foreign key (`user_oid`) references `user` (`oid`);


-- participant1 [rel2]
alter table `chat`  add column  `oid`  integer;
alter table `chat`   add index fk_chat_person (`oid`), add constraint fk_chat_person foreign key (`oid`) references `person` (`oid`);


-- participant2 [rel3]
alter table `chat`  add column  `oid`  integer;
alter table `chat`   add index fk_chat_person_2 (`oid`), add constraint fk_chat_person_2 foreign key (`oid`) references `person` (`oid`);


-- ChatEntry_Author [rel4]
alter table `chatentry`  add column  `oid`  integer;
alter table `chatentry`   add index fk_chatentry_person (`oid`), add constraint fk_chatentry_person foreign key (`oid`) references `person` (`oid`);


-- Chat_ChatEntry [rel5]
alter table `chatentry`  add column  `oid`  integer;
alter table `chatentry`   add index fk_chatentry_chat (`oid`), add constraint fk_chatentry_chat foreign key (`oid`) references `chat` (`oid`);


-- Person_Interest [rel6]
create table `person_interest` (
   `person_oid`  integer not null,
   `interest_oid`  integer not null,
  primary key (`person_oid`, `interest_oid`)
);
alter table `person_interest`   add index fk_person_interest_person (`person_oid`), add constraint fk_person_interest_person foreign key (`person_oid`) references `person` (`oid`);
alter table `person_interest`   add index fk_person_interest_interest (`interest_oid`), add constraint fk_person_interest_interest foreign key (`interest_oid`) references `interest` (`oid`);


