-- 1. 데이터베이스 생성 및 선택
create database pokemon_game;
use pokemon_game;
-- 2. 테이블 정의, 물리 스키마 설계
drop table if exists pokemon;
drop table if exists pokemon_trainer;
drop table if exists poke_dex;
drop table pokemon_skills;
drop table battle_result;
--
-- (1) 포켓몬 기술 스키마
--
drop table if exists pokemon_skill;
create table pokemon_skill
(                                      -- 단복수 일관성을 깨는 entity가 있다면 수정 필요 (skills x skill o)
    id           int primary key auto_increment,
    -- 컬럼명이 사용되는 맥락을 고려했을 때, 충분한 설명이 필요한 경우, prefix, postfix 사용을 고려
    skill_name   varchar(20) not null,
    skill_effect varchar(30) not null,
    skill_type   varchar(10) not null,
    skill_damage varchar(10) not null
);

--
-- (2) 포켓몬 도감 스키마
--
drop table if exists poke_dex;
create table poke_dex -- 포켓몬 도감 table 설정
(
    monster_id      int auto_increment primary key comment '도감 번호',
    monster_name    varchar(20)    not null,
    monster_type    varchar(20)    not null comment '원소 속성 / 특성',
    maxHp           int            not null,
    evolution_stage int  default 1 not null comment '진화 단계 (1~3)',
    -- evolves_from : 데이터 선후관계를 판단해서 선행 entity or record 가 후행 항목에 의해 참조되게 설계
    evolves_from    int            default null comment '진화 전 형태',
    is_legendary    bool default false,
    index idx_monstertype (monster_type),
    foreign key fk_evolvesfrom (evolves_from) references poke_dex (monster_id), -- SELF JOIN 수행
    -- DOMAIN 의미 유효성 범주
    constraint evolutionstage_range check ( evolution_stage between 1 and 3)
);
select * from poke_dex;
--
-- (3) 트레이너 스키마
--
drop table if exists pokemon_trainer;
create table pokemon_trainer
( -- 트레이너 table 작성
    id           int primary key auto_increment,
    name         varchar(20) not null,
    trainer_type varchar(20) comment '몬스터 타입을 추종하는 트레이너가 속성',
    -- fk 에 대한 네이밍 컨벤션 지정 => DBA 가 좋아한다
    foreign key fk_trainertype_monsertype (trainer_type) references poke_dex (monster_type)
);
select *
from pokemon_trainer;
--
-- (4) 포켓몬 스키마
--
drop table if exists pokemon;
create table pokemon -- 포켓몬 table 설정
(
    id          int auto_increment primary key,
    monster_id  int         not null, -- poke_dex_id 라고 선언핻 ㅗ됨
    skill1      int         not null, -- 반복적으로 나타날 때, 데이터의 참조 출처를 가리키기만 하면 된다
    skill2      int         null,     -- : 참조 관계를 가진다. => fk 로 다룬다 ==> 새로운 entity 발생
    owner       int         null comment '소유자(트레이너), 야생포켓몬의 경우 null',
    nickname    varchar(20) not null,
    hp          int         not null,
    is_surfable boolean default false,
    is_flyable  boolean default false,
    -- 한번 정한 DB 객체 (FK, INX .. etc) 네이밍 컨벤션을 일관해야 함
    foreign key fk_pokemon_pokedex (monster_id) references poke_dex (monster_id),
    foreign key fk_pokemon_skill1 (skill1) references pokemon_skill (id),
    foreign key fk_pokemon_skill2 (skill2) references pokemon_skill (id),
    foreign key fk_pokemon_trainer (owner) references pokemon_trainer (id)
);
--
-- (5) 전투결과 스키마
--
drop table battle_result;
create table battle_result(
    id int primary key auto_increment, -- 전투 한건, 한건이 고유하게 식별될 수 있는 기록으로 다뤄짐
    pokemon_id_1 int not null,
    pokemon_id_2 int not null,
    winner_id int null,
    -- process_log varchar(255), -- 만약 전투 과정이 필요하면 칼럼 추가
    result_memo varchar(50),
    foreign key fk_battleresult_pokemon1 (pokemon_id_1) references pokemon (id),
    foreign key fk_battleresult_pokemon2 (pokemon_id_2) references pokemon (id)
);