SELECT day_of_week(date) AS
  day,
  date,
  interface_id,
  srcaddr,
  action,
  protocol
FROM vpc_flow_logs
WHERE action = 'ACCEPT' AND protocol = 6 AND srcaddr = '27.125.191.59'
LIMIT 100;