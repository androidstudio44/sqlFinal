CREATE TABLE Members (
  MemberID INTEGER PRIMARY KEY,
  FirstName TEXT NOT NULL,
  LastName TEXT NOT NULL,
  Email TEXT,
  Phone TEXT,
  JoinDate DATE NOT NULL
);

CREATE TABLE Trainers (
  TrainerID INTEGER PRIMARY KEY,
  FirstName TEXT NOT NULL,
  LastName TEXT NOT NULL,
  Email TEXT,
  Phone TEXT,
  HireDate DATE NOT NULL
);

CREATE TABLE Classes (
  ClassID INTEGER PRIMARY KEY,
  ClassName TEXT NOT NULL,
  Description TEXT,
  TrainerID INTEGER NOT NULL,
  Schedule TEXT NOT NULL,
  Capacity INTEGER NOT NULL,
  FOREIGN KEY (TrainerID) REFERENCES Trainers(TrainerID)
);

CREATE TABLE Equipment (
  EquipmentID INTEGER PRIMARY KEY,
  Name TEXT NOT NULL,
  Type TEXT NOT NULL,
  Manufacturer TEXT,
  PurchaseDate DATE NOT NULL,
  Status TEXT NOT NULL
);

INSERT INTO Members (MemberID, FirstName, LastName, Email, Phone, JoinDate)
VALUES
  (1, 'Aman', 'Asanbekov', 'amanasanbekov@gmail.com', '123456789', '2023-01-01'),
  (2, 'aa', 'bb', 'aabb@gmail.com', '987654321', '2023-02-01');

INSERT INTO Trainers (TrainerID, FirstName, LastName, Email, Phone, HireDate)
VALUES
  (1, 'cc', 'dd', 'ccdd@gmail.com', '555555555', '2022-12-01'),
  (2, 'yy', 'zz', 'yyzz@gmail.com', '666666666', '2023-03-01');

INSERT INTO Classes (ClassID, ClassName, Description, TrainerID, Schedule, Capacity)
VALUES
  (1, 'Yoga', 'Relaxing yoga class', 1, 'Monday 10:00 AM', 20),
  (2, 'Zumba', 'High-energy dance fitness', 2, 'Wednesday 6:00 PM', 30);

INSERT INTO Equipment (EquipmentID, Name, Type, Manufacturer, PurchaseDate, Status)
VALUES
  (1, 'Treadmill', 'Cardio', 'XYZ Fitness', '2022-10-01', 'Available'),
  (2, 'Dumbbells', 'Strength', 'ABC Fitness', '2022-11-01', 'Available');

SELECT * FROM Members;

SELECT Trainers.TrainerID, Trainers.FirstName, Trainers.LastName, Classes.ClassName
FROM Trainers
JOIN Classes ON Trainers.TrainerID = Classes.TrainerID;

SELECT * FROM Equipment WHERE Status = 'Available';

SELECT Classes.ClassID, Classes.ClassName
FROM Classes
WHERE Classes.Capacity <= (SELECT COUNT(*) FROM Members WHERE Members.ClassID = Classes.ClassID);
