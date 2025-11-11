CREATE TABLE Employee(
    id_Employee INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    contract_type VARCHAR(50),
    salary INT,
    id_Team INT
);
CREATE TABLE Team(
    id_Team AUTO_INCREMENT,
    team_name VARCHAR(50)
);
CREATE TABLE Leave(
    id_Leave Auto_INCREMENT,
    start_date DATE,
    end_date DATE
);
INSERT INTO Employee VALUES(1, 'John', 'Doe', 'Full-Time', 60000, 1);
INSERT INTO Team VALUES(1, 'Development');
INSERT INTO Leave VALUES(1, '2024-06-01', '2024-06-10');
SELECT id_Employee, first_name, last_name
FROM Employee
WHERE id_Team IS NULL;
SELECT id_Employee, first_name, last_name
from Employee
WHERE id_Employee NOT IN (SELECT id_Employee FROM Leave);
SELECT 
    l.id_Leave,
    l.start_date,
    l.end_date,
    e.first_name,
    e.last_name,
    t.team_name
FROM Leave l
JOIN Employee e ON l.id_Employee = e.id_Employee
LEFT JOIN Team t ON e.id_Team = t.id_Team;
SELECT contract_type, COUNT(*) AS employee_count
FROM Employee
GROUP BY contract_type;
SELECT COUNT(DISTINCT id_Employee) AS on_leave_today
FROM Leave
WHERE CURRENT_DATE BETWEEN start_date AND end_date;
SELECT 
    e.id_Employee, 
    e.first_name, 
    e.last_name, 
    t.team_name
FROM Employee e
JOIN Leave l ON e.id_Employee = l.id_Employee
LEFT JOIN Team t ON e.id_Team = t.id_Team
WHERE CURRENT_DATE BETWEEN l.start_date AND l.end_date;