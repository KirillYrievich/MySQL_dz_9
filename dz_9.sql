/*Практическое задание по теме “Транзакции, переменные, представления”

Задача №2

Создайте представление, которое выводит название name товарной позиции из таблицы products 
и соответствующее название каталога name из таблицы catalogs. */

USE shop_gb;

DROP VIEW IF EXISTS task_1;

CREATE OR REPLACE VIEW task_1 (product_name, catalog_name) AS 
SELECT p.name, c.name FROM products p 
LEFT JOIN catalogs c ON c.id = p.catalog_id;  -- практические такое же задание было на 7 урок. 

SELECT * FROM task_1;



/*Практическое задание по теме “Хранимые процедуры и функции, триггеры"

Задача №1

Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна 
возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу 
"Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".*/


USE vk_dz6


DROP FUNCTION IF EXISTS vk_dz6.hello;
DELIMITER //
CREATE FUNCTION vk_dz6.hello()
RETURNS VARCHAR(255) NO SQL 
BEGIN
	DECLARE `time` INT;
	SET `time` = HOUR(NOW());
	CASE
		WHEN `time` BETWEEN 6 AND 12 THEN
			RETURN 'Доброе утро';
		WHEN `time` BETWEEN 12 AND 18 THEN 
			RETURN 'Добрый день';
		WHEN `time` BETWEEN 18 AND 24 THEN 
			RETURN 'Добрый вечер';
		WHEN `time` BETWEEN 0 AND 6 THEN 
			RETURN 'Доброй ночи';
	END CASE;
END//
DELIMITER ;                             -- Очень долго не мог решить задачу, функция не работала и все, хоть и по синтексису делал как надо. 
										-- Потом нашёл ошибку на форумах, что не надо писать NOT DETERMINISTIC, хоть на уроке и говорили что надо делать так! 



SELECT hello() AS Greeting;	







































