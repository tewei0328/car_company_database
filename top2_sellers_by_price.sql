/* Finds the top sellers by purchase price for the past year */
SELECT B.brand_name, SUM(CO.purchase_price)
FROM Customer_Ownership as CO
  LEFT OUTER JOIN Car_Vins as CV on (CO.vin = CV.vin)
  LEFT OUTER JOIN Models as M on (CV.model_id = M.model_id)
  LEFT OUTER JOIN Brands as B on (B.brand_id = M.brand_id)
WHERE CO.purchase_date > date('now','-1 year')
GROUP BY B.brand_name 
ORDER BY SUM(CO.purchase_price) DESC
LIMIT 2;