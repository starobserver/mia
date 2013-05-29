-- Friends [rel1]
create table `friends_2` (
   `person_oid`  integer not null,
   `person_oid_2`  integer not null,
  primary key (`person_oid`, `person_oid_2`)
);
alter table `friends_2`   add index fk_friends_2_person (`person_oid`), add constraint fk_friends_2_person foreign key (`person_oid`) references `person` (`oid`);
alter table `friends_2`   add index fk_friends_2_person_2 (`person_oid_2`), add constraint fk_friends_2_person_2 foreign key (`person_oid_2`) references `person` (`oid`);


