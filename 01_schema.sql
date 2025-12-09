CREATE TABLE tickets (
    ticket_id INT,
    created_at TIMESTAMP,
    resolved_at TIMESTAMP,
    priority VARCHAR(10),
    agent_id VARCHAR(20),
    channel VARCHAR(20),
    status VARCHAR(20)
)
