create table user (
    id		    	INT primary key auto_increment,
    email_address   VARCHAR(100),
    password		VARCHAR(50),
    first_name		VARCHAR(100),
    last_name  		VARCHAR(100),
    mobile_number	VARCHAR(20),
    activated		BIT(1) DEFAULT 0
);

create table item (
    id		    	INT primary key auto_increment,
	name			VARCHAR(100),
	description		VARCHAR(1000),
	thumbnail		VARCHAR(100),
	image			VARCHAR(100),
	price			DECIMAL(5,2),
	sold			BIT(1) DEFAULT 0
);

INSERT INTO item (description, thumbnail, image, name, price)  VALUES('This black and white colored cat is super friendly. Anyone passing by your front yard will find him puring at their feet and trying to make a new friend. His name is Anthonybut I call him Ant as a nickname since he loves to eat ants and other insects.', 'anthony-s.jpg', 'anthony.jpg','Friendly Cat', 307.10);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('A great pet for a hair stylist! Have fun combing Bailey''s silver mane. Maybe trim his whiskers? He is very patient and loves to be pampered.', 'bailey-s.jpg', 'bailey.jpg','Fluffy Cat', 307.00);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('My cat is so sneaky. He is so curious that he just has to poke his nose into everything going on in the house. Everytime I turn aroundBAMhe is in the room peaking at what I am doing. Nothing escapes his keen eye. He should be a spy in the CIA!', 'bob-s.jpg', 'bob.jpg','Sneaky Cat', 307.20);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('A great pet to lounge on the sofa with. If you want a friend to watch TV withthis is the cat for you. Plusshe wont even ask for the remote! Reallycould you ask for a better friend to lounge with?', 'chantelle-s.jpg', 'chantelle.jpg','Lazy Cat', 307.30);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('A great old pet retired from duty in the circus. This fully-trained tiger is looking for a place to retire. Loves to roam free and loves to eat other animals.', 'charlie-s.jpg', 'charlie.jpg','Old Cat', 307.00);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('A great young pet to chase around. Loves to play with a ball of string. Bring some instant energy into your home.', 'elkie-s.jpg', 'elkie.jpg','Young Female cat', 307.40);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('A needy pet. This cat refuses to grow up. Do you like playful spirits? I need lots of attention. Please do not leave me alonenot even for a minute.', 'faith-s.jpg', 'faith.jpg','Playful Female Cat', 307.00);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('This fluffy white cat looks like a snowball. Plusshe likes playing outside in the snow and it looks really cool to see this snowball cat run around on the ski slopes. I hope you have white carpet as this cat sheds lots of hair.', 'gaetano-s.jpg', 'gaetano.jpg','White Fluffy Cat', 307.50);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('This little tiger thinks it has big teeth. A great wild pet for an adventurous person. May eat your other pets so be careful- just kidding. This little tiger is affectionate.', 'harmony-s.jpg', 'harmony.jpg','Tiger Stripe Cat', 307.00);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('Meow Meow in the back alley cat fights! This cat keeps the racoons awaybut still has class.', 'katzen-s.jpg', 'katzen.jpg','Alley Cat', 307.60);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('Fastest and coolest cat in town. If you always wanted to own a cheetahthis cat is even faster and better looking. No dog could ever catch this bolt of lightening.', 'mario-s.jpg', 'mario.jpg','Speedy Cat', 307.00);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('A high maintenance cat for an owner with time. This cat needs pampering: comb it hairbrush its teethwash its furpaint its claws. For all you debutanteslet the world know you have arrived in style with this snooty cat in your purse!', 'mimi-s.jpg', 'mimi.jpg','Stylish Cat', 307.70);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('A great pet with its own song to sing with your fiends. "Smelly catSmelly cat ..." Need an excuse for that funky odor in your house? Smelly cat is the answer.', 'monique-s.jpg', 'monique.jpg','Smelly Cat', 307.80);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('A great watch pet. Want to keep your roommates from stealing the beer from your refrigerator? This big-toothed crazy cat is better than a watchdog. Just place him on top of the refrigerator and watch him pounce when so-called friends try to sneak a beer. This cat is great fun at parties.', 'olie-s.jpg', 'olie.jpg','Saber Cat', 307.90);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('This cat is from Paris. It has a very distinguished history and is looking for a castle to play in. This sophisticated cat has class and taste. No chasing on stringno catnip habits. Only the habits of royalty in this cats blood.', 'paris-s.jpg', 'paris.jpg','Sophisticated Cat', 307.00);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('Just beauty and elegance. She will charm you from the moment she enters the room.', 'princess-s.jpg', 'princess.jpg','Princess cat', 307.00);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('Wow! This cat is cool. It has a beautiful tan coat. I wish I could get a sun tan of that color.', 'simba-s.jpg', 'simba.jpg','Lazy cat', 307.00);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('A scappy cat that likes to cause trouble. If you are looking for a challenge to your cat training skillsthis scapper is the test!', 'thaicat-s.jpg', 'thaicat.jpg','Scapper male cat', 307.00);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('Buy me please. I love to sleep.', 'cat1.gif', 'cat1.gif','Lazy cat', 307.19);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('A great old pet retired from duty in the circus. This fully-trained tiger is looking for a place to retire. Loves to roam free and loves to eat other animals.', 'cat2.gif', 'cat2.gif','Old Cat', 200.00);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('A great young pet to chase around. Loves to play with a ball of string.', 'cat3.gif', 'cat3.gif','Young Cat', 350.00);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('A real trouble-maker in the neighborhood. Looking for some T.L.C', 'cat4.gif', 'cat4.gif','Scrappy Cat', 417.00);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('Loves to play in the alley outside my apartmentbut looking for a warmer and safer place to spend its nights.', 'cat5.gif', 'cat5.gif','Alley Cat', 307.00);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('Come play with me. I am looking for fun.', 'cat7.gif', 'cat7.gif','Playful Cat', 190.00);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('Buy this fancy cat.', 'cat8.gif', 'cat8.gif','Long Haired Cat', 199.00);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('Just need a nice bath and i will be fresh as a kitten.', 'cat9.gif', 'cat9.gif','Fresh Cat', 303.00);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('This wild tiger loves to play.', 'cat10.gif', 'cat10.gif','Wild Cat', 527.00);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('Buy me', 'cat11.gif', 'cat11.gif','Saber Cat', 237.00);
INSERT INTO item (description, thumbnail, image, name, price)  VALUES('Buy Me.', 'cat12.gif', 'cat12.gif','Snappy Cat', 337.00);
