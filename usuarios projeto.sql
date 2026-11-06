-- 3 Usuários com senhas:

--  Usuário com privilégios de CREATE, INSERT, SELECT
create user "spoty1@localhost" 
identified by "@spotymusic";

grant select, create, insert 
on spotymusic_127.* 
to "spoty1@localhost";

--  Usuário com privilégios de SELECT, DELETE

create user "spoty2@localhost"
identified by "@spotymusic";

grant select, delete 
on spotymusic_127.* 
to "spoty2@localhost";

--  Usuário com privilégios de UPDATE, SELECT, DROP
create user "spoty3@localhost" 
identified by "@spotymusic";

grant select, update, drop
on spotymusic_127.*
to "spoty3@localhost";

