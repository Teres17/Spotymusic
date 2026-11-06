-- INSERIR OS REGISTROS PELAS PROCEDURES:
-- 10 Artistas/banda/grupo:
delimiter %%
create procedure ins_artista(nomeartista varchar(100), pais_origem varchar(100))
begin
insert into artista values(null, nomeartista, pais_origem);
select * from artista;
end %%
delimiter ;

call ins_artista('BK', 'Brasil');
call ins_artista('Djonga', 'Brasil');
call ins_artista('GIANA', 'Brasil');
call ins_artista('Emicida', 'Brasil');
call ins_artista('Travis Scott', 'Estados Unidos');
call ins_artista('Jorge Ben Jor', 'Brasil');
call ins_artista('Yunk Vino', 'Brasil');
call ins_artista('Duquesa', 'Brasil');
call ins_artista('Engenheiros do Hawaii', 'Brasil');
call ins_artista('Avenged Sevenfold', 'Estados Unidos');

-- 2 Álbuns para cada Artistas/banda/grupo
delimiter %%
create procedure ins_album(tituloalbum varchar(50), data_lancamento date , fk_artista int)
begin
insert into album values(null, tituloalbum, data_lancamento, fk_artista);
select * from album;
end %%
delimiter ;

-- 1. BK
call ins_album('Castelos & Ruínas', '2016-03-16', 1);
call ins_album('ICARUS', '2022-11-17', 1);

-- 2. Djonga
call ins_album('Heresia', '2017-03-13', 2);
call ins_album('Ladrão', '2019-03-13', 2);

-- 3. GIANA
call ins_album('Mundos', '2021-08-20', 3);
call ins_album('Amanhecer', '2023-05-12', 3);

-- 4. Emicida
call ins_album('O Glorioso Retorno de Quem Vos Fala', '2013-08-21', 4);
call ins_album('AmarElo', '2019-10-30', 4);

-- 5. Travis Scott
call ins_album('ASTROWORLD', '2018-08-03', 5);
call ins_album('UTOPIA', '2023-07-28', 5);

-- 6. Jorge Ben Jor
call ins_album('Samba Esquema Novo', '1963-01-01', 6);
call ins_album('A Tábua de Esmeralda', '1974-05-15', 6);

-- 7. Yunk Vino
call ins_album('237', '2020-06-19', 7);
call ins_album('SUITE146', '2023-06-30', 7);

-- 8. Duquesa
call ins_album('Taurus', '2023-06-08', 8);
call ins_album('Taurus Vol. 2', '2024-05-02', 8);

-- 9. Engenheiros do Hawaii
call ins_album('Longe Demais das Capitais', '1986-10-15', 9);
call ins_album('A Revolta dos Dândis', '1987-03-25', 9);

-- 10. Avenged Sevenfold
call ins_album('City of Evil', '2005-06-06', 10);
call ins_album('Nightmare', '2010-07-27', 10);

-- 5 músicas para cada Álbum
-- inserindo generos:
delimiter %%
create procedure ins_genero(nomegenero varchar(20), descricao varchar(100))
begin
insert into genero values(null, nomegenero, descricao);
select * from genero;
end %%
delimiter ;

call ins_genero('Rap/Hip-Hop', 'Gênero focado em rimas, ritmos falados e batidas urbanas.');
call ins_genero('Trap', 'Subgênero do hip-hop com graves profundos, caixas rápidas e sintetizadores.');
call ins_genero('Pop', 'Música popular com foco em melodias marcantes e apelo comercial.');
call ins_genero('R&B', 'Rhythm and Blues moderno, mesclando soul, pop e hip-hop.');
call ins_genero('MPB', 'Música Popular Brasileira, rica em arranjos e diversidade de ritmos.');
call ins_genero('Samba', 'Gênero tradicional brasileiro marcado por ritmo sincopado e percussão.');
call ins_genero('Samba-Rock', 'Fusão do samba brasileiro com influências do rock, soul e funk.');
call ins_genero('Rock Nacional', 'Rock produzido no Brasil, com letras marcantes em português.');
call ins_genero('Heavy Metal', 'Subgênero do rock com guitarras distorcidas, bateria pesada e vocais intensos.');

-- inserindo musicas:
delimiter %%
create procedure ins_musica(titulo varchar(30), duracao time, fk_album int, fk_genero int)
begin
insert into musica values(null, titulo, duracao, fk_album, fk_genero);
select * from musica;
end %%
delimiter ;

-- Álbum 1: Castelos & Ruínas (BK) - Rap/Hip-Hop (fk_genero: 1)
call ins_musica('Um Aumento de Velocidade', '00:01:28', 1, 1);
call ins_musica('Siga os Seus Passos', '00:03:42', 1, 1);
call ins_musica('Castelos & Ruínas', '00:03:15', 1, 1);
call ins_musica('Caminhos', '00:04:10', 1, 1);
call ins_musica('O Que Sobra Disso', '00:03:50', 1, 1);

-- Álbum 2: ICARUS (BK) - Trap (fk_genero: 2)
call ins_musica('LUZES', '00:03:02', 2, 2);
call ins_musica('MUSEU', '00:03:25', 2, 2);
call ins_musica('SEMENTES', '00:03:10', 2, 2);
call ins_musica('LUGAR AO SOL', '00:03:45', 2, 2);
call ins_musica('TUDO MUDOU', '00:02:58', 2, 2);

-- Álbum 3: Heresia (Djonga) - Rap/Hip-Hop (fk_genero: 1)
call ins_musica('Atípico', '00:03:30', 3, 1);
call ins_musica('Heresia', '00:03:12', 3, 1);
call ins_musica('O Mundo é Nosso', '00:04:05', 3, 1);
call ins_musica('Esquiva', '00:03:48', 3, 1);
call ins_musica('Irmãos e Irmãs', '00:03:20', 3, 1);

-- Álbum 4: Ladrão (Djonga) - Rap/Hip-Hop (fk_genero: 1)
call ins_musica('Hat-Trick', '00:03:40', 4, 1);
call ins_musica('Bença', '00:04:15', 4, 1);
call ins_musica('Leal', '00:03:10', 4, 1);
call ins_musica('MIGA', '00:03:05', 4, 1);
call ins_musica('Deus e o Diabo na Terra', '00:04:30', 4, 1);

-- Álbum 5: Mundos (GIANA) - R&B (fk_genero: 4)
call ins_musica('Intro', '00:01:15', 5, 4);
call ins_musica('Mundos', '00:02:50', 5, 4);
call ins_musica('Passado', '00:03:05', 5, 4);
call ins_musica('Sem Hora', '00:02:45', 5, 4);
call ins_musica('Voar', '00:03:12', 5, 4);

-- Álbum 6: Amanhecer (GIANA) - Pop (fk_genero: 3)
call ins_musica('Amanhecer', '00:02:40', 6, 3);
call ins_musica('Nossa Sorte', '00:03:00', 6, 3);
call ins_musica('Luz', '00:02:35', 6, 3);
call ins_musica('Recomeço', '00:03:10', 6, 3);
call ins_musica('Final Feliz', '00:02:55', 6, 3);

-- Álbum 7: O Glorioso Retorno de Quem Vos Fala (Emicida) - MPB (fk_genero: 5)
call ins_musica('Levanta e Anda', '00:02:30', 7, 5);
call ins_musica('Hoje Cedo', '00:03:16', 7, 5);
call ins_musica('Zoião', '00:03:40', 7, 5);
call ins_musica('Crisântemo', '00:05:10', 7, 5);
call ins_musica('Gueto', '00:03:25', 7, 5);

-- Álbum 8: AmarElo (Emicida) - MPB (fk_genero: 5)
call ins_musica('Principia', '00:05:54', 8, 5);
call ins_musica('A Ordem Natural das Coisas', '00:03:36', 8, 5);
call ins_musica('Pequenas Alegrias da Vida', '00:03:28', 8, 5);
call ins_musica('AmarElo', '00:05:22', 8, 5);
call ins_musica('Ismália', '00:03:48', 8, 5);

-- Álbum 9: ASTROWORLD (Travis Scott) - Trap (fk_genero: 2)
call ins_musica('STARGAZING', '00:04:31', 9, 2);
call ins_musica('SICKO MODE', '00:05:12', 9, 2);
call ins_musica('RIP SCREW', '00:03:05', 9, 2);
call ins_musica('STOP TRYING TO BE GOD', '00:05:38', 9, 2);
call ins_musica('BUTTERFLY EFFECT', '00:03:10', 9, 2);

-- Álbum 10: UTOPIA (Travis Scott) - Trap (fk_genero: 2)
call ins_musica('HYENA', '00:03:42', 10, 2);
call ins_musica('THANK GOD', '00:03:04', 10, 2);
call ins_musica('MODERN JAM', '00:04:15', 10, 2);
call ins_musica('MY EYES', '00:04:11', 10, 2);
call ins_musica('FE!N', '00:03:11', 10, 2);

-- Álbum 11: Samba Esquema Novo (Jorge Ben Jor) - Samba (fk_genero: 6)
call ins_musica('Mas Que Nada', '00:03:02', 11, 6);
call ins_musica('Tim Dom Dom', '00:02:23', 11, 6);
call ins_musica('Balanço Zona Sul', '00:02:53', 11, 6);
call ins_musica('Por Causa de Você, Menina', '00:02:47', 11, 6);
call ins_musica('Chove Chuva', '00:03:06', 11, 6);

-- Álbum 12: A Tábua de Esmeralda (Jorge Ben Jor) - Samba-Rock (fk_genero: 7)
call ins_musica('Os Alquimistas Estão Chegando', '00:03:15', 12, 7);
call ins_musica('O Homem da Gravata Florida', '00:03:05', 12, 7);
call ins_musica('Errare Humanum Est', '00:04:50', 12, 7);
call ins_musica('Menina Mulher da Pele Preta', '00:02:58', 12, 7);
call ins_musica('Zumbi', '00:03:30', 12, 7);

-- Álbum 13: 237 (Yunk Vino) - Trap (fk_genero: 2)
call ins_musica('Diálogo', '00:02:40', 13, 2);
call ins_musica('Leal', '00:02:55', 13, 2);
call ins_musica('A2', '00:03:10', 13, 2);
call ins_musica('Vivências', '00:02:45', 13, 2);
call ins_musica('Check', '00:03:00', 13, 2);

-- Álbum 14: SUITE146 (Yunk Vino) - Trap (fk_genero: 2)
call ins_musica('SUITE146', '00:02:30', 14, 2);
call ins_musica('Sinais', '00:02:50', 14, 2);
call ins_musica('Sempre', '00:03:05', 14, 2);
call ins_musica('Luzes da Cidade', '00:02:40', 14, 2);
call ins_musica('Noite Fria', '00:03:15', 14, 2);

-- Álbum 15: Taurus (Duquesa) - Trap (fk_genero: 2)
call ins_musica('Taurus', '00:02:35', 15, 2);
call ins_musica('Única', '00:02:50', 15, 2);
call ins_musica('90 PHS', '00:02:40', 15, 2);
call ins_musica('Big Mistake', '00:03:00', 15, 2);
call ins_musica('Giro', '00:02:25', 15, 2);

-- Álbum 16: Taurus Vol. 2 (Duquesa) - Trap (fk_genero: 2)
call ins_musica('Taurus Vol. 2', '00:02:45', 16, 2);
call ins_musica('Atitude', '00:02:30', 16, 2);
call ins_musica('Anota Aí', '00:03:00', 16, 2);
call ins_musica('Visão', '00:02:55', 16, 2);
call ins_musica('Topo', '00:02:40', 16, 2);

-- Álbum 17: Longe Demais das Capitais (Engenheiros do Hawaii) - Rock Nacional (fk_genero: 8)
call ins_musica('Toda Forma de Poder', '00:03:15', 17, 8);
call ins_musica('Sopa de Letrinhas', '00:03:08', 17, 8);
call ins_musica('Segurança', '00:03:18', 17, 8);
call ins_musica('Longe Demais das Capitais', '00:02:50', 17, 8);
call ins_musica('Crônica', '00:02:45', 17, 8);

-- Álbum 18: A Revolta dos Dândis (Engenheiros do Hawaii) - Rock Nacional (fk_genero: 8)
call ins_musica('A Revolta dos Dândis I', '00:04:10', 18, 8);
call ins_musica('Infinita Highway', '00:06:11', 18, 8);
call ins_musica('Reesscrevendo o Passado', '00:03:22', 18, 8);
call ins_musica('Terra de Gigantes', '00:03:59', 18, 8);
call ins_musica('Além dos Outdoors', '00:03:33', 18, 8);

-- Álbum 19: City of Evil (Avenged Sevenfold) - Heavy Metal (fk_genero: 9)
call ins_musica('Beast and the Harlot', '00:05:40', 19, 9);
call ins_musica('Bat Country', '00:05:13', 19, 9);
call ins_musica('Seize the Day', '00:05:32', 19, 9);
call ins_musica('Sidewinder', '00:07:01', 19, 9);
call ins_musica('M.I.A.', '00:08:46', 19, 9);

-- Álbum 20: Nightmare (Avenged Sevenfold) - Heavy Metal (fk_genero: 9)
call ins_musica('Nightmare', '00:06:16', 20, 9);
call ins_musica('Welcome to the Family', '00:04:05', 20, 9);
call ins_musica('So Far Away', '00:05:26', 20, 9);
call ins_musica('Buried Alive', '00:06:44', 20, 9);
call ins_musica('Fiction', '00:05:12', 20, 9);

-- Inserção dos relacionamentos entre Artistas e Músicas (100 registros)

-- 1. BK (Músicas 1 a 10)
insert into artista_musica values (null, 1, 1);
insert into artista_musica values (null, 1, 2);
insert into artista_musica values (null, 1, 3);
insert into artista_musica values (null, 1, 4);
insert into artista_musica values (null, 1, 5);
insert into artista_musica values (null, 1, 6);
insert into artista_musica values (null, 1, 7);
insert into artista_musica values (null, 1, 8);
insert into artista_musica values (null, 1, 9);
insert into artista_musica values (null, 1, 10);

-- 2. Djonga (Músicas 11 a 20)
insert into artista_musica values (null, 2, 11);
insert into artista_musica values (null, 2, 12);
insert into artista_musica values (null, 2, 13);
insert into artista_musica values (null, 2, 14);
insert into artista_musica values (null, 2, 15);
insert into artista_musica values (null, 2, 16);
insert into artista_musica values (null, 2, 17);
insert into artista_musica values (null, 2, 18);
insert into artista_musica values (null, 2, 19);
insert into artista_musica values (null, 2, 20);

-- 3. GIANA (Músicas 21 a 30)
insert into artista_musica values (null, 3, 21);
insert into artista_musica values (null, 3, 22);
insert into artista_musica values (null, 3, 23);
insert into artista_musica values (null, 3, 24);
insert into artista_musica values (null, 3, 25);
insert into artista_musica values (null, 3, 26);
insert into artista_musica values (null, 3, 27);
insert into artista_musica values (null, 3, 28);
insert into artista_musica values (null, 3, 29);
insert into artista_musica values (null, 3, 30);

-- 4. Emicida (Músicas 31 a 40)
insert into artista_musica values (null, 4, 31);
insert into artista_musica values (null, 4, 32);
insert into artista_musica values (null, 4, 33);
insert into artista_musica values (null, 4, 34);
insert into artista_musica values (null, 4, 35);
insert into artista_musica values (null, 4, 36);
insert into artista_musica values (null, 4, 37);
insert into artista_musica values (null, 4, 38);
insert into artista_musica values (null, 4, 39);
insert into artista_musica values (null, 4, 40);

-- 5. Travis Scott (Músicas 41 a 50)
insert into artista_musica values (null, 5, 41);
insert into artista_musica values (null, 5, 42);
insert into artista_musica values (null, 5, 43);
insert into artista_musica values (null, 5, 44);
insert into artista_musica values (null, 5, 45);
insert into artista_musica values (null, 5, 46);
insert into artista_musica values (null, 5, 47);
insert into artista_musica values (null, 5, 48);
insert into artista_musica values (null, 5, 49);
insert into artista_musica values (null, 5, 50);

-- 6. Jorge Ben Jor (Músicas 51 a 60)
insert into artista_musica values (null, 6, 51);
insert into artista_musica values (null, 6, 52);
insert into artista_musica values (null, 6, 53);
insert into artista_musica values (null, 6, 54);
insert into artista_musica values (null, 6, 55);
insert into artista_musica values (null, 6, 56);
insert into artista_musica values (null, 6, 57);
insert into artista_musica values (null, 6, 58);
insert into artista_musica values (null, 6, 59);
insert into artista_musica values (null, 6, 60);

-- 7. Yunk Vino (Músicas 61 a 70)
insert into artista_musica values (null, 7, 61);
insert into artista_musica values (null, 7, 62);
insert into artista_musica values (null, 7, 63);
insert into artista_musica values (null, 7, 64);
insert into artista_musica values (null, 7, 65);
insert into artista_musica values (null, 7, 66);
insert into artista_musica values (null, 7, 67);
insert into artista_musica values (null, 7, 68);
insert into artista_musica values (null, 7, 69);
insert into artista_musica values (null, 7, 70);

-- 8. Duquesa (Músicas 71 a 80)
insert into artista_musica values (null, 8, 71);
insert into artista_musica values (null, 8, 72);
insert into artista_musica values (null, 8, 73);
insert into artista_musica values (null, 8, 74);
insert into artista_musica values (null, 8, 75);
insert into artista_musica values (null, 8, 76);
insert into artista_musica values (null, 8, 77);
insert into artista_musica values (null, 8, 78);
insert into artista_musica values (null, 8, 79);
insert into artista_musica values (null, 8, 80);

-- 9. Engenheiros do Hawaii (Músicas 81 a 90)
insert into artista_musica values (null, 9, 81);
insert into artista_musica values (null, 9, 82);
insert into artista_musica values (null, 9, 83);
insert into artista_musica values (null, 9, 84);
insert into artista_musica values (null, 9, 85);
insert into artista_musica values (null, 9, 86);
insert into artista_musica values (null, 9, 87);
insert into artista_musica values (null, 9, 88);
insert into artista_musica values (null, 9, 89);
insert into artista_musica values (null, 9, 90);

-- 10. Avenged Sevenfold (Músicas 91 a 100)
insert into artista_musica values (null, 10, 91);
insert into artista_musica values (null, 10, 92);
insert into artista_musica values (null, 10, 93);
insert into artista_musica values (null, 10, 94);
insert into artista_musica values (null, 10, 95);
insert into artista_musica values (null, 10, 96);
insert into artista_musica values (null, 10, 97);
insert into artista_musica values (null, 10, 98);
insert into artista_musica values (null, 10, 99);
insert into artista_musica values (null, 10, 100);

-- 4 playlist com 10 músicas cada
delimiter %%
create procedure ins_playlist(nomeplaylist varchar(100), data_criacao date)
begin
insert into playlist values(null, nomeplaylist, data_criacao);
select * from playlist;
end %%
delimiter ;

-- criando playlists
call ins_playlist('Nacional & Rap Highlights', '2026-09-23');
call ins_playlist('Trap & Urban Vibe', '2026-09-23');
call ins_playlist('MPB & Clássicos Brasileiros', '2026-09-23');
call ins_playlist('Rock & Heavy Hits', '2026-09-23');

-- inserindo musicas nas playlists utilizando a tabela associativa playlist_musica
-- Playlist 1: Nacional & Rap Highlights (ID Playlist: 1)
insert into playlist_musica values (null, 1, 1, 2);   -- Siga os Seus Passos (BK)
insert into playlist_musica values (null, 2, 1, 3);   -- Castelos & Ruínas (BK)
insert into playlist_musica values (null, 3, 1, 7);   -- LUZES (BK)
insert into playlist_musica values (null, 4, 1, 11);  -- Atípico (Djonga)
insert into playlist_musica values (null, 5, 1, 16);  -- Hat-Trick (Djonga)
insert into playlist_musica values (null, 6, 1, 18);  -- Leal (Djonga)
insert into playlist_musica values (null, 7, 1, 22);  -- Mundos (GIANA)
insert into playlist_musica values (null, 8, 1, 31);  -- Levanta e Anda (Emicida)
insert into playlist_musica values (null, 9, 1, 32);  -- Hoje Cedo (Emicida)
insert into playlist_musica values (null, 10, 1, 39); -- AmarElo (Emicida)

-- Playlist 2: Trap & Urban Vibe (ID Playlist: 2)
insert into playlist_musica values (null, 1, 2, 42);  -- SICKO MODE (Travis Scott)
insert into playlist_musica values (null, 2, 2, 45);  -- BUTTERFLY EFFECT (Travis Scott)
insert into playlist_musica values (null, 3, 2, 49);  -- MY EYES (Travis Scott)
insert into playlist_musica values (null, 4, 2, 50);  -- FE!N (Travis Scott)
insert into playlist_musica values (null, 5, 2, 62);  -- Leal (Yunk Vino)
insert into playlist_musica values (null, 6, 2, 66);  -- SUITE146 (Yunk Vino)
insert into playlist_musica values (null, 7, 2, 71);  -- Taurus (Duquesa)
insert into playlist_musica values (null, 8, 2, 73);  -- 90 PHS (Duquesa)
insert into playlist_musica values (null, 9, 2, 76);  -- Taurus Vol. 2 (Duquesa)
insert into playlist_musica values (null, 10, 2, 78); -- Anota Aí (Duquesa)

-- Playlist 3: MPB & Clássicos Brasileiros (ID Playlist: 3)
insert into playlist_musica values (null, 1, 3, 34);  -- Crisântemo (Emicida)
insert into playlist_musica values (null, 2, 3, 37);  -- A Ordem Natural das Coisas (Emicida)
insert into playlist_musica values (null, 3, 3, 38);  -- Pequenas Alegrias da Vida (Emicida)
insert into playlist_musica values (null, 4, 3, 51);  -- Mas Que Nada (Jorge Ben Jor)
insert into playlist_musica values (null, 5, 3, 53);  -- Balanço Zona Sul (Jorge Ben Jor)
insert into playlist_musica values (null, 6, 3, 55);  -- Chove Chuva (Jorge Ben Jor)
insert into playlist_musica values (null, 7, 3, 56);  -- Os Alquimistas Estão Chegando (Jorge Ben Jor)
insert into playlist_musica values (null, 8, 3, 57);  -- O Homem da Gravata Florida (Jorge Ben Jor)
insert into playlist_musica values (null, 9, 3, 58);  -- Errare Humanum Est (Jorge Ben Jor)
insert into playlist_musica values (null, 10, 3, 60); -- Zumbi (Jorge Ben Jor)

-- Playlist 4: Rock & Heavy Hits (ID Playlist: 4)
insert into playlist_musica values (null, 1, 4, 81);  -- Toda Forma de Poder (Engenheiros do Hawaii)
insert into playlist_musica values (null, 2, 4, 83);  -- Segurança (Engenheiros do Hawaii)
insert into playlist_musica values (null, 3, 4, 86);  -- A Revolta dos Dândis I (Engenheiros do Hawaii)
insert into playlist_musica values (null, 4, 4, 87);  -- Infinita Highway (Engenheiros do Hawaii)
insert into playlist_musica values (null, 5, 4, 89);  -- Terra de Gigantes (Engenheiros do Hawaii)
insert into playlist_musica values (null, 6, 4, 91);  -- Beast and the Harlot (Avenged Sevenfold)
insert into playlist_musica values (null, 7, 4, 92);  -- Bat Country (Avenged Sevenfold)
insert into playlist_musica values (null, 8, 4, 93);  -- Seize the Day (Avenged Sevenfold)
insert into playlist_musica values (null, 9, 4, 96);  -- Nightmare (Avenged Sevenfold)
insert into playlist_musica values (null, 10, 4, 98); -- So Far Away (Avenged Sevenfold)

-- 5 Compositores
delimiter %%
create procedure ins_compositor(nome varchar(100))
begin
insert into compositor values(null, nome);
select * from compositor;
end %%
delimiter ;

call ins_compositor('Abebe Bikila');           -- BK
call ins_compositor('Gustavo Pereira');        -- Djonga
call ins_compositor('Leandro Roque de Oliveira'); -- Emicida
call ins_compositor('Jacques Morelenbaum');    -- Jorge Ben Jor / MPB
call ins_compositor('Jacques Leiner');         -- Músico / Compositor

-- ligando alguns compositores a algumas músicas pela tabela compositor_musica

-- Compositor 1: Abebe Bikila (BK)
insert into compositor_musica values (null, 1, 2);   -- Siga os Seus Passos
insert into compositor_musica values (null, 1, 3);   -- Castelos & Ruínas
insert into compositor_musica values (null, 1, 7);   -- LUZES

-- Compositor 2: Gustavo Pereira (Djonga)
insert into compositor_musica values (null, 2, 11);  -- Atípico
insert into compositor_musica values (null, 2, 16);  -- Hat-Trick

-- Compositor 3: Leandro Roque de Oliveira (Emicida)
insert into compositor_musica values (null, 3, 31);  -- Levanta e Anda
insert into compositor_musica values (null, 3, 32);  -- Hoje Cedo
insert into compositor_musica values (null, 3, 39);  -- AmarElo

-- Compositor 4: Jorge Ben Jor (Jacques Morelenbaum / Jorge Ben)
insert into compositor_musica values (null, 4, 51);  -- Mas Que Nada
insert into compositor_musica values (null, 4, 56);  -- Os Alquimistas Estão Chegando
