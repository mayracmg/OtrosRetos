CREATE TABLE DifficultyLevel (
	DifficultyLevelID INT NOT NULL AUTO_INCREMENT, 
	Name VARCHAR(20) NOT NULL, 
	IsActive TINYINT DEFAULT 1,
	PRIMARY KEY (DifficultyLevelID)
);

CREATE TABLE Category (
	CategoryID INT NOT NULL AUTO_INCREMENT, 
	Name VARCHAR(20) NOT NULL, 
	IsActive TINYINT DEFAULT 1,
	PRIMARY KEY (CategoryID)
);

CREATE TABLE ProgrammingLanguage (
	ProgrammingLanguageID INT NOT NULL AUTO_INCREMENT, 
	Name VARCHAR(50) NOT NULL, 
	PRIMARY KEY (ProgrammingLanguageID)
);

CREATE TABLE Hacker (
	HackerID VARCHAR(20) NOT NULL, 
	FirstName VARCHAR(50) NOT NULL, 
	LastName VARCHAR(50), 
	Email VARCHAR(100) UNIQUE, 
	PhoneNumber VARCHAR(20),
	CountryCode VARCHAR(3),
	IsActive TINYINT DEFAULT 1,
	PRIMARY KEY (HackerID)
);

CREATE TABLE MenuType (
	MenuTypeID INT NOT NULL AUTO_INCREMENT, 
	Name VARCHAR(20) NOT NULL, 
	IsActive TINYINT DEFAULT 1,
	PRIMARY KEY (MenuTypeID)
);

CREATE TABLE Menu (
	MenuID INT NOT NULL AUTO_INCREMENT, 
	Name VARCHAR(20) NOT NULL, 
	URLSuffix VARCHAR(100), 
	MenuTypeID INT NOT NULL,
	IsActive TINYINT DEFAULT 1,
	PRIMARY KEY (MenuID),
	FOREIGN KEY (MenuTypeID) REFERENCES MenuType(MenuTypeID)
);

CREATE TABLE Challenge (
	ChallengeID INT NOT NULL AUTO_INCREMENT, 
	ChallengeName VARCHAR(50) NOT NULL, 
	Description VARCHAR(50), 
	DifficultyLevelID INT NOT NULL,
	IsActive TINYINT DEFAULT 1,
	PRIMARY KEY (ChallengeID),
	FOREIGN KEY (DifficultyLevelID) REFERENCES DifficultyLevel(DifficultyLevelID)
);

CREATE TABLE ChallengeCategory (
	ChallengeID INT NOT NULL, 
	CategoryID INT NOT NULL, 
	PRIMARY KEY (ChallengeID, CategoryID),
	FOREIGN KEY (ChallengeID) REFERENCES Challenge(ChallengeID),
	FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE HackerChallenge (
	HackerID VARCHAR(20) NOT NULL, 
	ChallengeID INT NOT NULL,
	StartDate DATETIME,
	EnDate DATETIME,
	Score INT,
	ProgrammingLanguageID INT NOT NULL,
	PRIMARY KEY (HackerID, ChallengeID),
	FOREIGN KEY (HackerID) REFERENCES Hacker(HackerID),
	FOREIGN KEY (ChallengeID) REFERENCES Challenge(ChallengeID),
	FOREIGN KEY (ProgrammingLanguageID) REFERENCES ProgrammingLanguage(ProgrammingLanguageID)
);

CREATE TABLE ChallengeMenu (
	ChallengeID INT NOT NULL, 
	MenuID INT NOT NULL,
	PRIMARY KEY (ChallengeID, MenuID),
	FOREIGN KEY (ChallengeID) REFERENCES Challenge(ChallengeID),
	FOREIGN KEY (MenuID) REFERENCES Menu(MenuID)
);
