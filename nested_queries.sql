-- Find names of all students who have sold over 30,000 to a single client
SELECT student.first_name, student.last_name
FROM student
WHERE student.st_id IN (
    SELECT works_with.st_id
    FROM works_with
    WHERE works_with.total_sales > 30000
);

-- Find all clients who are handled by the branch that Refaat Al Ktifan manages
SELECT client.client_name
FROM client
WHERE client.branch_id = (
    SELECT branch.branch_id
    FROM branch
    WHERE branch.mgr_id = 102
    LIMIT 1
);
