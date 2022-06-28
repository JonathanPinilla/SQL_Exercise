SELECT * FROM shop.shopowner;

SELECT * FROM shop.shopseller;

SELECT * FROM shop.product;

SELECT * FROM shop.productProvider;

SELECT * FROM shop.invoice;

SELECT * FROM shop.invoiceOrder;

SELECT * FROM shop.costumer;

/*View all the products bought by the costumer with id x and id type y*/
SELECT costumer.costumerName, product.productName
FROM costumer
INNER JOIN invoice
ON costumer.costumerId = invoice.costumerId
INNER JOIN invoiceOrder
ON invoice.invoiceId = invoiceOrder.invoiceId
INNER JOIN product
ON invoiceorder.productId = product.productId
WHERE costumer.costumerId = 1070708876 AND costumer.TypeId = 2;

/*Show products and its providers*/
SELECT product.productName, productProvider.providerName
FROM product
INNER JOIN productProvider
ON product.productId = productprovider.productId
WHERE productName = 'K57';

/*Best seller product*/
SELECT invoiceorder.productId, COUNT(invoiceorder.productId) AS products, product.productName
FROM invoiceOrder
INNER JOIN product
ON invoiceOrder.productId = product.productId
GROUP BY productId;

/*
SELECT productName, MAX(products) AS BestSeller
FROM (
	SELECT invoiceorder.productId, COUNT(invoiceorder.productId) AS products
	FROM invoiceOrder
	GROUP BY productId
) AS TheSellers;

SELECT *, product.productName FROM invoiceorder
INNER JOIN product
ON invoiceOrder.productId = product.productId
WHERE invoiceOrder.productId = 4;
*/