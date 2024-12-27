
CREATE TABLE Theatre (
    Theatre_ID INT AUTO_INCREMENT PRIMARY KEY,
    Theatre_Name VARCHAR(255) NOT NULL,
    Theatre_Location VARCHAR(255) NOT NULL
);

INSERT INTO Theatre (Theatre_Name, Theatre_Location) VALUES
('PVR Cinemas', 'Dehradun'),
('Cinepolis', 'Gurugram');

CREATE TABLE Movie (
    Movie_ID INT AUTO_INCREMENT PRIMARY KEY,
    Movie_Title VARCHAR(255) NOT NULL,
    Genre VARCHAR(100),
    Duration INT,
    Language VARCHAR(100)
);

INSERT INTO Movie (Movie_Title, Genre, Duration, Language) VALUES
('La La Land', 'Romance', 181, 'English'),
('Pushpa 2', 'Action', 210, 'Hindi');


CREATE TABLE Movie_Show (
    Show_ID INT AUTO_INCREMENT PRIMARY KEY,
    Theatre_ID INT,
    Movie_ID INT,
    Show_Date DATE,
    Show_Time TIME,
    Price DECIMAL(10, 2),
    FOREIGN KEY (Theatre_ID) REFERENCES Theatre(Theatre_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID)
);


INSERT INTO Movie_Show (Theatre_ID, Movie_ID, Show_Date, Show_Time, Price) VALUES
(1, 1, '2024-12-25', '14:00:00', 12.50),
(1, 2, '2024-12-25', '16:30:00', 10.00),
(2, 1, '2024-12-25', '13:00:00', 15.00);


CREATE TABLE Ticket (
    Ticket_ID INT AUTO_INCREMENT PRIMARY KEY,
    Show_ID INT,
    Customer_Name VARCHAR(255),
    Customer_Email VARCHAR(255),
    Ticket_Quantity INT,
    Total_Price DECIMAL(10, 2),
    FOREIGN KEY (Show_ID) REFERENCES Movie_Show(Show_ID)
);


INSERT INTO Ticket (Show_ID, Customer_Name, Customer_Email, Ticket_Quantity, Total_Price) VALUES
(1, 'Sachin Deoli', 'sachin@example.com', 2, 25.00),
(2, 'Ayush', 'ayush@example.com', 1, 10.00);


CREATE TABLE Booking (
    Booking_ID INT AUTO_INCREMENT PRIMARY KEY,
    Ticket_ID INT,
    Booking_Date DATETIME,
    FOREIGN KEY (Ticket_ID) REFERENCES Ticket(Ticket_ID)
);


INSERT INTO Booking (Ticket_ID, Booking_Date) VALUES
(1, '2024-12-24 10:30:00'),
(2, '2024-12-24 11:00:00');





-- Query to List All Shows on a Given Date and Theatre (P2)

SELECT 
    S.Show_ID,
    M.Movie_Title,
    S.Show_Date,
    S.Show_Time,
    S.Price
FROM 
    Movie_Show S
JOIN 
    Movie M ON S.Movie_ID = M.Movie_ID
JOIN 
    Theatre T ON S.Theatre_ID = T.Theatre_ID
WHERE 
    S.Show_Date = '2024-12-25'  -- Example date
    AND T.Theatre_Name = 'PVR Cinemas'  -- Example theatre
ORDER BY 
    S.Show_Time;




