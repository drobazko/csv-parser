SELECT CONCAT(to_char(weeks.week_start, 'YYYY-MM-DD'), ' - ', to_char(weeks.week_end, 'YYYY-MM-DD')) AS Week, revenue_calc.sum AS Revenue
FROM (
  SELECT t.week_id, SUM(t.price) AS SUM
  FROM transactions AS t
  INNER JOIN weeks ON t.week_id = weeks.id
  GROUP BY t.week_id
) AS revenue_calc
INNER JOIN weeks ON revenue_calc.week_id = weeks.id
ORDER BY revenue_calc.week_id