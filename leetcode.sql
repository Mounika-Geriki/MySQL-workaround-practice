## Leet code sql
## 570. Managers with at Least 5 Direct Reports
# Write your MySQL query statement below
SELECT e1.name
FROM employee e1
INNER JOIN Employee e2
ON e1.id = e2. managerID
GROUP BY e1.id, e1.name
HAVING COUNT(e2.id)>=5;

## Explanation (simple) :
-- Treat e1 as the table of managers.
-- Treat e2 as the table of employees reporting to those managers.
-- e1.id = e2.managerId → finds all employees who report to that manager.
-- GROUP BY e1.id → groups each manager.
-- COUNT(e2.id) → counts how many direct reports.
-- HAVING COUNT >= 5 → keeps only managers with at least 5 direct reports.
-- SELECT e1.name → returns manager names.

## 577. Employee Bonus
##solution
# Write your MySQL query statement below
SELECT e.name, b.bonus
FROM Employee as e
LEFT JOIN Bonus as b
ON e.empId =b.empId
WHERE b.bonus <1000 OR b.bonus IS NULL;

#explanation:
-- LEFT JOIN: This keeps all employees, even if they don’t have a match in the Bonus table.

