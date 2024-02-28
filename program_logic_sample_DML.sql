-- 아주 기본적인 데이터 편집 쿼리만 작성
-- 연습용 샘플

-- 특정 트레이너가 보유한 모든 포켓몬 출력
SELECT capturedPokemon
FROM pokemon_trainer
WHERE name = 'Trainer1';

-- 특정 속성 ELEMENTAL의 포켓몬을 모두 출력하는 쿼리 작성
SELECT monsterName
from poke_dex
where elemental = '물';

-- 특정 트레이너가 보유한 포켓몬들의 속성에 대한 통계를 도출하는 Aggregation 쿼리 작성
-- 특정 트레이너가 보유한 포켓몬들의 각 속성에 대한 수
SELECT
    pd.elemental,
    COUNT(*) AS count
FROM
    poke_dex pd
        JOIN
    pokemon_trainer pt ON JSON_UNQUOTE(JSON_EXTRACT(pt.capturedPokemon, '$.*')) = pd.monsterName
WHERE
    pt.name = 'Trainer1'
GROUP BY
    pd.elemental;


select * from pokemon_trainer where name = 'Trainer1';
-- JSON으로 표현한 트레이너가 보유한 포켓몬의 이름과 수, 그에 해당하는 elemental의 수
SELECT
    pt.name AS trainer_name,
    JSON_OBJECTAGG(
            JSON_UNQUOTE(JSON_EXTRACT(pt.capturedPokemon, '$.*')),
            JSON_OBJECTAGG(
                    pd.elemental,
                    JSON_UNQUOTE(JSON_EXTRACT(pt.capturedPokemon, CONCAT('$."', pd.monsterName, '"')))
            )
    ) AS pokemon_data
FROM
    pokemon_trainer pt
        JOIN
    poke_dex pd ON JSON_UNQUOTE(JSON_EXTRACT(pt.capturedPokemon, '$.*')) = pd.monsterName
GROUP BY
    pt.name;


