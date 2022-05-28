CREATE TABLE AIRPORT(
	Airport_Code INT NOT NULL,
	City VarChar(15) NOT NULL,
	State_ VarChar(15) NOT NULL,
	Name_ VarChar(20) Not NULL,
	PRIMARY KEY (Airport_Code)
	);

CREATE TABLE AIRPLANE_TYPE(
	TypeName VarChar(15) NOT NULL,
	Max_seats INT NOT NULL,
	Company VarChar(20) NOT NULL,
	PRIMARY KEY (TypeName)
	);

CREATE TABLE AIRPLANE(
	Airplane_id INT NOT NULL,
	Total_no_of_seats INT NOT NULL,
	FK_Type VarChar(15) REFERENCES AIRPLANE_TYPE(TypeName) NOT NULL,
	PRIMARY KEY (Airplane_id)
	);

CREATE TABLE CAN_LAND(
	Airplane_code2 INT REFERENCES AIRPORT(Airport_Code) NOT NULL,
	Type_name2 VarChar(15) REFERENCES AIRPLANE_TYPE(TypeName) NOT NULL,
	PRIMARY KEY (Airplane_code2,Type_name2)
	);

CREATE TABLE FLIGHT(
	Number INT NOT NULL,
	Airline VarChar(20) NOT NULL,
	Weekdays VarChar(30) NOT NULL,
	PRIMARY KEY (Number)
	);

CREATE TABLE FLIGHT_LEG(
	Leg_no INT NOT NULL,
	Schedule_dep_time TIME NOT NULL,
	Schedule_arr_time TIME NOT NULL,
	FK_Airport_Code1 INT REFERENCES AIRPORT(Airport_Code) NOT NULL,
	FK_Airport_Code2 INT REFERENCES AIRPORT(Airport_Code) NOT NULL,
	FK_Number INT REFERENCES FLIGHT(Number) NOT NULL,
	PRIMARY KEY (Leg_no)
	);

CREATE TABLE LEG_INSTANCE(
	Date_ DATE NOT NULL,
	No_of_avail_seats INT NOT NULL,
	Dep_time TIME NOT NULL,
	Arr_time TIME NOT NULL,
	FK_Airplane_id INT REFERENCES AIRPLANE(Airplane_id) NOT NULL,
	FK_Airport_Code INT REFERENCES AIRPORT(Airport_Code) NOT NULL,
	FK_Leg_no INT REFERENCES FLIGHT_LEG(Leg_no) NOT NULL,
	PRIMARY KEY (Date_)
	);

CREATE TABLE SEAT(
	Seat_no INT NOT NULL,
	Customer_name VarChar(20) NOT NULL,
	Cphone INT NOT NULL,
	FK_Date DATE REFERENCES LEG_INSTANCE(Date_) NOT NULL,
	PRIMARY KEY (Seat_no)
	);

CREATE TABLE FARE(
	Code INT NOT NULL,
	Amount INT NOT NULL,
	Restrictions VarChar(30) NOT NULL,
	FK_Number INT REFERENCES FLIGHT(Number) NOT NULL,
	PRIMARY KEY (Code)
	);
