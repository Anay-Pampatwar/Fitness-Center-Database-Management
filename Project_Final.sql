USE Group2Final;

/* Group Project- DAMG 6210
* July 31st, 2023
*/
--Create Tables for the model
create table MemberProfiles
(MemberID int primary key,
MemberFirstName varchar(20),
MemberLastName varchar(20),
MemberEmail varchar(30),
MemberPhone varchar(22), --Allows International and varied Formatting
MembershipType varchar(20)
);
create table Memberships
(MembershipID int primary key,
MemberID int references MemberProfiles(MemberID),
JoinedDate date,
MemberStatus smallint
);
create table Payment
(PaymentID int primary key,
MemberID int references MemberProfiles(MemberID),
Amount varchar (20),
PaymentDate date,
PaymentType varchar(20)
);
create table Locker
(LockerID int primary key,
MemberID int references MemberProfiles(MemberID),
RentalStartDate date,
RentalEndDate date
);
create table StaffProfiles
(StaffID int primary key,
StaffFirstName varchar(20),
StaffLastName varchar(20),
StaffRole varchar(20),
StaffEmail varchar(30),
);
create table Certifications
(CertificationID int primary key,
StaffID int references StaffProfiles(StaffID),
CertificationName varchar (50),
CertificationExpirationDate date,
);
create table ClassTypes
(ClassTypeID int primary key,
ClassName varchar (50),
Discipline varchar (50),
CertificationID int references Certifications(CertificationID),
);
create table FitnessClasses
(ClassID int primary key,
ClassDateTime datetime,
ClassDuration int,
InstructorID int references StaffProfiles(StaffID),
ClassTypeID int references ClassTypes(ClassTypeID),
);
create table ClassAttendance
(AttendanceID int primary key,
MemberID int references MemberProfiles(MemberID),
FitnessClassID int references FitnessClasses(ClassID),
AttendanceDate date,
AttendanceStatus varchar(10),
Notes varchar(255)
);
create table EquipmentCatalog
(EquipmentID int primary key,
ItemDescription varchar (255),
Condition varchar (50),
PurchaseDate date,
Vendor varchar(20)
);
create table EquipmentMaintenance
(EquipmentMaintenanceID int primary key,
EquipmentID int references EquipmentCatalog(EquipmentID),
MaintenanceEvent varchar(255),
MaintenanceDateTime datetime,
ServiceTechnician varchar(100),
Notes varchar(255)
);
create table CalendarDim
(DateIndex date primary key,
DayOfWeek varchar (10)
);

-- Insert Statements for the tables

INSERT INTO MemberProfiles (MemberID, MemberFirstName, MemberLastName, MemberEmail, MemberPhone, MembershipType)
VALUES
(1, 'John', 'Doe', 'john.doe@yahoo.com', '123-456-7890', 'Premium'),
(2, 'Bob', 'Tang', 'bob.tang@gmail.com', '447-912-3456', 'Basic'),
(3, 'Michael', 'Jordan', 'michael.jordan@yahoo.com', '612-987-5432', 'Standard'),
(4, 'Sarah', 'Smith', 'sarah.smith@yahoo.com', '789-456-1230', 'Standard'),
(5, 'Emily', 'Johnson', 'emily.johnson@gmail.com', '234-567-8901', 'Basic'),
(6, 'David', 'Lee', 'david.lee@yahoo.com', '789-012-3456', 'Standard'),
(7, 'Sophia', 'Wang', 'sophia.wang@gmail.com', '987-654-3210', 'Premium'),
(8, 'Daniel', 'Brown', 'daniel.brown@hotmail.com', '123-987-6543', 'Basic'),
(9, 'Olivia', 'Miller', 'olivia.miller@yahoo.com', '456-789-0123', 'Standard'),
(10, 'Emma', 'Anderson', 'emma.anderson@gmail.com', '987-654-3210', 'Premium');

INSERT INTO Memberships (MembershipID, MemberID, JoinedDate, MemberStatus)
VALUES
(1, 1, '2023-08-01', 1),
(2, 2, '2023-08-15', 1),
(3, 3, '2023-07-10', 1),
(4, 4, '2023-08-22', 1),
(5, 5, '2023-08-05', 1),
(6, 6, '2023-08-18', 1),
(7, 7, '2023-08-12', 1),
(8, 8, '2023-08-25', 1),
(9, 9, '2023-08-07', 1),
(10, 10, '2023-08-14', 1);

INSERT INTO Payment (PaymentID, MemberID, Amount, PaymentDate, PaymentType)
VALUES
(1, 1, '100.00', '2023-07-05', 'Credit Card'),
(2, 2, '50.00', '2023-07-20', 'PayPal'),
(3, 3, '75.00', '2023-07-12', 'Cash'),
(4, 4, '120.00', '2023-07-25', 'Credit Card'),
(5, 5, '70.00', '2023-07-08', 'PayPal'),
(6, 6, '90.00', '2023-07-17', 'Credit Card'),
(7, 7, '110.00', '2023-07-11', 'Cash'),
(8, 8, '60.00', '2023-07-28', 'Credit Card'),
(9, 9, '80.00', '2023-07-10', 'PayPal'),
(10, 10, '95.00', '2023-07-14', 'Cash');

INSERT INTO Locker (LockerID, MemberID, RentalStartDate, RentalEndDate)
VALUES
(1, 1, '2023-09-01', '2023-10-01'),
(2, 2, '2023-09-15', '2023-10-15'),
(3, 3, '2023-09-10', '2023-10-10'),
(4, 4, '2023-09-22', '2023-10-22'),
(5, 5, '2023-09-05', '2023-10-05'),
(6, 6, '2023-09-18', '2023-10-18'),
(7, 7, '2023-09-12', '2023-10-12'),
(8, 8, '2023-09-25', '2023-10-25'),
(9, 9, '2023-09-07', '2023-10-07'),
(10, 10, '2023-09-14', '2023-10-14');

INSERT INTO StaffProfiles (StaffID, StaffFirstName, StaffLastName, StaffRole, StaffEmail)
VALUES
(11, 'Joe', 'Maguire', 'Fitness Instructor', 'jog.maguire@gmail.com'),
(12, 'Leslie', 'Brown', 'Personal Trainer', 'leslie.brown@yahoo.com'),
(13, 'Tim', 'Cook', 'Yoga Instructor', 'tim.cook@yahoo.com'),
(14, 'Anna', 'Smith', 'Nutritionist', 'anna.smith@hotmail.com'),
(15, 'Michael', 'Lee', 'Gym Manager', 'michael.lee@gmail.com'),
(16, 'Sara', 'Johnson', 'Fitness Instructor', 'sara.johnson@gmail.com'),
(17, 'Kevin', 'Wang', 'Personal Trainer', 'kevin.wang@yahoo.com'),
(18, 'Emily', 'Davis', 'Yoga Instructor', 'emily.davis@gmail.com'),
(19, 'Daniel', 'Clark', 'Nutritionist', 'daniel.clark@yahoo.com'),
(20, 'Amy', 'Wilson', 'Gym Manager', 'amy.wilson@gmail.com');

INSERT INTO Certifications (CertificationID, StaffID, CertificationName, CertificationExpirationDate)
VALUES
(14, 11, 'Group Zumba Certification', '2025-12-31'),
(15, 12, 'Weight Training Certification', '2023-11-15'),
(16, 13, 'Yoga Instructor Certification', '2024-11-30'),
(17, 14, 'Fitness Mentor Certification', '2023-06-26),
(18, 15, ‘State Coach on Weight Training Certification', '2023-08-15'),
(19, 16, 'State Yoga Certification', '2024-11-30'),
(20, 17, 'Midwest Weight Training Certification', '2024-06-26),
(21, 18, 'Happy Coast Yoga Certification', '2024-11-30'),
(22, 19, 'West Coast Yoga Certification', '2025-11-30'),
(23, 20, 'County Fitness Certification', '2025-11-30');

INSERT INTO ClassTypes (ClassTypeID, ClassName, Discipline, CertificationID)
VALUES
(17, 'Zumba', 'Aerobic Dance', 14),
(18, 'Weight Lifting', 'Fitness', 15),
(19, 'Yoga', 'Yoga', 16),
(20, 'Pilates', 'Fitness', 17),
(21, 'Spin Cycle', 'Cardio', 18),
(22, 'HIIT', 'Fitness', 19),
(23, 'Kickboxing', 'Martial Arts', 20),
(24, 'Piloxing', 'Fitness', 21),
(25, 'Tai Chi', 'Martial Arts', 22),
(26, 'Barre', 'Fitness', 23);

INSERT INTO FitnessClasses (ClassID, ClassDateTime, ClassDuration, InstructorID, ClassTypeID)
VALUES
(20, '2023-09-10 15:00:00', 60, 11, 17),
(21, '2023-11-12 19:30:00', 45, 12, 18),
(22, '2023-12-15 20:00:00', 90, 13, 19),
(23, '2023-09-22 18:00:00', 60, 14, 20),
(24, '2023-10-05 17:30:00', 45, 15, 21),
(25, '2023-10-15 19:00:00', 60, 16, 22),
(26, '2023-10-28 16:30:00', 90, 17, 23),
(27, '2023-11-07 14:00:00', 60, 18, 24),
(28, '2023-11-18 17:00:00', 45, 19, 25),
(29, '2023-12-01 18:30:00', 60, 20, 26);

INSERT INTO ClassAttendance (AttendanceID, MemberID, FitnessClassID, AttendanceDate, AttendanceStatus, Notes)
VALUES
(22, 1, 20, '2023-09-10', 'Present', 'Showed Up On Time'),
(23, 2, 21, '2023-11-12', 'Absent', 'No notice'),
(24, 3, 22, '2023-12-15', 'Present', 'Attentive and Participated'),
(25, 4, 23, '2023-09-22', 'Present', 'Improved Form'),
(26, 5, 24, '2023-10-05', 'Absent', 'Sick, Informed in Advance'),
(27, 6, 25, '2023-10-15', 'Present', 'Energetic and Motivated'),
(28, 7, 26, '2023-10-28', 'Absent', 'Traveling, Notified Beforehand'),
(29, 8, 27, '2023-11-07', 'Present', 'Focused on Strength Training'),
(30, 9, 28, '2023-11-18', 'Present', 'Perfect Attendance'),
(31, 10, 29, '2023-12-01', 'Absent', 'Emergency, Called to Inform');

INSERT INTO EquipmentCatalog (EquipmentID, ItemDescription, Condition, PurchaseDate, Vendor)
VALUES
(25, 'Treadmill', 'Good', '2023-05-15', 'Fitness.'),
(26, 'Dumbbells Set', 'Excellent', '2023-06-20', 'Gym.'),
(27, 'Yoga Mats', 'New', '2023-07-01', 'Yoga'),
(28, 'Stationary Bike', 'Poor', '2023-05-15', 'Fitness.'),
(29, 'Leg Extension', 'Good', '2023-09-20', 'Gym.'),
(30, 'Cable Crossover', 'New', '2023-09-01', 'Gym.'),
(31, 'Flat Bench', 'Excellent', '2024-02-20', 'Gym.'),
(32, 'Smith Machine', 'Good', '2024-09-01', 'Gym.'),
(33, 'Squat Rack', 'Excellent', '2026-09-01', 'Gym.');

INSERT INTO EquipmentMaintenance (EquipmentMaintenanceID, EquipmentID, MaintenanceEvent, MaintenanceDateTime, ServiceTechnician, Notes)
VALUES
(28, 25, 'Routine Inspection', '2023-08-05 14:00:00', 'Joe Johnson', 'No issues found'),
(29, 26, 'Repair', '2023-11-18 09:30:00', 'Bob Smith', 'Replaced broken handle'),
(30, 27, 'Cleaning', '2023-12-10 11:00:00', 'David Lee', 'Regular cleaning'),
(31, 28, 'Routine Inspection', '2023-09-22 13:15:00', 'Sarah Wilson', 'Performed lubrication'),
(32, 29, 'Repair', '2023-10-05 10:45:00', 'Michael Johnson', 'Replaced worn-out belt'),
(33, 30, 'Cleaning', '2023-10-15 16:30:00', 'Emily Davis', 'Thoroughly sanitized'),
(34, 31, 'Routine Inspection', '2023-10-28 12:00:00', 'Daniel Clark', 'Checked calibration'),
(35, 32, 'Repair', '2023-11-07 14:30:00', 'Amy Wilson', 'Fixed loose connection'),
(36, 33, 'Cleaning', '2023-11-18 15:45:00', 'Kevin Wang', 'Removed dust buildup');


INSERT INTO CalendarDim (DateIndex, DayOfWeek)
VALUES
('2023-07-01', 'Saturday'),
('2023-07-02', 'Sunday'),
('2023-07-03', 'Monday'),
('2023-07-31', 'Monday'),
('2023-09-01', 'Saturday'),
('2023-09-02', 'Sunday'),
('2023-09-03', 'Monday'),
('2023-09-04', 'Monday'),
('2023-10-01', 'Saturday');

