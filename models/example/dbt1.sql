with
dbttrans1 as (select * from cloudside-academy.balaairbytes.test12
),

bqviewsql as (
select 
      id as student_id,
      name as Name,
      email as student_email_id,
      age as Age
from dbttrans1
)
select * from bqviewsql
