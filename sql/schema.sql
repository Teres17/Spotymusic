-- Criando e utilizando o banco:
create database spotymusic_127;
use spotymusic_127;

-- Criando tabelas:
create table genero(
id_genero int primary key auto_increment,
nomegenero varchar(20) not null,
descricao varchar(100));

create table artista(
id_artista int primary key auto_increment,
nomeartista varchar(100) not null,
pais_origem varchar(20) );

create table compositor(
id_compositor int primary key auto_increment,
nome varchar(100) not null);

create table playlist(
id_playlist int primary key auto_increment,
nomeplaylist varchar(100) not null,
data_criacao date not null);

create table album(
id_album  int primary key auto_increment,
tituloalbum varchar(50) not null,
data_lancamento date,
fk_artista int,
foreign key (fk_artista) references artista(id_artista) on delete cascade);

create table musica(
id_musica  int primary key auto_increment,
titulo varchar(30) not null,
duracao time not null,
fk_album int,
fk_genero int,
foreign key (fk_album) references album(id_album) on delete cascade,
foreign key (fk_genero) references genero(id_genero) on delete cascade);

-- Criando tabelas associativas:
create table playlist_musica(
id_pm int primary key auto_increment,
ordem int,
fk_playlist int,
fk_musica int,
foreign key (fk_musica) references musica(id_musica) on delete cascade,
foreign key (fk_playlist) references playlist(id_playlist) on delete cascade);

create table compositor_musica(
id_cm int primary key auto_increment,
fk_compositor int,
fk_musica int,
foreign key (fk_compositor) references compositor(id_compositor) on delete cascade,
foreign key (fk_musica) references musica(id_musica) on delete cascade);

create table artista_musica(
id_am int primary key auto_increment,
fk_artista int,
fk_musica int,
foreign key (fk_artista) references artista(id_artista) on delete cascade,
foreign key (fk_musica) references musica(id_musica) on delete cascade);

-- Criando as tabelas para armazenar os dados das Triggers:
create table artista_log(
id_artista_log int primary key auto_increment,
id_artista int,
nomeartista varchar(100),
pais_origem varchar(100),
tipo varchar(15),
usuario varchar(50),
data_log datetime);

create table musica_log(
id_musica_log int primary key auto_increment,
id_musica int,
titulo varchar(30),
duracao time, 
fk_album int,
fk_genero int,
tipo varchar(15),
usuario varchar(50),
data_log datetime);

create table compositor_log(
id_compositor_log int primary key auto_increment,
id_compositor int,
nome varchar(50),
tipo varchar(15),
usuario varchar(50),
data_log datetime);

create table playlist_log(
id_playlist_log int primary key auto_increment,
id_playlist int,
nomeplaylist varchar(100),
nomeplaylist_atual varchar(100),
data_criacao date,
tipo varchar(15),
usuario varchar(50),
data_log datetime);



