SELECT STRING_AGG(v, ', ') AS result
FROM (
         SELECT v FROM @t1 WHERE v IS NOT NULL
         UNION ALL
         SELECT v FROM @t2 WHERE v IS NOT NULL
     ) AS combined;
