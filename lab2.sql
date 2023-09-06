-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS professor
(
    p_email VARCHAR(50) NOT NULL,
    p_name VARCHAR(100),
    office VARCHAR(10) UNIQUE,
    PRIMARY KEY(p_email)
);

CREATE TABLE IF NOT EXISTS students
(
    s_email VARCHAR(50) NOT NULL,
    s_name VARCHAR(100) NOT NULL,
    major VARCHAR(10) NOT NULL,
    PRIMARY KEY(s_email)
);

CREATE TABLE IF NOT EXISTS courses
(
    c_number VARCHAR(50) NOT NULL,
    c_name VARCHAR(100) NOT NULL,
    room VARCHAR(10) NOT NULL,
    p_email VARCHAR(50) NOT NULL,
    PRIMARY KEY(c_number)
);

CREATE TABLE IF NOT EXISTS enroll
(
    s_email VARCHAR(50) NOT NULL,
    c_number VARCHAR(50) NOT NULL,
    PRIMARY KEY(s_email, c_number)
);


-- Create FKs
ALTER TABLE professor
    ADD    FOREIGN KEY (p_email)
    REFERENCES courses(p_email)
    MATCH SIMPLE
;
    
ALTER TABLE courses
    ADD    FOREIGN KEY (c_number)
    REFERENCES enroll(c_number)
    MATCH SIMPLE
;
    
ALTER TABLE enroll
    ADD    FOREIGN KEY (s_email)
    REFERENCES students(s_email)
    MATCH SIMPLE
;
    

-- Create Indexes
