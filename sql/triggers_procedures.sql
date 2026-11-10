-- Triggers:
-- Triggers para inserir Artista, Música e Compositor:
-- Artista:
delimiter %%
create trigger tr_log_artista after insert
on artista
for each row
begin
insert into artista_log values(null, new.id_artista, new.nomeartista,
 new.pais_origem,'Insert', user(), now());
end %%
delimiter ;

-- Música:
delimiter %%
create trigger tr_log_musica after insert 
on musica
for each row
begin
insert into musica_log values(null, new.id_musica, new.titulo,
 new.duracao, new.fk_album, new.fk_genero, 'Insert', user(), now());
end %%
delimiter ;

-- Compositor:
delimiter %%
create trigger tr_log_compositor after insert
on compositor
for each row
begin
insert into compositor_log values(null, new.id_compositor, new.nome,
'Insert', user(), now());
end %%
delimiter ;

-- Trigger para atualizar nome da Playlist 
delimiter %%
create trigger tr_log_upd_playlist after update
on playlist
for each row
begin
insert into playlist_log values(null, old.id_playlist, old.nomeplaylist,
new.nomeplaylist, old.data_criacao, 'Update', user(), now());
end %%
delimiter ;

-- Triggers para deletar Artista, Música, Compositor e Playlist:
-- Artista:
delimiter %%
create trigger tr_log_del_artista before delete 
on artista
for each row
begin
insert into artista_log values(null, old.id_artista,old.nomeartista, old.pais_origem,
'Delete', user(), now());
end %%
delimiter ;

-- Música:
delimiter %%
create trigger tr_log_del_musica before delete
on musica
for each row
begin
insert into musica_log values(null, old.id_musica, old.titulo,
 old.duracao, old.fk_album, old.fk_genero, 'Delete', user(), now());
end %%
delimiter ;

-- Compositor:
delimiter %%
create trigger tr_log_del_compositor before delete
on compositor
for each row
begin
insert into compositor_log values(null, old.id_compositor, old.nome,
'Delete', user(), now());
end %%
delimiter ;

-- Playlist:
delimiter %%
create trigger tr_log_del_playlist before delete
on playlist
for each row
begin
insert into playlist_log values(null, old.id_playlist, old.nomeplaylist,
null, old.data_criacao, 'Delete', user(), now());
end %%
delimiter ;

-- Procedures:

-- Procedure para deletar Música
delimiter %%
create procedure del_musica(id_musica_del int)
begin
delete from musica where id_musica = id_musica_del;
select * from musica;
end %%
delimiter ;

-- Procedure para deletar Artista
delimiter %%
create procedure del_artista(id_artista_del int)
begin
delete from artista where id_artista = id_artista_del;
select * from artista;
end %%
delimiter ;

-- Procedure para atualizar nome da Playlist
delimiter %%
create procedure upd_playlist(nomeplaylist_upd varchar(100), id_playlist_upd int)
begin
update playlist
set nomeplaylist = nomeplaylist_upd
where id_playlist = id_playlist_upd;
select * from playlist;
end %%
delimiter ;

