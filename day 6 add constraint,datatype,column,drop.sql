select *from user_details;

-- change datatype
ALTER TABLE user_details
alter column age type smallint;

-- add not null constraint
ALTER TABLE user_details
alter column age set not null;

-- remove not null constraint
ALTER TABLE user_details
alter column age drop not null;

-- add new phone_no column
ALTER TABLE user_details
add column phone_no numeric(10,0);

-- add new details column
ALTER TABLE user_details
add column details varchar(20);

-- change details datatype
ALTER TABLE user_details
alter column details type text;

-- set default value
ALTER TABLE user_details
alter column salary set default 20000;

-- remove default value
ALTER TABLE user_details
alter column salary drop default;

-- add check constraint
ALTER TABLE user_details
add constraint age_check check(age > 18);

-- drop check constraint
ALTER TABLE user_details
drop constraint age_check;

-- add total column
ALTER TABLE user_details
add column total numeric(10,2);

-- add unique constraint
ALTER TABLE user_details
add constraint total_uniq unique(total);

-- drop unique constraint
ALTER TABLE user_details
drop constraint total_uniq;

-- delete all records and reset identity
TRUNCATE TABLE user_details restart identity;