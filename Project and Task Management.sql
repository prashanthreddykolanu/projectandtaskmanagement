--Creating projects table 
--Stores information about various projects
CREATE TABLE PROJECTS (
project_id INT PRIMARY KEY NOT NULL,
project_name NVARCHAR(255) NOT NULL,
project_description NVARCHAR(255),
start_data DATE,
end_data DATE
);

---------------------------------------------------------------------------------------------------

--Creating tasks table
--Stores information about individual tasks within projects
CREATE TABLE TASKS(
task_id INT PRIMARY KEY NOT NULL,
task_name NVARCHAR(255),
task_description NVARCHAR(255),
due_date DATE,
task_status NVARCHAR(255),
project_id INT,
CONSTRAINT FK_projects_projectid
FOREIGN KEY (project_id)
REFERENCES PROJECTS (project_id)
);

--------------------------------------------------------------------------------------------------

--Creating Task Dependencies table
--Stores dependencies between tasks

CREATE TABLE TASKDEPENDENCIES(
dependency_id INT PRIMARY KEY,
task_id INT,
depends_on_task_id INT,

CONSTRAINT FK_TASKS_TASKID
FOREIGN KEY (task_id)
REFERENCES TASKS (task_id),

CONSTRAINT FK_TASKS_DEPENDTASKID
FOREIGN KEY (depends_on_task_id) 
REFERENCES TASKS (task_id)

);


---------------------------------------------------------------------------------------------------------------

--Creating Users table
--Stores information about users who will be assigned tasks

CREATE TABLE USERS(
user_id INT PRIMARY KEY,
user_name NVARCHAR(255),
first_name NVARCHAR(255),
last_name NVARCHAR(255),
email NVARCHAR(255)
);


--------------------------------------------------------------------------------------------------------------------

--Creating Assignments table
--Tracks task assignments to users

CREATE TABLE ASSIGNMENTS(
assignment_id INT PRIMARY KEY,
task_id INT,
user_id INT,

CONSTRAINT FK_TASKID_ASSIGNMENTID
FOREIGN KEY (task_id)
REFERENCES TASKS (task_id),

CONSTRAINT FK_USERID_USERS
FOREIGN KEY (user_id)
REFERENCES USERS(user_id)
);


----------------------------------------------------------------------------------------------------------------------

--Creating Comments table
--Stores comments related to tasks or projects

CREATE TABLE COMMENTS(
comment_id INT PRIMARY KEY,
task_id INT,
project_id INT,
user_id INT,
comment_text NVARCHAR(255),
time_stamp DATE,

CONSTRAINT FK_TASKID_COMMENTS
FOREIGN KEY (task_id)
REFERENCES TASKS (task_id),

CONSTRAINT FK_PROJECTID_COMMENTS
FOREIGN KEY (project_id)
REFERENCES PROJECTS (project_id),

CONSTRAINT FK_USERID_COMMENTS
FOREIGN KEY (user_id)
REFERENCES USERS (user_id),
);


-----------------------------------------------------------------------------------------------------------

--Creating lables table
--stores tables that can be associated with tasks or projects

CREATE TABLE LABELS(
label_id INT PRIMARY KEY,
label_name NVARCHAR(255)
);

select * from LABELS;

--------------------------------------------------------------------------------------------------------------

--Creating tasklabels and projectlabels tables
--Connects tasks and projects to lables

CREATE TABLE TASKLABELS(
task_label_id INT PRIMARY KEY,
task_id INT,
label_id INT,

CONSTRAINT FK_TASKID_TASKLABLES
FOREIGN KEY (task_id)
REFERENCES TASKS(task_id),

CONSTRAINT FK_LABELID_TASKLABLES
FOREIGN KEY (label_id)
REFERENCES LABELS(label_id)
);

SELECT * FROM TASKLABELS;

-------------------------------------------------------------------------------------------------------------------

CREATE TABLE PROJECTLABELS(
project_label_id INT PRIMARY KEY,
project_id INT,
label_id INT,
CONSTRAINT FK_projectid_PROJECTLABELS
FOREIGN KEY (project_id)
REFERENCES PROJECTS(project_id),

CONSTRAINT FK_LABELID_PROJECTLABEL
FOREIGN KEY (label_id)
REFERENCES LABELS(label_id)
);

SELECT * FROM 
---------------------------------------------------------------------------------------------------

--inserting data into projects table

INSERT INTO PROJECTS (project_id, project_name, project_description, start_data, end_data)
VALUES
  (100, 'Website Redesign', 'Redesign the company website for improved user experience.', '2023-01-15', '2023-03-15'),
  (101, 'Product Launch', 'Launch a new product "Xenith" in the market with a marketing campaign.', '2023-02-01', '2023-04-01'),
  (102, 'Market Research', 'Conduct in-depth market research to identify market trends and customer preferences.', '2023-03-10', '2023-05-10'),
  (103, 'Office Renovation', 'Renovate the office space to create a modern and collaborative work environment.', '2023-04-20', '2023-06-20'),
  (104, 'Sales Training', 'Provide intensive sales training to improve the skills of the sales team.', '2023-05-05', '2023-07-05'),
  (105, 'IT Infrastructure Upgrade', 'Upgrade the companys IT infrastructure for improved performance and security.', '2023-06-15', '2023-08-15'),
  (106, 'Customer Support Expansion', 'Expand the customer support team to provide better assistance to clients.', '2023-07-01', '2023-09-01'),
  (107, 'Marketing Campaign', 'Launch a comprehensive marketing campaign to promote the companys products.', '2023-08-10', '2023-10-10'),
  (108, 'Product Enhancement', 'Enhance existing product features based on customer feedback and market analysis.', '2023-09-25', '2023-11-25'),
  (109, 'Quality Control Audit', 'Conduct a thorough quality control audit to ensure product quality and compliance.', '2023-10-05', '2023-12-05'),
  (110, 'Financial Planning', 'Review and plan the companys financial strategy for the upcoming year.', '2023-11-10', '2024-01-10'),
  (111, 'Employee Training', 'Provide training sessions to employees for skill development and career growth.', '2023-12-01', '2024-02-01'),
  (112, 'Supply Chain Optimization', 'Optimize supply chain operations to reduce costs and improve efficiency.', '2023-01-15', '2023-03-15'),
  (113, 'New Market Entry', 'Explore opportunities for entering a new international market and expand the customer base.', '2023-02-10', '2023-04-10'),
  (114, 'Product Testing', 'Conduct rigorous testing of new product prototypes to ensure quality and reliability.', '2023-03-05', '2023-05-05'),
  (115, 'Digital Transformation', 'Embark on a digital transformation journey to streamline business processes and enhance customer experiences.', '2023-04-20', '2023-06-20'),
  (116, 'Customer Satisfaction Survey', 'Gather feedback from customers to identify areas for improvement and increase satisfaction.', '2023-05-01', '2023-07-01'),
  (117, 'Data Security Enhancement', 'Enhance data security measures to protect customer data from cyber threats.', '2023-06-10', '2023-08-10'),
  (118, 'Product Localization', 'Localize products for international markets to cater to diverse customer needs.', '2023-07-15', '2023-09-15'),
  (119, 'Market Expansion Strategy', 'Develop a strategic plan to expand the companys market reach and increase market share.', '2023-08-01', '2023-10-01'),
  (120, 'Brand Identity Redesign', 'Redesign the companys brand identity to create a fresh and modern brand image.', '2023-09-10', '2023-11-10'),
  (121, 'Green Initiative', 'Implement eco-friendly initiatives across company operations to promote sustainability.', '2023-10-05', '2023-12-05'),
  (122, 'Supplier Relations Improvement', 'Strengthen relations with key suppliers to ensure a reliable supply chain.', '2023-11-15', '2024-01-15'),
  (123, 'AI Integration', 'Integrate AI technology into existing systems to automate tasks and improve efficiency.', '2022-12-01', '2023-02-01'),
  (124, 'New Product Research', 'Conduct research for the development of a new product line to meet emerging market demands.', '2022-01-10', '2022-03-10'),
  (125, 'Customer Retention Program', 'Launch a program aimed at retaining existing customers and enhancing their loyalty.', '2022-02-15', '2022-04-15'),
  (126, 'Employee Wellness Program', 'Implement a wellness program to promote the health and well-being of employees.', '2022-03-01', '2022-05-01'),
  (127, 'Sustainability Initiatives', 'Take steps toward sustainability and reduce the companys carbon footprint.', '2022-04-10', '2022-06-10'),
  (128, 'New Market Analysis', 'Analyze potential new markets to identify opportunities for expansion and growth.', '2022-05-05', '2022-07-05'),
  (129, 'Online Sales Platform', 'Launch an online platform for direct sales to customers to increase accessibility.', '2022-06-20', '2022-08-20');

  select * from projects;

--DELETE FROM PROJECTS WHERE project_id <31;

 --DELETE FROM projects WHERE project_id > 30;


  ------------------------------------------------------------------------------------------------------------
 --Inserting data into tasks table
--Project 100 with one task
  INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (1, 'Design Website Mockups', 'Create mockups for the website redesign project.', '2023-02-20', 'Finished', 100);

-- Project 101 with two tasks
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (2, 'Product Launch Marketing Plan', 'Develop a marketing plan for the Xenith product launch.', '2023-03-05', 'Finished', 101),
  (3, 'Product Packaging Design', 'Design packaging for the Xenith product.', '2023-03-30', 'Finished', 101);

-- Project 102 with three tasks
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (4, 'Market Research Survey', 'Conduct a customer survey for market research.', '2023-03-15', 'Finished',102),
  (5, 'Data Analysis', 'Analyze survey data for market trends.', '2023-04-01', 'Finished', 102),
  (6, 'Market Research Report', 'Compile a report on market research findings.', '2023-05-01', 'Finished', 102);

-- Project 103 with two tasks
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (7, 'Office Renovation Planning', 'Plan the renovation of the office space.', '2023-05-15', 'Finished', 103),
  (8, 'Office Renovation Execution', 'Execute the office renovation project.', '2023-06-10', 'Finished', 103);

-- Project 104 with two tasks
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (9, 'Sales Team Training Program', 'Implement a training program for the sales team.', '2023-06-15', 'Finished', 104),
  (10, 'Sales Performance Analysis', 'Analyze sales team performance.', '2023-07-01', 'Finished', 104);

-- Project 105 with three tasks
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (11, 'IT Infrastructure Assessment', 'Assess the current IT infrastructure for upgrade needs.', '2023-06-30', 'Finished', 105),
  (12, 'Infrastructure Upgrade Planning', 'Plan the IT infrastructure upgrade.', '2023-07-15', 'Finished', 105),
  (13, 'Infrastructure Upgrade Implementation', 'Implement the IT infrastructure upgrade.', '2023-08-01', 'Finished', 105);

-- Project 106 with three tasks
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (14, 'Customer Support Team Hiring', 'Recruit new team members for customer support.', '2023-07-15', 'Finished', 106),
  (15, 'Customer Support Training', 'Provide training to new customer support team members.', '2023-08-05', 'Finished', 106),
  (16, 'Customer Support Expansion Launch', 'Launch the expanded customer support team.', '2023-08-15', 'Finished', 106);

-- Project 107 with one task
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (17, 'Marketing Campaign Strategy', 'Develop a strategy for the marketing campaign.', '2023-09-10', 'Finished', 107);

-- Project 108 with two tasks
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (18, 'Product Enhancement Analysis', 'Analyze customer feedback and market analysis for product enhancement.', '2023-09-25', 'In Progress', 108),
  (19, 'Product Enhancement Implementation', 'Implement product feature enhancements.', '2023-10-20', 'Planned', 108);

-- Project 109 with three tasks
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (20, 'Quality Control Audit Planning', 'Plan the quality control audit process.', '2023-10-05', 'In Progress', 109),
  (21, 'Quality Control Audit Execution', 'Execute the quality control audit.', '2023-11-05', 'Not Started', 109),
  (22, 'Quality Control Audit Report', 'Compile a report on the audit findings.', '2023-12-05', 'Planned', 109);

-- Project 110 with two tasks
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (23, 'Financial Data Analysis', 'Analyze financial data for planning.', '2023-11-10', 'In Progress', 110),
  (24, 'Financial Strategy Planning', 'Plan the financial strategy for the upcoming year.', '2023-12-01', 'Not Started', 110);

-- Project 111 with two tasks
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (25, 'Employee Training Program Development', 'Develop the employee training program.', '2023-12-01', 'In Progress', 111),
  (26, 'Employee Training Sessions', 'Conduct training sessions for employees.', '2024-01-15', 'Planned', 111);

-- Project 112 with two tasks
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (27, 'Supply Chain Analysis', 'Analyze supply chain operations for optimization.', '2023-01-15', 'Finished', 112),
  (28, 'Supply Chain Optimization Implementation', 'Implement supply chain optimization strategies.', '2023-02-28', 'Finished', 112);

-- Project 113 with one task
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (29, 'New Market Entry Research', 'Research opportunities for entering a new international market.', '2023-03-10', 'Finished', 113);

-- Project 114 with one task
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (30, 'Product Testing Plan', 'Plan the testing of new product prototypes.', '2023-03-10', 'Finished', 114);

-- Project 115 with one task
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (31, 'Digital Transformation Planning', 'Plan the digital transformation journey.', '2023-05-01', 'Finished', 115);

-- Project 116 with one task
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (32, 'Customer Satisfaction Survey Preparation', 'Prepare for the customer satisfaction survey.', '2023-05-15', 'Finished', 116);

-- Project 117 with two tasks
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (33, 'Data Security Enhancement Assessment', 'Assess data security measures for enhancement.', '2023-06-15', 'Finished', 117),
  (34, 'Data Security Enhancement Implementation', 'Implement data security enhancements.', '2023-07-20', 'Finished', 117);

-- Project 118 with one task
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (35, 'Product Localization Strategy', 'Develop a strategy for product localization.', '2023-08-15', 'Finished', 118);

-- Project 119 with one task
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (36, 'Market Expansion Strategy Development', 'Develop a strategy for market expansion.', '2023-08-15', 'Finished', 119);

-- Project 120 with one task
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (37, 'Brand Identity Redesign Planning', 'Plan the brand identity redesign project.', '2023-10-01', 'Not Started', 120);

-- Project 121 with one task
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (38, 'Green Initiative Implementation', 'Implement eco-friendly initiatives.', '2023-10-15', 'Not Started', 121);

-- Project 122 with one task
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (39, 'Supplier Relations Improvement Planning', 'Plan the supplier relations improvement project.', '2023-12-15', 'Not Started', 122);

-- Project 123 with one task
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (40, 'AI Integration Planning', 'Plan the integration of AI technology into existing systems.', '2022-12-15', 'Finished', 123);

-- Project 124 with one task
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (41, 'New Product Research', 'Conduct research for new product development.', '2022-01-20', 'Finished', 124);

-- Project 125 with one task
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (42, 'Customer Retention Program Strategy', 'Develop a strategy for the customer retention program.', '2022-03-28', 'Finished', 125);

-- Project 126 with one task
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (43, 'Employee Wellness Program Implementation', 'Implement the employee wellness program.', '2022-04-15', 'Finished', 126);

-- Project 127 with one task
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (44, 'Sustainability Initiatives Implementation', 'Implement sustainability initiatives.', '2022-05-01', 'Finished', 127);

-- Project 128 with one task
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (45, 'New Market Analysis', 'Analyze potential new markets for expansion.', '2022-06-20', 'Finished', 128);

-- Project 129 with one task
INSERT INTO TASKS (task_id, task_name, task_description, due_date, task_status, project_id)
VALUES
  (46, 'Online Sales Platform Development', 'Develop the online sales platform.', '2022-08-01', 'Finished', 129);

  select * from TASKS;

------------------------------------------------------------------------------------------------------------------------------
--Inserting data into user table

INSERT INTO USERS (user_id, user_name, first_name, last_name, email)
VALUES
  (1, 'john_doe', 'John', 'Doe', 'john.doe123@gmail.com'),
  (2, 'jane_smith', 'Jane', 'Smith', 'jane.smith987@gmail.com'),
  (3, 'michael_brown', 'Michael', 'Brown', 'michael.brown@gmail.com'),
  (4, 'susan_wilson', 'Susan', 'Wilson', 'susan.wilson1@gmail.com'),
  (5, 'david_jones', 'David', 'Jones', 'david.jones45@gmail.com'),
  (6, 'linda_jackson', 'Linda', 'Jackson', 'linda.jackson33@gmail.com'),
  (7, 'robert_smith', 'Robert', 'Smith', 'robert.smith98@gmail.com'),
  (8, 'mary_davis', 'Mary', 'Davis', 'mary.davis87@gmail.com'),
  (9, 'william_adams', 'William', 'Adams', 'william.adams56@gmail.com'),
  (10, 'sarah_martin', 'Sarah', 'Martin', 'sarah.martin@gmail.com'),
  (11, 'peter_wilson', 'Peter', 'Wilson', 'peter.wilson@gmail.com'),
  (12, 'lisa_miller', 'Lisa', 'Miller', 'lisa.miller@gmail.com'),
  (13, 'james_anderson', 'James', 'Anderson', 'james.anderson@gmail.com'),
  (14, 'emily_thomas', 'Emily', 'Thomas', 'emily.thomas@gmail.com'),
  (15, 'daniel_jackson', 'Daniel', 'Jackson', 'daniel.jackson34@gmail.com');

  select * from USERS;

-------------------------------------------------------------------------------------------------------------------------------
-- Sample INSERT statements for creating assignments based on tasks and assigning them to users
-- You can modify this code to create assignments as needed

-- Assign tasks for Project 100 to users 1 and 2
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (1, 1, 1),
  (2, 1, 2);

-- Assign tasks for Project 101 to users 3 and 4
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (3, 2, 3),
  (4, 3, 4);

-- Assign tasks for Project 102 to users 5, 6, and 7
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (5, 4, 5),
  (6, 5, 6),
  (7, 6, 7);

-- Assign tasks for Project 103 to users 8 and 9
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (8, 7, 8),
  (9, 8, 9);

-- Assign tasks for Project 104 to users 10 and 11
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (10, 9, 10),
  (11, 10, 11);

-- Assign tasks for Project 105 to users 12, 13, and 14
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (12, 11, 12),
  (13, 12, 13),
  (14, 13, 14);

-- Assign tasks for Project 106 to users 15, 1, and 2
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (15, 14, 15),
  (16, 15, 1),
  (17, 16, 2);

-- Assign tasks for Project 107 to users 3
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (18, 17, 3);

-- Assign tasks for Project 108 to users 4 and 5
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (19, 18, 4),
  (20, 19, 5);

-- Assign tasks for Project 109 to users 6, 7, and 8
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (21, 20, 6),
  (22, 21, 7),
  (23, 22, 8);

-- Assign tasks for Project 110 to users 9 and 10
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (24, 23, 9),
  (25, 24, 10);

-- Assign tasks for Project 111 to users 11 and 12
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (26, 25, 11),
  (27, 26, 12);

-- Assign tasks for Project 112 to users 13 and 14
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (28, 27, 13),
  (29, 28, 14);

-- Assign tasks for Project 113 to users 15
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (30, 29, 15);

-- Assign tasks for Project 114 to users 1
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (31, 30, 1);

-- Assign tasks for Project 115 to users 2
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (32, 31, 2);

-- Assign tasks for Project 116 to users 3
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (33, 32, 3);

-- Assign tasks for Project 117 to users 4 and 5
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (34, 33, 4),
  (35, 34, 5);

-- Assign tasks for Project 118 to users 6
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (36, 35, 6);

-- Assign tasks for Project 119 to users 7
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (37, 36, 7);

-- Assign tasks for Project 120 to users 8
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (38, 37, 8);

-- Assign tasks for Project 121 to users 9
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (39, 38, 9);

-- Assign tasks for Project 122 to users 10
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (40, 39, 10);

-- Assign tasks for Project 123 to users 11
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (41, 40, 11);

-- Assign tasks for Project 124 to users 12
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (42, 41, 12);

-- Assign tasks for Project 125 to users 13
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (43, 42, 13);

-- Assign tasks for Project 126 to users 14
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (44, 43, 14);

-- Assign tasks for Project 127 to users 15
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (45, 44, 15);

-- Assign tasks for Project 128 to users 1
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (46, 45, 1);

-- Assign tasks for Project 129 to users 2
INSERT INTO ASSIGNMENTS (assignment_id, task_id, user_id)
VALUES
  (47, 46, 2);

select * from ASSIGNMENTS;


-----------------------------------------------------------------------------------------------------------------------

--Inserting data into lables table

INSERT INTO LABELS (label_id,label_name)
VALUES (601,'important'),
(602,'Urgent'),
(603,'Priority');

select * from LABELS;

UPDATE LABELS
SET label_name = 'High Priority'
WHERE label_name = 'Hight Priority';
UPDATE LABELS
SET label_name = 'Medium Priority'
WHERE label_name = 'Urgent';
UPDATE LABELS
SET label_name = 'Low Priority'
WHERE label_name = 'Lower Priority';



---------------------------------------------------------------------------------------------------------------------------

--Inserting data into task labels table

INSERT INTO TASKLABELS (task_label_id,task_id,label_id)
VALUES
(1,1,602),
(2,2,601),
(3,3,601),
(4,4,603),
(5,5,601),
(6,6,602),
(7,7,601),
(8,8,603),
(9,9,601),
(10,10,603),
(11,11,601),
(12,12,602),
(13,13,602),
(14,14,603),
(15,15,601),
(16,16,602),
(17,17,601),
(18,18,601),
(19,19,603),
(20,20,602),
(21,21,601),
(22,22,601),
(23,23,602),
(24,24,603),
(25,25,603),
(26,26,601),
(27,27,602),
(28,28,603),
(29,29,602),
(30,30,602),
(31,31,601),
(32,32,602),
(33,33,603),
(34,34,602),
(35,35,601),
(36,36,601),
(37,37,602),
(38,38,601),
(39,39,602),
(40,40,602),
(41,41,601),
(42,42,601),
(43,43,602),
(44,44,603),
(45,45,602),
(46,46,601);


SELECT * from TASKLABELS;


---------------------------------------------------------------------------------------------------------------

--Inserting data into projectslabels

INSERT INTO PROJECTLABELS (	project_label_id,project_id,label_id)
VALUES 
(1,100,601),
(2,101,602),
(3,102,601),
(4,103,603),
(5,104,603),
(6,105,602),
(7,106,601),
(8,107,603),
(9,108,601),
(10,109,601),
(11,110,601),
(12,111,602),
(13,112,602),
(14,113,603),
(15,114,601),
(16,115,602),
(17,116,603),
(18,117,601),
(19,118,603),
(20,119,602),
(21,120,601),
(22,121,601),
(23,122,602),
(24,123,603),
(25,124,603),
(26,125,601),
(27,126,602),
(28,127,601),
(29,128,602),
(30,129,601);

SELECT * FROM PROJECTLABELS;


-----------------------------------------------------------------------------------------------------------------------------------------\


--Data Analysis 1

SELECT P.project_id, P.project_name, T.task_id, T.task_name
FROM PROJECTS P
LEFT JOIN TASKS T ON P.project_id = T.project_id;


-----------------------------------------------------------------------------------------------------------------------------------

--Data Analysis 2

SELECT task_id, task_name, due_date
FROM TASKS
WHERE due_date < GETDATE() AND task_status != 'Finished';


------------------------------------------------------------------------------------------------------------------------------

--Data Analysis 3

SELECT project_id, COUNT(task_id) AS task_count
FROM TASKS
GROUP BY project_id;

---------------------------------------------------------------------------------------------------------------------------------

--Data Analysis 4

SELECT A.assignment_id, A.task_id, A.user_id, U.user_name, U.first_name, U.last_name
FROM ASSIGNMENTS A
JOIN USERS U ON A.user_id = U.user_id;


-------------------------------------------------------------------------------------------------------------------------------

-- Data Analysis 5

SELECT P.project_id, P.project_name
FROM PROJECTS P
LEFT JOIN TASKS T ON P.project_id = T.project_id
WHERE T.task_id IS NULL;

--------------------------------------------------------------------------------------------------------------------------

-- Data Analysis 6

SELECT P.project_id, P.project_name, COUNT(T.task_id) AS total_tasks,
       SUM(CASE WHEN T.task_status = 'Finished' THEN 1 ELSE 0 END) AS completed_tasks,
       (SUM(CASE WHEN T.task_status = 'Finished' THEN 1 ELSE 0 END) / COUNT(T.task_id)) * 100 AS completion_percentage
FROM PROJECTS P
LEFT JOIN TASKS T ON P.project_id = T.project_id
GROUP BY P.project_id, P.project_name;

---------------------------------------------------------------------------------------------------------------

--Data Analysis 7

SELECT DISTINCT P.project_id, P.project_name
FROM PROJECTS P
JOIN TASKS T ON P.project_id = T.project_id
JOIN TASKLABELS TL ON T.task_id = TL.task_id
JOIN LABELS L ON TL.label_id = L.label_id
WHERE L.label_name = 'High Priority';


-----------------------------------------------------------------------------------------------------------------------

--Data Analysis 8

SELECT
    t.task_id,
    t.task_name,
    t.task_description,
    t.due_date,
    t.task_status,
    u.user_name
FROM
    TASKS t
JOIN
    ASSIGNMENTS a ON t.task_id = a.task_id
JOIN
    USERS u ON a.user_id = u.user_id
WHERE
    t.project_id = 101;


-------------------------------------------------------------------------------------------------------------------------------

-- Data Analysis 9

SELECT
    t.task_id,
    t.task_name,
    t.task_description,
    l.label_name
FROM
    TASKS t
JOIN
    TASKLABELS tl ON t.task_id = tl.task_id
JOIN
    LABELS l ON tl.label_id = l.label_id
JOIN
    ASSIGNMENTS a ON t.task_id = a.task_id
WHERE
    a.user_id = 3;



SELECT
    p.project_id,
    p.project_name,
    COUNT(t.task_id) AS task_count
FROM
    PROJECTS p
LEFT JOIN
    TASKS t ON p.project_id = t.project_id
GROUP BY
    p.project_id, p.project_name;