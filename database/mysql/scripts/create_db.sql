CREATE DATABASE db_socialNetwork;
USE db_socialNetwork;


CREATE TABLE Network_User (
	id_user			INT PRIMARY KEY AUTO_INCREMENT,
    user_name		VARCHAR(25),
    birth_date		DATE,
    email			VARCHAR(64),
    pass			VARCHAR(256),
    country			VARCHAR(100),
    city			VARCHAR(100),
    followers		INT DEFAULT 0,
    friends			INT DEFAULT 0
);

CREATE TABLE Friend_Request (
	id_requester	INT,
    id_requested	INT,
    state			VARCHAR (9) CHECK(state = 'ACCEPTED' OR 'PENDING' OR 'REJECTED'),
    date_request	TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_requester, id_requested),
    FOREIGN KEY (id_requester) REFERENCES Network_User(id_user),
    FOREIGN KEY (id_requested) REFERENCES Network_User(id_user)
);

CREATE TABLE Friend (
	id_user_1		INT,
    id_user_2		INT,
    friend_date		TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY id_friend(id_user_1, id_user_2),
    FOREIGN KEY (id_user_1) REFERENCES Network_User (id_user),
    FOREIGN KEY (id_user_2) REFERENCES Network_User (id_user)
);

CREATE TABLE Post (
	id_post			INT PRIMARY KEY AUTO_INCREMENT,
    likes			INT DEFAULT 0,
    comments		INT DEFAULT 0,
    content			VARCHAR(256),
    type_autor		VARCHAR (4) CHECK (type_autor = 'USER' OR 'PAGE') NOT NULL,
    id_autor		INT NOT NULL,
    id_origin_pub	INT,
    post_date		TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_origin_pub) REFERENCES Post (id_post)
);

CREATE TABLE Pages (
	id_page			INT PRIMARY KEY AUTO_INCREMENT,
    page_name		VARCHAR(64),
    followers		INT DEFAULT 0,
    create_date		TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Page_Admin (
	id_page			INT,
    id_user			INT,
    rol				INT DEFAULT 1,
    FOREIGN KEY (id_user) REFERENCES Network_User (id_user),
    FOREIGN KEY (id_page) REFERENCES Pages (id_page)
);

CREATE TABLE Follow_User (
	id_following	INT,
    id_follower		INT,
    follow_date		TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id_following) REFERENCES Network_User (id_user),
    FOREIGN KEY (id_follower) REFERENCES Network_User (id_user),
    PRIMARY KEY id_follow_user (id_following, id_follower)
);

CREATE TABLE Follow_Page (
	id_user			INT,
    id_page			INT,
    follow_date		TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (id_user) REFERENCES Network_User (id_user),
    FOREIGN KEY (id_page) REFERENCES Pages (id_page),
    PRIMARY KEY id_follow_page (id_user, id_page)
);

CREATE TABLE Chat_User (
    id_user_1		INT,
    id_user_2		INT,
    FOREIGN KEY (id_user_1) REFERENCES Network_User (id_user),
    FOREIGN KEY (id_user_2) REFERENCES Network_User (id_user),
    PRIMARY KEY id_chat_user (id_user_1, id_user_2)
);

CREATE TABLE Chat_Page_User (
    id_user			INT,
    id_page			INT,
    FOREIGN KEY (id_user) REFERENCES Network_User (id_user),
    FOREIGN KEY (id_page) REFERENCES Pages (id_page),
    PRIMARY KEY id_chat_user_page (id_user, id_page)
);

CREATE TABLE Chat_Page (
    id_page_1		INT,
    id_page_2		INT,
    FOREIGN KEY (id_page_1) REFERENCES Pages (id_page),
    FOREIGN KEY (id_page_2) REFERENCES Pages (id_page),
    PRIMARY KEY id_chat_page (id_page_1, id_page_2)
);

