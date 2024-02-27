create table poke_dex -- 포켓몬 도감 table 설정
(
    id              int auto_increment primary key,
    elemental varchar(20),
    monsterName     varchar(20) not null,
    maxHp           int         not null,
    skill1Name      varchar(20) not null,
    skill1Dmg       int         not null,
    skill2Name      varchar(20),
    skill2Dmg       int,
    beforeEvolvedId int
);

select * from poke_dex;

create table pokemon_trainer ( -- 트레이너 table 작성
    id int primary key auto_increment,
    name varchar(20) not null,
    capturedPokemon json
);


select * from pokemon_trainer;

create table pokemon -- 포켓몬 table 설정
(
    id              int auto_increment primary key,
    monsterName     varchar(20) not null,
    elemental       varchar(20),
    maxHp           int         not null,
    hp              int not null,
    skill1Name      varchar(20) not null,
    skill1Dmg       int         not null,
    skill2Name      varchar(20),
    skill2Dmg       int
);