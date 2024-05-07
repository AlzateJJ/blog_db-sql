--Crea la tabla de usuarios
create table users (
	id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50)
);

--Añade 3 usuarios
insert into users (first_name, last_name, email) values
('juan', 'alzate', 'juan@gmail.com'),
('jose', 'alzate', 'jose@gmail.com'),
('juan jose', 'alzate', 'jj@gmail.com');

select * from users;

--Crea la tabla de posts
create table posts (
	id serial primary key,
	creator_id int references users(id),
	title varchar(150),
	description text
)

--Añade 5 posts.
insert into posts (creator_id, title, description) values
(1, 'Recetas saludables para la semana', 'Descubre nuevas recetas llenas de sabor y nutrientes para cada día.'),
(2, 'Consejos para mejorar tu productividad', 'Aumenta tu eficiencia con estos simples pero efectivos consejos.'),
(1, 'Explorando los rincones ocultos de la ciudad', 'Descubre lugares únicos y secretos que solo los lugareños conocen.'),
(3, 'Ejercicios de yoga para relajarse después del trabajo', 'Desconéctate y recarga energías con esta rutina de yoga.'),
(1, 'Cómo iniciar tu propio negocio desde casa', 'Consejos prácticos y motivación para emprender tu camino empresarial.')
;

select * from posts;

--Crea la tabla de likes
create table likes (
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);

--Añade 5 likes.
insert into likes (user_id, post_id) values
(1, 1),
(2, 3),
(2, 2),
(2, 4),
(3, 5);

select * from likes;
--Trae todos los posts y la información del usuario del campo creator_id
select title, creator_id, users.id from posts inner join users on
users.id = posts.creator_id;

--Trae todos los posts, con la información de los usuarios que les dieron like.
select title, first_name, user_id, users.id from posts inner join likes on
posts.id = likes.post_id inner join users on
likes.user_id = users.id;
