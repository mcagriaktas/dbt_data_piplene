
  
    

  create  table "jaffle_shop_db"."jaffle_shop_sc"."payment_order_summary__dbt_tmp"
  
  
    as
  
  (
    

WITH payment_order_summary AS (
    SELECT 
        rp.payment_method, 
        ro.status, 
        COUNT(ro.status) AS count_type
    FROM 
        "jaffle_shop_db"."jaffle_shop_sc"."raw_payments" rp
    INNER JOIN 
        "jaffle_shop_db"."jaffle_shop_sc"."raw_orders" ro
    ON 
        rp.order_id = ro.id
    GROUP BY 
        rp.payment_method, ro.status
    ORDER BY 
        rp.payment_method DESC
)

SELECT * FROM payment_order_summary
  );
  