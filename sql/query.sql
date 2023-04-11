SELECT * FROM transaction t WHERE card IN
	( SELECT card FROM credit_card WHERE 
	 	cardholder_id = 2 or cardholder_id = 18
	 )

SELECT c.cardholder_id, t.* FROM (
	SELECT cardholder_id, card FROM credit_card WHERE 
		cardholder_id = 2 or cardholder_id = 18
) c JOIN transaction t ON (c.card = t.card)

SELECT c.cardholder_id, t.* FROM (
	SELECT cardholder_id, card FROM credit_card WHERE 
		cardholder_id = 25
) c JOIN transaction t ON c.card = t.card AND t.date BETWEEN '2018-01-01' AND '2018-06-30'

SELECT EXTRACT(MONTH FROM t.date) as month, EXTRACT(DAY FROM t.date) as day, t.amount FROM (
	SELECT card FROM credit_card WHERE 
		cardholder_id = 25
) c JOIN transaction t ON c.card = t.card AND t.date BETWEEN '2018-01-01' AND '2018-06-30'

SELECT t.id_merchant FROM transaction t WHERE card IN
	( SELECT card FROM credit_card WHERE 
	 	cardholder_id = 2 or cardholder_id = 18
	 )
	 
SELECT m.name, m.id FROM merchant m WHERE id IN
	( SELECT t.id_merchant FROM transaction t WHERE card IN
		( SELECT c.card FROM credit_card c WHERE
		 	cardholder_id = 2 OR cardholder_id = 18
		)
	)

SELECT * FROM transaction t
JOIN merchant m ON t.id_merchant = m.id WHERE card IN
	(SELECT c.card FROM credit_card c WHERE
		cardholder_id = 2 OR cardholder_id = 18
	)

SELECT * FROM transaction t
JOIN merchant m ON t.id_merchant = m.id WHERE card IN
	(SELECT c.card FROM credit_card c )

SELECT c.cardholder_id, t.* FROM (
	SELECT cardholder_id, card FROM credit_card 
) c JOIN transaction t ON c.card = t.card
--- VIEWS
CREATE VIEW cardholders_2_18 AS
SELECT c.cardholder_id, t.* FROM (
	SELECT cardholder_id, card FROM credit_card WHERE 
		cardholder_id = 2 or cardholder_id = 18
	) c JOIN transaction t ON (c.card = t.card);

CREATE VIEW cardholders_2_18_merchants AS
SELECT * FROM transaction t
JOIN merchant m ON t.id_merchant = m.id WHERE card IN
	(SELECT c.card FROM credit_card c WHERE
		cardholder_id = 2 OR cardholder_id = 18
	);

CREATE VIEW cardholders_25_dates AS
SELECT EXTRACT(MONTH FROM t.date) as month, EXTRACT(DAY FROM t.date) as day, t.amount FROM (
	SELECT card FROM credit_card WHERE 
		cardholder_id = 25
) c JOIN transaction t ON c.card = t.card AND t.date BETWEEN '2018-01-01' AND '2018-06-30';

CREATE VIEW all_txs_by_cards AS
SELECT c.cardholder_id, t.* FROM (
	SELECT cardholder_id, card FROM credit_card 
) c JOIN transaction t ON c.card = t.card;