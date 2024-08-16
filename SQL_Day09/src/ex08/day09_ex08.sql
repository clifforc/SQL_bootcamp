CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INT DEFAULT 10)
RETURNS TABLE(fib_num INTEGER) AS $$
DECLARE
    a INT := 0;
    b INT := 1;
    next INT;
BEGIN
    RETURN QUERY
    SELECT a AS fib_num
    UNION ALL
    SELECT b AS fib_num;

    LOOP
        next := a + b;
        EXIT WHEN next >= pstop;

        RETURN QUERY
        SELECT next AS fib_num;

        a := b;
        b := next;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();