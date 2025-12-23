/*
You are given a table agent_ticket_assignments with agent–ticket mappings.

Find pairs of agents who are assigned to exactly the same set of tickets.

Conditions:
    - Both agents must have identical ticket sets;
    - Duplicate rows for the same (agent_id, ticket_id) must be handled correctly;
    - Each pair must be returned once only.

Output:
    - agent1_id - smaller agent ID;
    - agent2_id - larger agent ID.

Sorting:
    - By agent1_id ASC, then agent2_id ASC.

Дана таблица agent_ticket_assignments с назначениями агентов на тикеты.

Найти пары агентов, у которых полностью совпадает набор тикетов.

Условия:
    - Наборы тикетов должны быть идентичны;
    - Возможны дубликаты строк (agent_id, ticket_id) - их нужно учитывать корректно;
    - Каждая пара выводится только один раз.

Результат:
    - agent1_id - меньший ID агента;
    - agent2_id - больший ID агента.

Сортировка:
    - По agent1_id по возрастанию, затем по agent2_id по возрастанию.
*/

WITH agent_ticket_sets AS (
    SELECT agent_id, ARRAY_AGG(DISTINCT ticket_id ORDER BY ticket_id) AS ticket_set
    FROM agent_ticket_assignments
    GROUP BY agent_id
)
SELECT first_agent.agent_id  AS agent1_id, second_agent.agent_id AS agent2_id
FROM agent_ticket_sets AS first_agent
JOIN agent_ticket_sets AS second_agent ON first_agent.ticket_set = second_agent.ticket_set AND first_agent.agent_id < second_agent.agent_id
ORDER BY agent1_id ASC, agent2_id ASC;