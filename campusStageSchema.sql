# CampusStage database schema (MySQL)

CREATE DATABASE IF NOT EXISTS CampusStage;
USE CampusStage;

# Entities

CREATE TABLE Attendees (
    attendeeID INT AUTO_INCREMENT PRIMARY KEY,
    username   VARCHAR(50)  NOT NULL UNIQUE,
    password   VARCHAR(255) NOT NULL,
    name       VARCHAR(100) NOT NULL,
    email      VARCHAR(100) NOT NULL
);

CREATE TABLE Organizers (
    organizerID INT AUTO_INCREMENT PRIMARY KEY,
    username    VARCHAR(50)  NOT NULL UNIQUE,
    password    VARCHAR(255) NOT NULL,
    name        VARCHAR(100) NOT NULL,
    email       VARCHAR(100) NOT NULL
);

CREATE TABLE Performers (
    performerID INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    genre       VARCHAR(50)
);

CREATE TABLE Venues (
    venueID  INT AUTO_INCREMENT PRIMARY KEY,
    name     VARCHAR(100) NOT NULL,
    location VARCHAR(150),
    capacity INT NOT NULL CHECK (capacity > 0)
);


CREATE TABLE Events (
    eventID          INT AUTO_INCREMENT PRIMARY KEY,
    venueID          INT NOT NULL,
    name             VARCHAR(150) NOT NULL,
    eventDate        DATE NOT NULL,
    eventTime        TIME NOT NULL,
    ticketPrice      DECIMAL(6,2) NOT NULL DEFAULT 0.00,
    reservationLimit INT NOT NULL CHECK (reservationLimit > 0),
    status           ENUM('Scheduled','Cancelled') NOT NULL DEFAULT 'Scheduled',
    FOREIGN KEY (venueID) REFERENCES Venues(venueID)
);


CREATE TABLE Tickets (
    ticketID        INT AUTO_INCREMENT PRIMARY KEY,
    eventID         INT NOT NULL,
    attendeeID      INT NOT NULL,
    reservationDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status          ENUM('Reserved','Cancelled') NOT NULL DEFAULT 'Reserved',
    FOREIGN KEY (eventID)    REFERENCES Events(eventID),
    FOREIGN KEY (attendeeID) REFERENCES Attendees(attendeeID)
);


CREATE TABLE EventPerformers (
    eventID     INT NOT NULL,
    performerID INT NOT NULL,
    PRIMARY KEY (eventID, performerID),
    FOREIGN KEY (eventID)     REFERENCES Events(eventID),
    FOREIGN KEY (performerID) REFERENCES Performers(performerID)
);


CREATE TABLE EventOrganizers (
    eventID     INT NOT NULL,
    organizerID INT NOT NULL,
    PRIMARY KEY (eventID, organizerID),
    FOREIGN KEY (eventID)     REFERENCES Events(eventID),
    FOREIGN KEY (organizerID) REFERENCES Organizers(organizerID)
);