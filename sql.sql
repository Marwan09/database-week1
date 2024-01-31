-- 1-Find out how many tasks are in the task table
SELECT count(*) from task   
-- or 
SELECT count(id) from task

-- Find out how many tasks in the task table do not have a valid due date

select count(id) as WITHOUTDATE from task where due_date IS NOT NULL
-- select  count(due_date) from task
-- WHERE ISDATE(dt) = 1   ==>but this give me "FUNCTION hyf.ISDATE does not exist"


-- Find all the tasks that are marked as done

-- Find all the tasks that are marked as done
 select * from status
-- we can see  the tasks that are marked as done has id 3=>
SELECT * from task where status_id = 3


-- Find all the tasks that are not marked as done

SELECT * from task WHERE status_id != 3
--or 
SELECT * from task WHERE status_id <> 3

-- Get all the tasks, sorted with the most recently created first


SELECT * from task ORDER BY created DESC;


-- Get the single most recently created task

SELECT  * FROM task ORDER BY due_date DESC limit 1 


-- Get the title and due date of all tasks where the title or description contains database
select title,due_date from task where title !=NULL or description != NULL;

-- select title,due_date from task where title like '%database%' or description like '%database%';


-- Get the title and status (as text) of all tasks
select task.title,status.name  from task JOIN status
WHERE task.status_id= status.id

-- Get the name of each status, along with a count of how many tasks have that status
SELECT  COUNT(task.status_id),status.name 
 from  task JOIN status 
WHERE task.status_id =status.id 
 GROUP BY status.name

-- Get the names of all statuses, sorted by the status with most tasks first

SELECT  status.name ,COUNT(task.status_id)
 from  task JOIN status 
WHERE task.status_id =status.id 
 GROUP BY status.name
 order by  COUNT(task.status_id) desc;







