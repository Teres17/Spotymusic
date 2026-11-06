/* ==> Criar 30 queries, 15 com INNER - LEFT - RIGHT JOIN
Das 30 queries, faça 3  views */

-- 1 Exibir todas as playlists e suas músicas
select  p.nomeplaylist as 'Playlist:', m.titulo as 'Música:'
from playlist p
inner join playlist_musica pm
on p.id_playlist = pm.fk_playlist
inner join musica m
on m.id_musica = pm.fk_musica
group by p.nomeplaylist,  m.titulo;

-- 2 Exibir os albuns de um artista 
select art.nomeartista as 'Artista:', a.tituloalbum as 'Álbum:'
from artista art
inner join album a
on art.id_artista = a.fk_artista
where art.id_artista = 1;

-- 3 Mostrar todos os albuns antes de 2010
select tituloalbum as 'Álbum:', data_lancamento as 'Lançamento:'
from album
where data_lancamento < '2010-01-01';

-- 4 Listar os títulos e as durações das músicas que possuem duração superior a 4 minutos
select titulo as 'Música:', duracao as 'Duração'
from musica 
where duracao > '00:04:00';

-- 5. Listar os dados dos artistas cujo nome começa com uma determinada letra.
select * from artista
where nomeartista like 'E%';

-- 6. Selecionar os álbuns lançados dentro de um intervalo de anos específico.
select tituloalbum as 'Álbum:', data_lancamento as 'Lançamento:'
from album
where data_lancamento between '2010-01-01' and '2020-01-01';

-- 7. Listar compositores que não possuem nenhuma música
create view vw_comp_not_music as 
select c.nome as 'Compositor:'
from compositor c
left join compositor_musica cm
on c.id_compositor = cm.fk_compositor
where cm.fk_musica is null;

select * from vw_comp_not_music;

-- 8. Exibir as 5 músicas de maior duração e seus artistas, ordenadas da mais longa para a mais curta.
select m.titulo as 'Música:', art.nomeartista as 'Artista:' , m.duracao as 'Duração'
from musica m
inner join artista_musica am
on am.fk_musica = m.id_musica  
inner join artista art
on am.fk_artista = art.id_artista
order by m.duracao desc limit 5;

-- 9. Contar a quantidade total de artistas agrupados por seu país de origem.
select count(id_artista) as 'Quantidade de Artistas:' , pais_origem as 'País de Origem:'
from artista
group by pais_origem;

-- 10. Listar todos os artistas por ordem alfabética
select nomeartista as 'Artista:'
from artista
order by nomeartista asc;

-- 11. Listar os títulos e a duração de todas as músicas
select titulo as 'Título da Música:', duracao as 'Duração:'
from musica;

-- 12. Selecionar todos os países de origem distintos presentes no cadastro de artistas.
select distinct pais_origem as 'Países de Origem:'
from artista;

-- 13. Listar todas as playlists em ordem alfabética
select nomeplaylist as 'Nome da Playlist:'
from playlist
order by nomeplaylist asc;

-- 14. Selecionar os títulos das músicas que pertencem a um determinado gênero usando subconsulta.
select m.titulo as 'Músicas do gênero Trap:'
from musica m
where m.fk_genero in (
select g.id_genero
from genero g
where g.nomegenero = 'Trap');

-- 15. Selecionar o título e a data do álbum mais antigo cadastrado no banco de dados usando subconsulta.
create view vw_album_mais_antigo as
select m.titulo as 'Música:', a.data_lancamento as 'Data de Lançamento:',
a.tituloalbum as 'Álbum'
from musica m
inner join album a
on a.id_album = m.fk_album
where a.id_album = (select a.id_album
from album a
order by a.data_lancamento asc limit 1);

-- 16. Listar os títulos das músicas, suas durações e o nome do seu respectivo gênero.
select m.titulo as 'Música:', m.duracao as 'Duração', g.nomegenero as 'Gênero:'
from musica m
inner join genero g
on g.id_genero = m.fk_genero;

-- 17. Listar os títulos dos álbuns, suas datas de lançamento e o nome do artista responsável.
select a.tituloalbum as 'Álbum:', a.data_lancamento as 'Lançamento:', art.nomeartista as 'Artista Responsável:'
from album a
inner join artista art
on art.id_artista = a.fk_artista;

-- 18. Exibir o nome de uma playlist específica, a ordem das faixas e o título de cada música contida nela.
select p.nomeplaylist as 'Playlist:', pm.ordem as 'Ordem:', m.titulo as 'Música:'
from playlist p
inner join playlist_musica pm
on p.id_playlist = pm.fk_playlist
inner join musica m
on m.id_musica = pm.fk_musica
where p.nomeplaylist = 'Trap & Urban Vibe';

-- 19. Listar o nome de cada compositor e o título das músicas escritas por ele.
select c.nome as 'Compositor:', m.titulo as 'Música:'
from compositor c
left join compositor_musica cm
on c.id_compositor = cm.fk_compositor
inner join musica m
on m.id_musica = cm.fk_musica;

-- 20. Mostrar o título da música, o título do álbum ao qual ela pertence e o nome do artista do álbum.
select  m.titulo as 'Música:', a.tituloalbum as 'Álbum:', art.nomeartista as 'Artista:'
from musica m
inner join album a
on a.id_album = m.fk_album
inner join artista art
on art.id_artista = a.fk_artista;

-- 21. Filtrar músicas que tenham a palavra "amar" no título
select id_musica, titulo as 'Título da Música:'
from musica
where titulo like '%amar%';

-- 22. Exibir o nome de cada gênero musical e a quantidade total de músicas vinculadas a ele.
select g.nomegenero as 'Gênero:', count(m.titulo) as 'Total de Músicas:'
from genero g
inner join musica m
on m.fk_genero = g.id_genero
group by g.nomegenero;

-- 23. Listar os artistas que possuem mais de uma quantidade determinada de álbuns cadastrados.
select art.nomeartista as 'Artista:', count(a.tituloalbum) as 'Álbum:'
from artista art
inner join album a
on art.id_artista = a.fk_artista
group by art.nomeartista
having count(a.tituloalbum) >= 2;

-- 24. Exibir os álbuns lançados no ano atual ou mais recentes
select tituloalbum as 'Álbum:', data_lancamento as 'Lançamento:'
from album
order by data_lancamento desc;

-- 25. Exibir em uma única consulta o título da música, o gênero, o álbum e o artista do álbum.
select  m.titulo as 'Música:', g.nomegenero as 'Gênero:', a.tituloalbum as 'Álbum:', art.nomeartista as 'Artista:'
from musica m
inner join album a
on a.id_album = m.fk_album
inner join genero g
on g.id_genero = m.fk_genero
inner join artista art
on art.id_artista = a.fk_artista;

-- 26. Contar a quantidade de músicas por playlist e exibir apenas aquelas que possuem mais do que uma quantidade limite de faixas.
select p.nomeplaylist as 'Playlist:', count(m.titulo) as 'Total de Músicas:'
from playlist p
inner join playlist_musica pm
on p.id_playlist = pm.fk_playlist
inner join musica m
on m.id_musica = pm.fk_musica
group by p.nomeplaylist
having count(m.titulo) >= 10;

-- 27. Contar o número de álbuns lançados por artistas pertencentes a um determinado país.
select art.nomeartista as 'Artista:', art.pais_origem as 'País:', count(a.tituloalbum) as 'Álbum:'
from artista art
inner join album a
on art.id_artista = a.fk_artista
group by art.nomeartista, art.pais_origem
having count(a.tituloalbum) and art.pais_origem = 'Brasil';

-- 28. Listar as músicas que possuem duração menor que 3 minutos
select titulo as 'Música:', duracao as 'Duração'
from musica
where duracao < '00:03:00';

-- 29. Contar quantas playlists estão cadastradas no sistema
select count(*) as 'Total de Playlists:'
from playlist;

-- 30. Exibir a música mais recente cadastrada com base na data de lançamento do seu álbum.
create view vw_musica_recente as
select m.titulo as 'Música:', a.tituloalbum as 'Álbum:', a.data_lancamento as 'Lançamento:'
from musica m
inner join album a
on a.id_album = m.fk_album
order by a.data_lancamento desc
limit 1;