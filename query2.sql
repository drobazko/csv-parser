SELECT CONCAT(to_char(weeks.week_start, 'YYYY-MM-DD'), ' - ', to_char(weeks.week_end, 'YYYY-MM-DD')) AS week,
       coffeeshops.name,
       employees.name,
       max_revenue.revenue
FROM (
  SELECT DISTINCT ON(week_id)
      week_id, employee_id, revenue
  FROM (
      SELECT t.week_id,
             t.employee_id,
             SUM(t.price) AS revenue 
      FROM transactions AS t
      GROUP BY t.week_id, t.employee_id
      ORDER BY t.week_id, revenue DESC
  ) AS t
) AS max_revenue
INNER JOIN weeks ON max_revenue.week_id = weeks.id
INNER JOIN employees ON max_revenue.employee_id = employees.id
INNER JOIN coffeeshops ON coffeeshops.id = employees.coffeeshop_id
ORDER BY weeks.id