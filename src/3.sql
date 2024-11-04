SELECT 3 AS id, 300 AS v
FROM @t1 t1
         FULL JOIN @t2 t2 ON t1.id = t2.id
WHERE t1.id IS NULL OR t2.id IS NULL;
