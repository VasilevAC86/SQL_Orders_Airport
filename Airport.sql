-- Рейсу 1185 меняем аэропорт отправления на VKO
-- UPDATE FLIGHTS
-- SET DEPARTURE_AIRPORT='VKO'
-- WHERE FLIGHT_ID=1185;

-- Проверяем результат обновления
-- SELECT * FROM FLIGHTS
-- WHERE FLIGHT_ID='1185';

-- SELECT * FROM
-- (SELECT DEPARTURE_AIRPORT, COUNT (DEPARTURE_AIRPORT) AS CNT FROM FLIGHTS -- Из полётов формируем таблицу (название аэропортов вылета), (и кол-во вылетов)
-- GROUP BY DEPARTURE_AIRPORT) -- Группируем по аэропорту вылета (можно перечислить несколько полей)
-- --ORDER BY DEPARTURE_AIRPORT -- Сортируем в алф.порядке по аэропорту вылета
-- ORDER BY CNT DESC; -- Сортируем фэропорты по уменьшению кол-ва вылетовб CNT - псевдоним переменной COUNT

SELECT AIR.AIRPORT_NAME, B.CNT FROM
AIRPORTS_DATA AIR -- Псевдоним таблицы
JOIN (SELECT DEPARTURE_AIRPORT, COUNT (DEPARTURE_AIRPORT) AS CNT FROM FLIGHTS -- Из полётов формируем таблицу (название аэропортов вылета), (и кол-во вылетов)
GROUP BY DEPARTURE_AIRPORT -- Группируем по аэропорту вылета (можно перечислить несколько полей)
) B -- Групповая выборка, подсоединённая к таблице AIRPORTS_DATA
ON B.DEPARTURE_AIRPORT = AIR.AIRPORT_CODE -- Отношение, код аэропорта = коду аэропорта вылета из выборки
ORDER BY CNT DESC -- Сортируем по уменьшению кол-вавылетов