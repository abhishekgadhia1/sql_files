select * from emp_grp_seq
update emp_grp_seq
set emp_name = 'Abhi', grp = 'A', seq = 1
where emp_name = 'Abhishek' and grp = 'ABC' AND seq = 1;
alter table emp_grp_seq
add primary key (grp);
alter table emp_grp_seq
drop column emp_name;
ALTER TABLE emp_grp_seq
DROP PRIMARY KEY;
alter table emp_grp_seq
add primary key (grp);
UPDATE `dataengineerprac1`.`emp_grp_seq` SET `grp` = 'A' WHERE (`grp` = 'ABC');
ALTER TABLE emp_grp_seq
DROP PRIMARY KEY;
SELECT * FROM emp_grp_seq;
ALTER TABLE emp_grp_seq
ADD COLUMN serial int auto_increment primary key;
select * from emp_grp_seq
alter table emp_grp_seq
modify column serial int first;

SELECT 
  `grp`,
  `seq`,
  ROW_NUMBER() OVER (PARTITION BY `grp` ORDER BY `seq`) AS rnk
FROM 
  emp_grp_seq;
  
  select * from emp_grp_seq;
  
SELECT 
  `grp`,
  `seq`,
  ROW_NUMBER() OVER (PARTITION BY `grp` ORDER BY `seq`) AS rnk,
	`seq` - ROW_NUMBER() OVER (PARTITION BY `grp` ORDER BY `seq`) as 'grp_split'
FROM emp_grp_seq;

SELECT 
  `grp`,
  `seq`,
  ROW_NUMBER() OVER (PARTITION BY `grp` ORDER BY `seq`) AS rnk,
  `seq` - ROW_NUMBER() OVER (PARTITION BY `grp` ORDER BY `seq`) as grp_split
FROM emp_grp_seq;

select
`grp`,
min(seq) as min_seq,
max(seq) as max_seq
from
(
SELECT 
  `grp`,
  `seq`,
  `seq` - ROW_NUMBER() OVER (PARTITION BY `grp` ORDER BY `seq`) as grp_split
FROM emp_grp_seq
) A
GROUP BY `grp`, `grp_split` order by `grp`



