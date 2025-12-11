/*
You work for a dating app where users can like other users. All likes are stored in the user_likes table, which contains:
    - id - primary key;
    - liker_id - the user who sends the like;
    - liked_id - the user who receives the like.

Write a query to find mutual likes: User A likes User B and User B likes User A.
Each pair must appear only once, with the smaller ID as user1_id and the larger as user2_id.

Sort the output by user1_id and then user2_id in ascending order.
Self-likes do not exist; duplicates may exist, but each mutual pair must appear only once.

Вы работаете над приложением знакомств, где пользователи могут лайкать других. Все лайки хранятся в таблице user_likes, в которой есть поля:
    - id - первичный ключ;
    - liker_id - кто поставил лайк;
    - liked_id - кому поставили лайк.

Нужно написать запрос, который найдёт взаимные лайки: пользователь A лайкнул B и пользователь B лайкнул A.
Каждая пара должна выводиться только один раз - с меньшим ID в user1_id и большим в user2_id.

Сортировка по user1_id, затем по user2_id по возрастанию.
Самолайков нет; дубликаты возможны, но взаимная пара должна быть только одна.
*/

SELECT LEAST(user_likes.liker_id, user_likes.liked_id)   AS user1_id, GREATEST(user_likes.liker_id, user_likes.liked_id) AS user2_id
FROM user_likes
JOIN user_likes AS user_likes_reverse ON user_likes.liker_id = user_likes_reverse.liked_id AND user_likes.liked_id = user_likes_reverse.liker_id
GROUP BY LEAST(user_likes.liker_id, user_likes.liked_id), GREATEST(user_likes.liker_id, user_likes.liked_id)
ORDER BY user1_id ASC, user2_id ASC;