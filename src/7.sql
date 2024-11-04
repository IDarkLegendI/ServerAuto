CREATE TRIGGER trg_UpdateInsert_A ON A
    AFTER INSERT, UPDATE
                      AS
BEGIN
    IF (SELECT COUNT(*) FROM inserted) > 1
BEGIN
UPDATE A
SET v = -i
WHERE id IN (SELECT id FROM inserted);
END
ELSE
BEGIN
UPDATE A
SET v = CASE WHEN i < 0 THEN -1 WHEN i > 0 THEN 1 ELSE 0 END,
    i = v
WHERE id IN (SELECT id FROM inserted);
END
END;
