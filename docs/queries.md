# 🔍 Consultas SQL e Views - Spotymusic

> Este documento reúne as 30 consultas SQL desenvolvidas para a base de dados **Spotymusic**, divididas entre consultas simples, junções (`INNER JOIN`, `LEFT JOIN`), subconsultas, agregações e criação de **Views**.

---

## 📋 Lista de Consultas

1. **Exibir todas as playlists e suas músicas:**
```SQL
select  p.nomeplaylist as 'Playlist:', m.titulo as 'Música:'
from playlist p
inner join playlist_musica pm
on p.id_playlist = pm.fk_playlist
inner join musica m
on m.id_musica = pm.fk_musica
group by p.nomeplaylist,  m.titulo;
```

2. **Exibir os albuns de um artista:**
```SQL 
select art.nomeartista as 'Artista:', a.tituloalbum as 'Álbum:'
from artista art
inner join album a
on art.id_artista = a.fk_artista
where art.id_artista = 1;
```

3. **Mostrar todos os albuns antes de 2010:**
```SQL
select tituloalbum as 'Álbum:', data_lancamento as 'Lançamento:'
from album
where data_lancamento < '2010-01-01';
```

4. **Listar os títulos e as durações das músicas que possuem duração superior a 4 minutos:**
```SQL
select titulo as 'Música:', duracao as 'Duração'
from musica 
where duracao > '00:04:00';
```

5. **Listar os dados dos artistas cujo nome começa com uma determinada letra:**
```SQL
select * from artista
where nomeartista like 'E%';
```

6. **Selecionar os álbuns lançados dentro de um intervalo de anos específico:**
```SQL
select tituloalbum as 'Álbum:', data_lancamento as 'Lançamento:'
from album
where data_lancamento between '2010-01-01' and '2020-01-01';
```


7. **Exibir as 5 músicas de maior duração e seus artistas, ordenadas da mais longa para a mais curta:**
```SQL
select m.titulo as 'Música:', art.nomeartista as 'Artista:' , m.duracao as 'Duração'
from musica m
inner join artista_musica am
on am.fk_musica = m.id_musica  
inner join artista art
on am.fk_artista = art.id_artista
order by m.duracao desc limit 5;
```

8. **Contar a quantidade total de artistas agrupados por seu país de origem:**
```SQL
select count(id_artista) as 'Quantidade de Artistas:' , pais_origem as 'País de Origem:'
from artista
group by pais_origem;
```

9. **Listar todos os artistas por ordem alfabética:**
```SQL
select nomeartista as 'Artista:'
from artista
order by nomeartista asc;
```

10. **Listar os títulos e a duração de todas as músicas:**
```SQL
select titulo as 'Título da Música:', duracao as 'Duração:'
from musica;
```

11. **Selecionar todos os países de origem distintos presentes no cadastro de artistas:**
```SQL
select distinct pais_origem as 'Países de Origem:'
from artista;
```

12. **Listar todas as playlists em ordem alfabética:**
```SQL
select nomeplaylist as 'Nome da Playlist:'
from playlist
order by nomeplaylist asc;
```

13. **Selecionar os títulos das músicas que pertencem a um determinado gênero usando subconsulta:**
    ```SQL
    select m.titulo as 'Músicas do gênero Trap:'
    from musica m
    where m.fk_genero in (
    select g.id_genero
    from genero g
    where g.nomegenero = 'Trap');
    ```

14. **Listar os títulos das músicas, suas durações e o nome do seu respectivo gênero:**
    ```SQL
    select m.titulo as 'Música:', m.duracao as 'Duração', g.nomegenero as 'Gênero:'
    from musica m
    inner join genero g
    on g.id_genero = m.fk_genero;
    ```

15. **Listar os títulos dos álbuns, suas datas de lançamento e o nome do artista responsável:**
    ```SQL
    select a.tituloalbum as 'Álbum:', a.data_lancamento as 'Lançamento:', art.nomeartista as 'Artista Responsável:'
    from album a
    inner join artista art
    on art.id_artista = a.fk_artista;
    ```

16. **Exibir o nome de uma playlist específica, a ordem das faixas e o título de cada música contida nela:**
    ```SQL
    select p.nomeplaylist as 'Playlist:', pm.ordem as 'Ordem:', m.titulo as 'Música:'
    from playlist p
    inner join playlist_musica pm
    on p.id_playlist = pm.fk_playlist
    inner join musica m
    on m.id_musica = pm.fk_musica
    where p.nomeplaylist = 'Trap & Urban Vibe';
    ```

17. **Listar o nome de cada compositor e o título das músicas escritas por ele:**
    ```SQL
    select c.nome as 'Compositor:', m.titulo as 'Música:'
    from compositor c
    left join compositor_musica cm
    on c.id_compositor = cm.fk_compositor
    inner join musica m
    on m.id_musica = cm.fk_musica;
    ```

18. **Mostrar o título da música, o título do álbum ao qual ela pertence e o nome do artista do álbum:**
    ```SQL
    select m.titulo as 'Música:', a.tituloalbum as 'Álbum:', art.nomeartista as 'Artista:'
    from musica m
    inner join album a
    on a.id_album = m.fk_album
    inner join artista art
    on art.id_artista = a.fk_artista;
    ```

19. **Filtrar músicas que tenham a palavra "amar" no título:**
    ```SQL
    select id_musica, titulo as 'Título da Música:'
    from musica
    where titulo like '%amar%';
    ```

20. **Exibir o nome de cada gênero musical e a quantidade total de músicas vinculadas a ele:**
    ```SQL
    select g.nomegenero as 'Gênero:', count(m.titulo) as 'Total de Músicas:'
    from genero g
    inner join musica m
    on m.fk_genero = g.id_genero
    group by g.nomegenero;
    ```

21. **Listar os artistas que possuem mais de uma quantidade determinada de álbuns cadastrados:**
    ```SQL
    select art.nomeartista as 'Artista:', count(a.tituloalbum) as 'Álbum:'
    from artista art
    inner join album a
    on art.id_artista = a.fk_artista
    group by art.nomeartista
    having count(a.tituloalbum) >= 2;
    ```

22. **Exibir os álbuns lançados no ano atual ou mais recentes:**
    ```SQL
    select tituloalbum as 'Álbum:', data_lancamento as 'Lançamento:'
    from album
    order by data_lancamento desc;
    ```

23. **Exibir em uma única consulta o título da música, o gênero, o álbum e o artista do álbum:**
    ```SQL
    select m.titulo as 'Música:', g.nomegenero as 'Gênero:', a.tituloalbum as 'Álbum:', art.nomeartista as 'Artista:'
    from musica m
    inner join album a
    on a.id_album = m.fk_album
    inner join genero g
    on g.id_genero = m.fk_genero
    inner join artista art
    on art.id_artista = a.fk_artista;
    ```

24. **Contar a quantidade de músicas por playlist e exibir apenas aquelas que possuem mais do que uma quantidade limite de faixas:**
    ```SQL
    select p.nomeplaylist as 'Playlist:', count(m.titulo) as 'Total de Músicas:'
    from playlist p
    inner join playlist_musica pm
    on p.id_playlist = pm.fk_playlist
    inner join musica m
    on m.id_musica = pm.fk_musica
    group by p.nomeplaylist
    having count(m.titulo) >= 10;
    ```

25. **Contar o número de álbuns lançados por artistas pertencentes a um determinado país:**
    ```SQL
    select art.nomeartista as 'Artista:', art.pais_origem as 'País:', count(a.tituloalbum) as 'Álbum:'
    from artista art
    inner join album a
    on art.id_artista = a.fk_artista
    group by art.nomeartista, art.pais_origem
    having count(a.tituloalbum) and art.pais_origem = 'Brasil';
    ```

26. **Listar as músicas que possuem duração menor que 3 minutos:**
    ```SQL
    select titulo as 'Música:', duracao as 'Duração'
    from musica
    where duracao < '00:03:00';
    ```

27. **Contar quantas playlists estão cadastradas no sistema:**
    ```SQL
    select count(*) as 'Total de Playlists:'
    from playlist;
    ```

## 👁️ Views Criadas no Sistema

1. **Exibir a música mais recente cadastrada com base na data de lançamento do seu álbum:**
```SQL
-- Criando a view:
create view vw_musica_recente as

-- Estrutura da view
select m.titulo as 'Música:', a.tituloalbum as 'Álbum:', a.data_lancamento as 'Lançamento:'
from musica m
inner join album a
on a.id_album = m.fk_album
order by a.data_lancamento desc
limit 1;

-- Execução da view:
select * from vw_musica_recente;
```

2. **Listar compositores que não possuem nenhuma música:**
```SQL
-- Criando a view:
create view vw_comp_not_music as

-- Estrutura da view
select c.nome as 'Compositor:'
from compositor c
left join compositor_musica cm
on c.id_compositor = cm.fk_compositor
where cm.fk_musica is null;

-- Execução da view:
select * from vw_comp_not_music;
```
3. **Selecionar o título e a data do álbum mais antigo cadastrado no banco de dados usando subconsulta:**
```SQL
-- Criando a view:
create view vw_album_mais_antigo as

-- Estrutura da view:
select m.titulo as 'Música:', a.data_lancamento as 'Data de Lançamento:',
a.tituloalbum as 'Álbum'
from musica m
inner join album a
on a.id_album = m.fk_album
where a.id_album = (select a.id_album
from album a
order by a.data_lancamento asc limit 1);

-- Execução da view:
select * from vw_album_mais_antigo;
```