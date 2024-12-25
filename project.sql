create database hospitalmanagementsystem;

use hospitalmanagementsystem;

create table patients(
patientid int primary key auto_increment,
patientname varchar(90) not null,
dateofbirth date,
age int,
gender varchar(80),
phoneno varchar(20) unique,
emialid varchar(80),
address varchar(200) 
);

create table doctor(
doctorid int primary key auto_increment, 
doctorname varchar(90) not null,
specialization varchar(90),
age int,
gender varchar(60) not null,
phoneno varchar(20) unique,
emailid varchar(90)
);

create table appointment(
appointmentid int primary key auto_increment,
patientid int,
doctorid int,
appointmentdate date,
appointmenttime time,
reason_for_visit varchar(300),
foreign key (patientid) references patients(patientid),
foreign key (doctorid) references doctor(doctorid)
);

create table medicalrecords(
recordid int primary key,
patientid int,
doctorid int,
visitdate date,
diagnosis varchar(300),
treatment varchar(300),
foreign key (patientid) references patients(patientid),
foreign key (doctorid) references doctor(doctorid)
);

ALTER TABLE patients ADD COLUMN emailid VARCHAR(80);
 
insert into patients (patientname, dateofbirth, age, gender, phoneno, emailid, address)values
('Alice Johnson', '1990-01-01', 34, 'Female', '123-456-7890', 'alice.johnson@example.com', '123 Main St, Cityville'),
('Bob Smith', '1985-02-15', 39, 'Male', '123-456-7891', 'bob.smith@example.com', '456 Oak St, Townsville'), 
('Carol White', '1992-03-12', 32, 'Female', '123-456-7892', 'carol.white@example.com', '789 Pine St, Villageville'), 
('David Brown', '1988-04-22', 36, 'Male', '123-456-7893', 'david.brown@example.com', '101 Maple St, Hamletville'), 
('Emily Davis', '1995-05-30', 29, 'Female', '123-456-7894', 'emily.davis@example.com', '202 Birch St, Suburbville'), 
('Franklin Green', '1983-06-25', 41, 'Male', '123-456-7895', 'franklin.green@example.com', '303 Cedar St, Metroville'), 
('Grace Lee', '1996-07-18', 28, 'Female', '123-456-7896', 'grace.lee@example.com', '404 Elm St, Ruralville'), 
('Henry Young', '1991-08-09', 33, 'Male', '123-456-7897', 'henry.young@example.com', '505 Walnut St, Uptownville'), 
('Ivy Martinez', '1994-09-23', 30, 'Female', '123-456-7898', 'ivy.martinez@example.com', '606 Spruce St, Downtownville'), 
('Jack Wilson', '1987-10-11', 37, 'Male', '123-456-7899', 'jack.wilson@example.com', '707 Willow St, Seasideville');

ALTER TABLE doctor MODIFY doctorname VARCHAR(50);

ALTER TABLE doctor MODIFY phoneno VARCHAR(20);

ALTER TABLE doctor MODIFY emailid VARCHAR(100);

ALTER TABLE doctor MODIFY specialization VARCHAR(100);



INSERT INTO doctor (doctorid, doctorname, specialization, age, gender, phoneno, emailid) VALUES 
(1, 'Dr. John Doe', 'Cardiology', 45, 'Male', '123-456-7892', 'john.doe@example.com'), 
(2, 'Dr. Jane Smith', 'Neurology', 38, 'Female', '123-456-7893', 'jane.smith@example.com'), 
(3, 'Dr. William Johnson', 'Orthopedics', 50, 'Male', '123-456-7894', 'william.johnson@example.com'), 
(4, 'Dr. Emily Davis', 'Pediatrics', 34, 'Female', '123-456-7895', 'emily.davis@example.com'),
(5, 'Dr. Michael Brown', 'Dermatology', 42, 'Male', '123-456-7896', 'michael.brown@example.com');

insert into appointment (patientid, doctorid, appointmentdate, appointmenttime, reason_for_visit) values
(1, 1, '2024-12-22', '09:00:00', 'Skin Check-up'),
(2, 3, '2024-12-22', '10:00:00', 'Rash Treatment'),
(3, 2, '2024-12-23', '11:00:00', 'Allergy Consultation'),
(4, 4, '2024-12-23', '12:00:00', 'Mole Removal'),
(5, 5, '2024-12-24', '13:00:00', 'Acne Treatment'),
(6, 3, '2024-12-24', '14:00:00', 'Psoriasis Management'),
(7, 1, '2024-12-25', '15:00:00', 'Eczema Follow-up'),
(8, 1, '2024-12-25', '16:00:00', 'Skin Infection'),
(9, 4, '2024-12-26', '17:00:00', 'Wart Removal'),
(10,4, '2024-12-26', '18:00:00', 'Dermatology Check-up');

ALTER TABLE medicalrecords MODIFY diagnosis VARCHAR(255);

ALTER TABLE medicalrecords MODIFY treatment VARCHAR(255);



insert into medicalrecords (recordid, patientid, doctorid, visitdate, diagnosis, treatment) values
(1, 1, 1, '2024-12-22', 'Routine Check-up', 'Regular exercise and healthy diet'),
(2, 2, 3, '2024-12-22', 'Migraine', 'Medication and stress management'),
(3, 3, 2, '2024-12-23', 'Back Pain', 'Physical therapy and pain relief medication'),
(4, 4, 4, '2024-12-23', 'Skin Rash', 'Topical ointment'),
(5, 5, 5, '2024-12-24', 'Fever', 'Rest and hydration'),
(6, 6, 3, '2024-12-24', 'Prenatal Check-up', 'Regular prenatal vitamins'),
(7, 7, 1, '2024-12-25', 'Cancer Screening', 'Further diagnostic tests'),
(8, 8, 1, '2024-12-25', 'Diabetes Management', 'Insulin therapy and diet plan'),
(9, 9, 4, '2024-12-26', 'Stomach Ache', 'Antacid and diet modification'),
(10, 10, 4, '2024-12-26', 'Eye Exam', 'Prescription glasses');

select * from patients;

select* from doctor;

select * from appointment;

select * from medicalrecords;



  select a.patientid, a.doctorid, m.visitdate, m.diagnosis, m.treatment 
from appointment as a
right join medicalrecords as m
on a.doctorid= m.doctorid order by patientid asc;

select a.patientid,p.patientname, a.doctorid, a.appointmenttime, m.diagnosis, m.treatment
from appointment as a
left join medicalrecords as m
on a.doctorid= m.doctorid
join patients as p on p.patientid = a.patientid;

select a.patientid, a.doctorid, d.doctorname, a.appointmenttime, m.diagnosis, m.treatment
from appointment as a
left join medicalrecords as m
on a.doctorid= m.doctorid
join doctor as d on d.doctorid = m. doctorid;

select a.patientid,p.patientname, a.doctorid, d.doctorname, a.appointmenttime, m.diagnosis, m.treatment
from appointment as a
left join  medicalrecords as m
on a.doctorid= m.doctorid
join doctor as d on d.doctorid = m. doctorid
join patients as p on p.patientid = a.patientid;

select a.patientid,p.patientname, a.doctorid, d.doctorname, a.appointmenttime, m.diagnosis, m.treatment
from appointment as a
left JOIN medicalrecords as m
ON a.doctorid= m.doctorid
join doctor as d on d.doctorid = m. doctorid
join patients as p on p.patientid = a.patientid
where d.doctorid in (2,4,5);


select d.doctorid, d.doctorname from doctor as d 
join appointment as a
 on d.doctorid = a.doctorid
 group by d.doctorid having count(a.doctorid) > 1;
 
 select d.doctorname, count(a.appointmentid) as totalappointments
 from doctor as d
 join appointment as a
 on d.doctorid = a.doctorid
 group by d.doctorname;
 
 select * from doctor 
 where doctorid =5;
 
 update patients  set phoneno = '678-567-7890'
 where patientid = 10;

 select * from patients; 
 