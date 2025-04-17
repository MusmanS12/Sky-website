--
-- File generated with SQLiteStudio v3.4.4 on Tue Apr 1 12:04:21 2025
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Admins
CREATE TABLE IF NOT EXISTS Admins (admin_ID INTEGER PRIMARY KEY UNIQUE NOT NULL, admin_permission TEXT NOT NULL, user_ID INTEGER REFERENCES Users (user_ID) NOT NULL, summary_ID INTEGER NOT NULL);

-- Table: Departments
CREATE TABLE IF NOT EXISTS Departments (department_ID INTEGER PRIMARY KEY UNIQUE NOT NULL, department_Name VARCHAR NOT NULL);

-- Table: Departments Summary
CREATE TABLE IF NOT EXISTS "Departments Summary" (dept_Summary_ID INTEGER PRIMARY KEY NOT NULL UNIQUE, overall_Green_Vote INTEGER NOT NULL, overall_Amber_Vote INTEGER NOT NULL, overall_Red_Vote INTEGER NOT NULL, session_ID INTEGER REFERENCES Sessions (session_ID) NOT NULL, department_ID INTEGER REFERENCES Departments (department_ID) NOT NULL);

-- Table: HealthCards
CREATE TABLE IF NOT EXISTS HealthCards (card_ID INTEGER PRIMARY KEY UNIQUE NOT NULL, card_Title VARCHAR NOT NULL, card_Description TEXT NOT NULL, card_Creation TIMESTAMP NOT NULL, card_Priority VARCHAR NOT NULL, card_Status VARCHAR NOT NULL);

-- Table: Sessions
CREATE TABLE IF NOT EXISTS Sessions (session_ID INTEGER PRIMARY KEY UNIQUE NOT NULL, session_Name TEXT NOT NULL, session_Date NUMERIC NOT NULL, session_Start_Time NUMERIC NOT NULL, session_End_Time NUMERIC NOT NULL, session_Type TEXT NOT NULL, session_Status TEXT NOT NULL);

-- Table: Teams
CREATE TABLE IF NOT EXISTS Teams (team_ID INTEGER PRIMARY KEY UNIQUE NOT NULL, team_Name VARCHAR NOT NULL, team_Size INTEGER NOT NULL, team_Description TEXT NOT NULL, team_Leader_ID INTEGER REFERENCES Users (user_ID) NOT NULL, department_ID INTEGER REFERENCES Departments (department_ID) NOT NULL);

-- Table: Teams Summary
CREATE TABLE IF NOT EXISTS "Teams Summary" (summary_ID INTEGER PRIMARY KEY UNIQUE NOT NULL, summary_Green_Vote INTEGER NOT NULL, summary_Red_Vote INTEGER NOT NULL, summary_Amber_Vote INTEGER NOT NULL, team_ID INTEGER REFERENCES Teams (team_ID) NOT NULL, session_ID INTEGER REFERENCES Sessions (session_ID) NOT NULL, card_ID INTEGER REFERENCES HealthCards (card_ID) NOT NULL);

-- Table: Users
CREATE TABLE IF NOT EXISTS Users (user_ID INTEGER PRIMARY KEY UNIQUE NOT NULL, user_Full_Name VARCHAR NOT NULL, user_Email VARCHAR NOT NULL, user_Contact_No VARCHAR NOT NULL, user_Password VARCHAR NOT NULL, user_Role VARCHAR NOT NULL, user_DOB DATE NOT NULL);

-- Table: Votes
CREATE TABLE IF NOT EXISTS Votes (vote_ID INTEGER PRIMARY KEY UNIQUE NOT NULL, voteStatus VARCHAR NOT NULL, vote_Progress INTEGER NOT NULL, user_ID INTEGER REFERENCES Users (user_ID) NOT NULL, team_ID INTEGER REFERENCES Teams (team_ID) NOT NULL, session_ID INTEGER REFERENCES Sessions (session_ID) NOT NULL, card_ID INTEGER REFERENCES HealthCards (card_ID) NOT NULL);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
