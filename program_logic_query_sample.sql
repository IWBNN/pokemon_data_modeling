select owner, pd.monster_type, count(pd.monster_type) 타입별_보유_몬스터_수
from pokemon p
inner join poke_dex pd
using (monster_id)
group by owner, pd.monster_type
order by owner, 타입별_보유_몬스터_수 desc;

-- 포켓몬의 일반형과 진화형을 연결해 조회하는 JOIN 쿼리
select pd1.monster_id, pd1.monster_name,
       pd2.monster_id, pd2.monster_name
from poke_dex pd1
inner join poke_dex pd2
on pd1.evolves_from = pd2.monster_id;