-- KPI Definitions: SLA, AHT, Backlog
SELECT
    AVG(EXTRACT(EPOCH FROM (resolved_at - created_at))/60) AS aht_minutes,
    SUM(CASE WHEN resolved_at <= created_at + INTERVAL '48 HOURS' THEN 1 END) * 1.0 /
    COUNT(*) AS sla_rate,
    SUM(CASE WHEN status = 'open' THEN 1 END) AS backlog_count
FROM tickets;
