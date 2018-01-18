-- pet_for_adoption (name,image_url,description,sex,available_date,postcode)

CREATE DATABASE
petfinder;

CREATE TABLE dogs (
	id SERIAL PRIMARY KEY,
	name VARCHAR(300),
	breed VARCHAR(200),
	image_url VARCHAR(400),
	description VARCHAR(500),
	sex VARCHAR(20),
	available_date VARCHAR(400),
	postcode VARCHAR(4)
);

CREATE TABLE comments (
	id SERIAL PRIMARY KEY,
	body VARCHAR(500) NOT NULL,
	dog_id INTEGER NOT NULL,
	FOREIGN KEY (dog_id) REFERENCES dogs (id) ON DELETE RESTRICT,
	user_id INTEGER NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users (id),
	breed_id INTEGER,
	FOREIGN KEY (breed_id) REFERENCES breeds (id)
);

CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	email VARCHAR(300) NOT NULL,
	password_digest VARCHAR(400) NOT NULL
);

CREATE TABLE breeds (
	id SERIAL PRIMARY KEY,
	breed VARCHAR(300) NOT NULL,
	body VARCHAR(500)
);

ALTER TABLE comments	


This line means that you cannot delete the children until you delete the parent
FOREIGN KEY (dog_id) REFERENCES pet_for_adoption (id) ON DELETE RESTRICT


INSERT INTO dogs (name,breed,image_url,description,sex,available_date,postcode) VALUES ('Schutz', 'golden retriever', 'https://scontent.cdninstagram.com/vp/76a4a8382f907164b8ebe3e76bda5563/5AFEF646/t51.2885-15/s640x640/sh0.08/e35/16230568_1873466296224087_102178560462028800_n.jpg', 'Friendly and affectionate', 'male', 'March 2017', '3000');
INSERT INTO dogs (name,breed,image_url,description,sex,available_date,postcode) VALUES ('Loofy', 'shetland sheep dog', 'https://scontent.cdninstagram.com/vp/5db17cf0c89e48a170c79b4cd8a38f4c/5AFA7FFB/t51.2885-15/s640x640/sh0.08/e35/15099334_319833181736087_6279698750365499392_n.jpg', 'Very fluffy and requires extra attention', 'male', 'June 2017', '3200');
INSERT INTO dogs (name,breed,image_url,description,sex,available_date,postcode) VALUES ('Boo', 'pomerianian', 'https://pbs.twimg.com/media/CapLTc3UAAAbTyl.jpg', 'Requires ongoing fur styling, very child friendly', 'male', 'February 2018', '3023');
INSERT INTO dogs (name,breed,image_url,description,sex,available_date,postcode) VALUES ('Lavender', 'westie highlhander', 'https://www.k9rl.com/wp-content/uploads/2015/12/Westie-825x510.jpg', 'Family friendly', 'female', 'January 2018', '3000');

INSERT INTO comments (body,dog_id) VALUES ('This dog is a terrble guard dog.', 1);
INSERT INTO comments (body,dog_id) VALUES ('This dog requires consistent training.', 2);




jen@email.com hello 
nuine@email.com bye 
schutz@email.com woof



