-- Sugalvokite ir parašykite bent 10 skirtingų SQL užklausų, panaudojant visus mūsų nagrinėtus raktažodžius 
-- (nebūtinai juos visus vienu metu) (SELECT, WHERE, AND, OR, NOT, LIMIT, OFFSET, ORDER BY, AS). 
-- Pvz.: atrinkti visus darbuotojus, kurie uždirba daugiau nei 1000; rasti 5 naujausiai įdarbintus darbuotojus; 
-- rasti 10 seniausius pagal amžių darbuotojus; atrinkti visus darbuotojus dirbančius tam tikrame mieste;
-- parodyti kontaktinę visų darbuotojų informaciją; 
-- parodyti kiekvieno darbuotojo vardą pavardę ir įmonę kurioje dirba; ... 
-- Prieš kiekvieną užduotį, parašykite komentarą ko ieškote ir tuomet SQL užklausą, kuri surastų norimą atsakymą.
-- Šioje užduotyje pateikite galutinį SQL failą.

-- Paimti visi duomenys iš employee duomenų bazės
SELECT * FROM employees;

-- darbuotojai, kurie uždirba daugiau nei 1000
SELECT `first_name`, `Last_name`, `salary`
FROM employees
WHERE `salary`>1000;

-- 5 naujausiai įdarbinti darbuotojai
SELECT `first_name`, `Last_name`, `added_on`
FROM employees
ORDER BY `added_on` DESC
LIMIT 5;

-- 10 seniausių darbuotojų
SELECT `first_name`, `Last_name`, `birthdate`
FROM employees
ORDER BY `birthdate` ASC
LIMIT 10;

-- Darbuotojai dirbantys Houston
SELECT `first_name`, `Last_name`, `city`
FROM employees
WHERE `city`= "Houston";

-- kontaktinė visų darbuotojų informaciją
SELECT `first_name`, `Last_name`, `email`, `phone`
FROM employees;

-- darbuotojai, kurie yra ne iš Houston ir ne iš Napoli
SELECT `first_name`, `Last_name`, `city`
FROM employees
WHERE NOT `city`= 'Houston' AND NOT `city`= 'Napoli';

-- Stulpelių pavadinimų pervadinimas first_name į Vardas ir `Last_name` į Pavardė
SELECT `first_name` AS 'Vardas' , `Last_name` AS 'Pavardė'
FROM employees;

-- darbuotojai, kurie yra iš Houston arba iš Napoli
SELECT `first_name`, `Last_name`, `city`
FROM employees
WHERE `city`= 'Houston' OR `city`= 'Napoli';

-- Paimama 10 darbuotojų informacija pradedant nuo antros eilutės
SELECT *
FROM employees
LIMIT 10 OFFSET 1;

-- Paimama darbuotoju informacija, kurių lytis ne vyras ir ne moteris
SELECT `first_name`, `last_name`, `gender`
FROM employees
WHERE NOT `gender` = 'Male' AND NOT `gender` = 'Female';

-- Top 10 darbuotojų atlyginimų
SELECT `first_name`, `last_name`, `salary`, `city`, `company`
FROM employees
ORDER BY `salary` DESC
LIMIT 10;

-- 1. Išrinkti visus vardus aktorių lentelėje.
Select `first_name`
FROM actor;

Select `first_name`, `last_name`
FROM actor;

-- 2. Kokios yra galimos filmų kategorijos?
SELECT `name`,COUNT(*) AS 'Kategorijų kiekis'
FROM category
GROUP BY `name`;

-- 3. Kokie filmai yra mūsų duomenų bazėje?
SELECT `title`
FROM film;

-- 4. Surūšiuoti visus vardus aktorių lentelėje nuo A iki Ž.
Select `first_name`
FROM actor
ORDER BY `first_name` ASC;

-- ARBA

Select `first_name`, `last_name`
FROM actor
ORDER BY `first_name` ASC, `last_name` ASC;

-- 5. Surūšiuoti filmus nuo brangiausio iki pigiausio.
SELECT `title`, `replacement_cost`
FROM film
ORDER BY `replacement_cost` DESC;

-- 6. Išrinkti skirtingos trukmės filmus.
SELECT `title`,`length`
FROM film
GROUP BY `length`
ORDER BY `length` DESC;

-- ARBA

SELECT distinct(length)
FROM film
ORDER BY `length` DESC;

-- 1. Išrinkti visus nepasikartojančius vardus aktorių lentoje.
Select `first_name`, COUNT(*) AS 'Kiek kartų pasikartoja vardas'
FROM actor
GROUP BY `first_name`
ORDER BY `first_name` ASC;

-- 2. Išrinkti nepasikartojančias nuomos kainas.
SELECT `rental_rate`
FROM film
GROUP BY `rental_rate`;

-- ARBA

SELECT distinct(`rental_rate`)
FROM film;

-- ARBA

SELECT `rental_rate`, COUNT(*) AS 'Kiek kartų išnuomota už tokią kainą'
FROM film
GROUP BY `rental_rate`;

-- 3. Pažymėti filmo title ir description stulpelius ir juos pavadinti filmo pavadinimas, filmo aprašymas.
SELECT `title` AS 'Filmo pavadinimas', `description`AS 'Filmo aprašymas'
FROM film;

-- 4. Suskaičiuoti kiek aktorių turime aktorių lentelėje.
SELECT COUNT(`actor_id`) AS 'Aktorių lentelėje'
FROM actor;

-- 5. Suskaičiuoti kiek turime unikalių aktorių vardų ir stulpelį pavadinti Unikalių vardų skaičius.
SELECT 
	COUNT(DISTINCT `first_name`) AS 'Unikalių vardų skaičius'
FROM actor;

-- 6. Kiek yra kokių vardų aktorių lentoje?
SELECT `first_name`, COUNT(`first_name`) AS 'Unikalių vardų skaičius'
FROM actor
GROUP BY `first_name`;

-- 1. Iš lentelės actor reikia išrinkti įrašus su pavarde (last_name) ALLEN.
SELECT *
FROM actor
WHERE `last_name`= 'ALLEN';

-- 2. Iš lentelės actor reikia išrinkti įrašus su pavarde (last_name) DAVIS ir vardu (first_name) SUSAN.
SELECT *
FROM actor
WHERE `last_name` = 'DAVIS' AND `first_name` = 'SUSAN';

-- 3. Parašykite vieną skriptą, kuris iš lentelės film išrinktų įrašus, kurių id yra 52 ir 53.
SELECT *
FROM film
WHERE `film_id` = 52 OR `film_id`=53;
-- ARBA
SELECT *
FROM film
WHERE `film_id` in (52, 53);

-- 4. Suraskite visus filmų pavadinimus, kurie prasideda raide P.
SELECT `title`
FROM film
WHERE `title` LIKE 'P%';

-- 5. Suraskite visus filmus kurie baigiasi raide R.
SELECT `title`
FROM film
WHERE `title` LIKE '%R';

-- 1. Iš lentelės rental išrinkite įrašus, kurių return_date būtų birželio mėnuo.
SELECT *
FROM rental
Where `return_date` BETWEEN '2005-06-01' AND '2005-06-30';

-- ARBA

SELECT *
FROM rental
Where `return_date`>= '2005-06-01' AND `return_date`<= '2005-06-30';

-- 2. Pateikite klientų sąrašą su mokėjimo data ir didžiausiu kiekvieno kliento mokėjimu, 
-- bet tik tų klientų, kurie turi didžiausią mokėjimą per dieną, lygų 2.99, 3.99 ir 4.99.

SELECT `customer_id`, `payment_date`, `amount`
FROM payment
GROUP BY `payment_date`
HAVING MAX(`amount`) IN (2.99, 3.99, 4.99);

-- ARBA

SELECT `customer_id`, `payment_date`, MAX(`amount`)
FROM payment
WHERE `amount` = '2.99' OR `amount` = '3.99' OR `amount` = '4.99'
GROUP BY `payment_date`;

-- 3. Pateikite klientų sąrašą su mokėjimo data ir didžiausiu kiekvieno kliento mokėjimu,
-- bet tik tų klientų, kurių didžiausias mokėjimas per dieną didesnis negu 6.99, rušiuojant
-- pagal didžiausią mokėjimą mažėjimo tvarka.

SELECT `customer_id`, `payment_date`, `amount`
FROM payment
WHERE `amount`>=6.99
GROUP BY `payment_date`
ORDER BY MAX(`amount`) DESC;

-- 1. Parašykite SQL užklausą, kuri ištrauktų visus filmus, kurių žanro aprašyme yra žodis “Commentaries“.
SELECT `title`, `special_features`
FROM film
WHERE `special_features` LIKE '%Commentaries%';

-- 2. Pateikite filmus, kurių trukmė neilgesnė negu 90 minučių.
SELECT `title`, `length`
FROM film
WHERE `length`<90;

-- 3. Pateikite filmų pavadinimus, nuomos kainą (rental rate), trukmę, kai nuomos kaina yra 3.99 arba trukmė yra 130.
SELECT `title`, `rental_rate`,`length`
FROM film
WHERE `rental_rate` = 3.99 OR `length` = 130;

-- 4. Pateikite visą informaciją apie filmų kategorijas, kurių pavadinimas prasideda bet kuria kita raide negu tarp A ir E.
SELECT * 
FROM category
WHERE `name` NOT BETWEEN 'A%' AND 'E%';

-- 5. Pateikite visą informaciją apie filmų kategorijas, kurių pavadinimas prasideda raide F, ketvirtoji raidė yra I, o likusios
-- raidės gali būti bet kokios.
SELECT *
FROM category
WHERE `name` LIKE 'F__i%';

-- 6. Pateikite kategorijų sąrašą, kurių pavadinimas susideda iš 5 raidžių, o ketvirtoji raidė yra „m“.
SELECT `name`
FROM category
WHERE `name` LIKE '___m_';

-- parašyti bent 15 užklausų, pritaikant jau mokamus raktažodžius ir naujai išmoktus 
-- (SELECT, WHERE, ORDER BY, LIMIT, OFFSET, INSERT INTO, UPDATE, DELETE FROM, UPPER, LOWER, CONCAT, 
-- ROUND, SELECT DISTINCT, COUNT, GROUP BY, BETWEEN, IN, LIKE, NOT, HAVING).

-- 1. ištraukti visą informaciją apie darbuotojus
SELECT *
FROM employees;

-- 2. Surikiuoti darbuotojų vardus ir pavardes pagal abėcėlę
SELECT `first_name`, `last_name`
FROM employees
ORDER BY `first_name` ASC, `last_name` ASC;

-- 3. pateikti visus įrašus, kuriuose telefono numeryje yra skaičių kombinacija 123
SELECT *
FROM employees
WHERE `phone` LIKE '%123%';

-- 4. Išrinkti darbuotojų vardus ir pavardes, kurie įsidarbino 2010 metais
SELECT `first_name`, `last_name`, `added_on`
FROM employees
WHERE `added_on` BETWEEN '2010-01-01' AND '2010-12-31';

-- 5. Sukurti stulpelis Vardas, pavardė, surikiuoti pagal abėcėlę, paimti 500 įrašų pradedant nuo 50 įrašo
SELECT CONCAT(`first_name`, ' ', `last_name`) AS 'Vardas, pavardė'
FROM employees
ORDER BY `Vardas, pavardė` ASC
LIMIT 500
OFFSET 50; 

-- 6. Papildyti employess lentelę dviem įrašais
INSERT INTO employees (`first_name`, `last_name`, `phone`,`email`, `gender`, `city`,`birthdate`, `company`, `added_on`)
VALUES ('Ignas', 'Talžūnas', '863789423', 'sadsad@wsrf.lt','Male', 'Vilnius','1991-06-21','LTG', '2022-12-06'), 
		('Diana', 'Dianytė' ,'863781234', 'muilas@wsrf.lt','Female','Klaipėda', '1991-04-25','Bitė', '2022-12-06');

-- 7. Atnaujinti atlyginimus naujai pridėtuose įrašuose

UPDATE employees
SET `salary` = 1000
WHERE `id` = 1001;

UPDATE employees
SET `salary` = 2000
WHERE `id` = 1002;

-- 8. Ištrinti įrašą iš darbuotojų lentelės, kurio id yra 1001 
DELETE FROM employees
WHERE `id` = 1001;

-- 9. išrinkti darbuotojų vardus ir pavardes bei lytis. Lytis atvaizduoti didžiomis raidėmis
SELECT  `first_name` AS 'Vardas', `last_name` AS 'Pavardė', UPPER (`gender`) AS 'Lytis iš didžiųjų raidžių'
FROM employees;

-- 10. Atvaizduoti miestus iš mažųjų raidžių ir surikiuoti pagal abėcėlę
SELECT  LOWER (`city`) AS 'miestai mažosiomis raidėmis'
FROM employees
ORDER BY `city` ASC;

-- 11. Rasti kokių ir kiek lyčių darbuotojų yra
SELECT  `gender` AS 'Lytis', COUNT(`id`) AS 'kiek lyčių'
FROM employees
GROUP BY `gender`
ORDER BY `kiek lyčių` DESC;

-- 12. Rasti Vidutinį visų darbuotojų atlyginimą, suapvalinant iki dviejų skaičių po kablelio
SELECT ROUND(AVG(`salary`),2) AS 'Vidutinis atlyginimas'
FROM employees;

-- 13. Surasti kiek yra unikalių įmonių
SELECT
COUNT(DISTINCT `company`) AS 'Unikalių įmonių'
FROM employees;

-- 14. Ištraukti visus įrašus, kuriose nebūtų įrašų apie įmones Oloo ir Fivechat
SELECT *
FROM employees
WHERE `company` NOT in('Oloo', 'Fivechat');

-- 15. Atvaizduoti moterų vardus, pavardes, kurių atlyginimas nuo 1000 iki 2000
SELECT `first_name`, `last_name`, `salary`
FROM employees
WHERE `gender` = 'female'
HAVING `salary` BETWEEN 1000 AND 2000
ORDER BY `salary` ASC;

-- ARBA 

SELECT `first_name`, `last_name`, `salary`
FROM employees
WHERE `gender` = 'female' AND `salary` BETWEEN 1000 AND 2000
ORDER BY `salary` ASC; 

-- 1. Išrinkite visus aktorių vardus ir pavardes.
SELECT first_name, last_name
FROM actor;

-- 2. Parašykite SQL užklausą, kuri ištrauktų visus stulpelius iš lentelės „actor“ , surūšiuotus pagal 
-- stulpelį „first_name“ mažėjimo tvarka.
SELECT *
FROM actor
ORDER BY first_name DESC;

-- 3. Viename stulpelyje pateikite aktorių vardus ir pavardes.
SELECT CONCAT(first_name, ' ', last_name)
FROM actor;

-- 4. Viename stulpelyje pateikite aktorių vardus ir pavardes mažosiomis raidėmis ir pavadinkite stulpelį
-- „Aktorių vardai“.
SELECT LOWER(CONCAT(first_name, ' ', last_name)) AS 'Aktorių vardai'
FROM actor;

-- 5. Kurie aktorių vardai pasikartoja dažniausiai ir kiek kartų?
SELECT first_name, count(first_name)
FROM actor
GROUP BY first_name
ORDER BY count(first_name) DESC;

-- 1. Išvesti iš lentelės film:
-- a. Vidutinę nuomos trukmę
-- b. Vidutinę nuomos kainą
-- c. Vidutinę filmo trukmę
-- d. Vidutinę pakeitimo kainą

SELECT 
	ROUND(AVG(rental_duration),2) AS 'Vidutinė nuomos trukmė',
	ROUND(AVG(rental_rate),2),
	ROUND(AVG(length),2),
	ROUND(AVG(replacement_cost),2)
FROM film;

-- 2. Bendrą visų filmų trukmę
SELECT sum(length) AS 'bendra visų filmų trukmė'
FROM film;

-- 3. Bendrą visų filmų nuomos laiką
SELECT sum(rental_duration) AS 'bendras visų filmų nuomos laikas'
FROM film;

-- 4. Kokia trumpiausia nuomos trukmė?
SELECT MIN(rental_duration) AS 'trumpiausia nuomos trukmė'
FROM film;

-- 5. Kokie filmai buvo išsinuomoti ilgiausiai, trumpiausiai, kiek jų buvo kiekvienoje grupėje?
SELECT title, max(rental_duration) AS 'Ilgiausiai išnuomoti filmai'
FROM film
JOIN film_category
	USING (film_id)
JOIN category
	USING (category_id)
GROUP BY 1
ORDER BY max(rental_duration) DESC;

SELECT title, MIN(rental_duration) AS 'Trumpiausiai išnuomoti filmai'
FROM film
JOIN film_category
	USING (film_id)
JOIN category
	USING (category_id)
GROUP BY 1
ORDER BY MIN(rental_duration) ASC;

SELECT `name`, rental_duration, COUNT(category_id)
FROM film
JOIN film_category
	USING (film_id)
JOIN category
	USING (category_id)
GROUP BY 1, 2
ORDER BY rental_duration DESC;

-- 6. Kokie ir kiek filmų buvo išsinuomoti vidutiniam nuomos laikui?
SELECT title AS 'Filmai, kurie buvo išsinuomoti vidutiniam nuomos laikui', rental_duration, AVG(rental_duration) AS 'Vidutinė nuomos trukmė'
FROM film
WHERE rental_duration=(SELECT ROUND(AVG(rental_duration),0) AS 'Vidutinė trukmė'
FROM film)
GROUP BY title;

SELECT COUNT(film_id) AS 'Kiek filmų buvo vidutinės trukmės'
from film
WHERE rental_duration=(SELECT ROUND(AVG(rental_duration),0) AS 'Vidutinė nuomos trukmė'
FROM film);

-- 7. Kiek filmų aprašymuose buvo pavartotas žodis ’boring’?
SELECT count(film_id) 'Filmai, kurių aprašymuose panaudotas žodis boring'
FROM film
WHERE `description` LIKE '%boring%';

-- 8. Kiek filmų buvo minimalios trukmės, vidutinės, maksimalios?
SELECT (SELECT count(film_id) 
		FROM film 
        WHERE length = (SELECT min(length) FROM film)) AS 'Minimalios trukmės filmai',
        (SELECT count(film_id) 
		FROM film 
        WHERE length = (SELECT ROUND(AVG(length),0) FROM film)) AS 'Vidutinė trukmės filmai',
        (SELECT count(film_id) 
		FROM film 
        WHERE length = (SELECT MAX(length) FROM film)) AS ' maksimalios trukmės filmai';

-- 9. Suraskite, kiek vidutiniškai trukdavo filmai, priklausomai nuo reitingo.
SELECT rating, ROUND(AVG(length),2) AS 'Vidutinė filmo trūkmė'
FROM film
group by rating;

-- 10. Suraskite vidutinį nuomos laiką filmams pagal reitingą.
SELECT rating, ROUND(AVG(rental_duration),2) AS 'Vidutinis nuomos laikas'
FROM film
group by rating;

-- 11. Suraskite vidutinę nuomos kainą filmams pagal reitingą.
SELECT rating, ROUND(AVG(rental_rate),2) AS 'Vidutinė kaina'
FROM film
group by rating;

-- 12. Išvesti aktorių vardus, pavardes viename stulpelyje. Vardai turi būti mažosiomis
-- raidėmis, pavardės didžiosiomis.
SELECT CONCAT(LOWER(first_name) , ' ',UPPER(last_name )) AS 'vardas PAVARDĖ'
FROM actor;

-- 13. Išvesti aktorių vardus, prasidedančius raidėmis ’A’, ’B’, ’E’. 
-- Suskaičiuoti, kiek vardų prasideda raidėmis ’D’,’E’, ’W’. PVZ., jog jei turime Dan, Ed, Wolf, tai atsakymas bus 3.

SELECT first_name
FROM actor
WHERE first_name LIKE 'A%' OR first_name LIKE 'B%' OR first_name LIKE 'E%'
ORDER BY first_name;

SELECT COUNT(actor_id)
FROM actor
WHERE first_name LIKE 'D%' OR first_name LIKE 'E%' OR first_name LIKE 'W%';

-- 1. Kiek yra filmų, kurių pakeitimo kaina lygi minimaliai pakeitimo kainai?
SELECT count(film_id) AS 'Filmų skaičius, kurių pakeitimo kaina yra minimali'
FROM film
WHERE replacement_cost = (SELECT MIN(replacement_cost)
							FROM film);

-- 2. Pateikite adresus su pašto kodais, miesto pavadinimu bei šalimi.
SELECT address, postal_code, city, country
FROM address
LEFT JOIN city
	USING(city_id)
LEFT JOIN country
	USING(country_id); 

-- 3. Kiek kiekvienas darbuotojas surinko klientų apmokėjimų (kiekis, suma)?
SELECT first_name, last_name, COUNT(payment_id) AS 'Mokėjimų skaičius', SUM(amount) AS 'Mokėjimų suma',
	COUNT(customer_id) AS 'Klientų skaičius'
FROM staff
JOIN payment
	USING(staff_id)
group by 1, 2;

-- 1. Pateikite klientus, kurie nuomai išleido 200 ir daugiau. Nuomai išleistą sumą pateikite
-- stulpelyje „Iš viso“.
SELECT first_name, last_name, SUM(amount) AS 'Iš viso'
FROM customer
JOIN rental
USING(customer_id)
JOIN payment
	USING(rental_id)
GROUP BY 1,2
HAVING SUM(amount) > 200;

-- 2. Paskaičiuokite kiek nuomai išleido klientas, kurio ID yra 15. Nuomai išleistą sumą pateikite
-- stulpelyje „Išleido“.
SELECT c.customer_id, first_name, last_name, SUM(amount) AS 'Išleido'
FROM customer c
JOIN rental
	USING(customer_id)
JOIN payment
	USING(rental_id)
WHERE c.customer_id = 15
GROUP BY 1,2,3;

-- 3. Parašykite SQL užklausą, pateikiančią, ką klientė „BARBARA JONES“ išsinuomavo,
-- išsinuomavimo datą (rental date), grąžinimo datą (return_date), nuomos mokes􀆧 (amount).
-- Rezultatą surūšiuokite pagal inventoriaus ID didėjimo tvarka.

SELECT first_name, last_name, rental_date, return_date, inventory_id, amount
FROM customer c
JOIN rental
	USING(customer_id)
JOIN payment
	USING(rental_id)
WHERE first_name = 'BARBARA' AND last_name = 'JONES'
ORDER BY inventory_id ASC;

-- 1. Pateikite klientų vardus ir pavardes, gyvenančius M raide prasidedančiuose
-- miestuose. Naudokite lenteles “customer”, “address”, “city”.
SELECT first_name, last_name, city
FROM customer
JOIN address
	USING (address_id)
JOIN city
	USING (city_id)
WHERE city LIKE 'M%';

-- 2. Kada paskutinį kartą ir kiek sumokėjo klientė BETTY WHITE?
SELECT first_name, last_name, rental_date, amount
FROM customer
JOIN rental
	USING (customer_id)
JOIN payment
	USING (rental_id)
WHERE first_name = 'BETTY' AND last_name = 'WHITE'
ORDER BY rental_date DESC
LIMIT 1;

-- 3. Suraskite filmų nuomos laikotarpius: paėmimo ir grąžinimo datas kliento, kurio
-- pavardė yra LEE.(rental ir customer lentelės).
SELECT first_name, last_name, rental_date, return_date
FROM customer
JOIN rental
	USING (customer_id)
WHERE last_name = 'LEE';

-- 4. Kiek mažiausiai ir kiek daugiausiai už filmo nuomą yra sumokėjusi klientė Sarah
-- Lewis? Naudokite lenteles “payment”, “customer”.
SELECT first_name, last_name, min(amount), max(amount)
FROM customer
JOIN rental
	USING (customer_id)
JOIN payment
	Using (rental_id)
WHERE last_name = 'Lewis';

-- 5. Kiek nuomos užsakymų įvykdė darbuotojas Mike Hillyer per 2005 metų liepos
-- mėnesį?
SELECT first_name, last_name, count(rental_id) AS 'Įvykdyta užsakymų per 2005 liepos mėn.'
FROM staff
JOIN rental
	USING (staff_id)
WHERE first_name = 'Mike' AND last_name = 'Hillyer' AND rental_date BETWEEN '2005-07-01' AND '2005-07-31';
