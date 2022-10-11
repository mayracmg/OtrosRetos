SELECT *
FROM crime_scene_report
WHERE date = '20180115'
AND city = 'SQL City'
AND type = 'murder'


SELECT id, name, address_street_name, MAX(address_number) address_number
FROM person
WHERE address_street_name = 'Northwestern Dr'
UNION
SELECT id, name, address_street_name, address_number
FROM person
WHERE address_street_name = 'Franklin Ave'
AND name LIKE '%Annabel%'


SELECT *
FROM interview
WHERE person_id IN (14887, 16371)


SELECT *
FROM get_fit_now_member G
INNER JOIN get_fit_now_check_in C ON G.id = C.membership_id
INNER JOIN person P ON P.id = G.person_id
INNER JOIN drivers_license L ON L.id = P.license_id
WHERE C.check_in_date = '20180109'
AND G.membership_status = 'gold'
AND G.id LIKE '48Z%'
AND L.gender = 'male'
AND L.plate_number LIKE '%H42W%'


SELECT *
FROM interview
WHERE person_id = 67318


SELECT P.id, P.name, I.annual_income, F.event_name, F.date, L.*
FROM person P
INNER JOIN drivers_license L ON L.id = P.license_id
INNER JOIN income I ON I.ssn = P.ssn
INNER JOIN facebook_event_checkin F ON F.person_id = P.id
WHERE L.gender = 'female'
AND L.car_make = 'Tesla'
AND L.car_model = 'Model S'
AND L.height >= 65
AND L.height <= 67
AND L.hair_color = 'red'
