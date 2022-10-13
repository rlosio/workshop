
create table aristomini (message text);
LOAD DATA LOCAL INFILE '/home/ec2-user/Aristo-Mini-Corpus-Dec2016/aristomini.csv' INTO TABLE workshop.aristomini;
select count(*) from aristomini;
alter table aristomini add id bigint(20) NOT NULL AUTO_INCREMENT PRIMARY KEY;

