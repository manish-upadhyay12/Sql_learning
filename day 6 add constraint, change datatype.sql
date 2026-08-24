SELECT *FROM user_details;

alter table user_data
alter column age set NOT NULL;
INSERT INTO user_details(name,age,email)
values('manish',19,'ghjg');

alter table user_details
alter column age type smallint;


alter table user_data
alter column age set primary key

alter table user_details
alter column age type int

alter table user_details ADD CONSTRAINT age_check check(age>10);
alter table user_details alter column age check(age>10)
alter table user_details ADD CONSTRAINT age_check chck