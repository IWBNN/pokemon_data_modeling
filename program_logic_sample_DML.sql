-- 아주 기본적인 데이터 편집 쿼리만 작성
-- 연습용 샘플

-- 데이터 확인 및 수량 조회
select * from poke_dex;
select count(*) from poke_dex;
select * from pokemon;
select count(*) from pokemon;
select * from pokemon_trainer;
select count(*) from pokemon_trainer;
select * from pokemon_skills;
select count(*) from pokemon_skills;
select * from battle_result;
select count(*) from battle_result;

-- 적어도 트레이너 1명은 포켓몬 종류 1가지 당 2개 미만만을 가지고 있어야 함
-- 1) 종류별 보유 개수 출력
select pt.id 트레이너_등록번호, pt.name 트레이너명,
       p.monster_id 포켓몬_도감번호, count(p.monster_id) '보유 개수'
from pokemon p, pokemon_trainer pt
where p.owner = pt.id
group by pt.id, pt.name, p.monster_id
order by pt.id, p.monster_id;
-- 2) 종류별 보유 개수가 종류 수와 동일한지 필터
select m_cnt.트레이너_번호, m_cnt.트레이너명,
       count(m_cnt.포켓몬_도감번호) 포켓몬_보유종류수, sum(m_cnt.보유_개수) 포켓몬_보유수
from (select
          pt.id 트레이너_번호, pt.name 트레이너명,
          p.monster_id 포켓몬_도감번호,
          count(p.monster_id) as 보유_개수
        from pokemon p, pokemon_trainer pt
        where p.owner = pt.id
        group by pt.id, pt.name, p.monster_id
        order by pt.id, p.monster_id) as m_cnt
group by m_cnt.트레이너_번호, m_cnt.트레이너명
having 포켓몬_보유종류수 = 포켓몬_보유수;

-- 10명 이상의 트레이너가 보유한 포켓몬 확인
select monster_id 몬스터_번호, count(owner) 보유자_수
from pokemon
group by monster_id
having 보유자_수 >= 10
order by monster_id;

-- 진화형 포켓몬 보유 트레이너 수 확인
-- pokemon 테이블 쿼리 -> poke_dex 와 JOIN
select p.owner, count(p.owner)
from pokemon p
left join poke_dex pd
using (monster_id)
inner join pokemon_trainer pt
on p.owner = pt.id
where pd.evolves_from is not null
group by p.owner
order by p.owner;