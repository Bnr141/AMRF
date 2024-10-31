SELECT 
    COUNT(*) as N,
    COUNT(column_name) as N_nonmissing,
    AVG(column_name) as mean,
    MIN(column_name) as min,
    MAX(column_name) as max,
    STDDEV(column_name) as sd,
    VARIANCE(column_name) as variance
FROM table_name;

-- Detailed summary statistics (equivalent to Stata's sum, detail)
WITH stats AS (
    SELECT 
        COUNT(*) as N,
        COUNT(column_name) as N_nonmissing,
        AVG(column_name) as mean,
        MIN(column_name) as min,
        MAX(column_name) as max,
        STDDEV(column_name) as sd,
        VARIANCE(column_name) as variance,
        PERCENTILE_CONT(0.01) WITHIN GROUP (ORDER BY column_name) as p1,
        PERCENTILE_CONT(0.05) WITHIN GROUP (ORDER BY column_name) as p5,
        PERCENTILE_CONT(0.10) WITHIN GROUP (ORDER BY column_name) as p10,
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY column_name) as p25,
        PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY column_name) as p50,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY column_name) as p75,
        PERCENTILE_CONT(0.90) WITHIN GROUP (ORDER BY column_name) as p90,
        PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY column_name) as p95,
        PERCENTILE_CONT(0.99) WITHIN GROUP (ORDER BY column_name) as p99
    FROM table_name
)

SELECT 
    N,
    N_nonmissing,
    mean,
    sd,
    variance,
    min,
    p1 as "1%",
    p5 as "5%",
    p10 as "10%",
    p25 as "25%",
    p50 as "50%",
    p75 as "75%",
    p90 as "90%",
    p95 as "95%",
    p99 as "99%",
    max
FROM stats;



-- For multiple columns (equivalent to sum var1 var2 var3)
SELECT 
    COUNT(*) as N,
    -- Column 1
    COUNT(column1) as N1,
    AVG(column1) as mean1,
    MIN(column1) as min1,
    MAX(column1) as max1,
    STDDEV(column1) as sd1,
    -- Column 2
    COUNT(column2) as N2,
    AVG(column2) as mean2,
    MIN(column2) as min2,
    MAX(column2) as max2,
    STDDEV(column2) as sd2,
    -- Column 3
    COUNT(column3) as N3,
    AVG(column3) as mean3,
    MIN(column3) as min3,
    MAX(column3) as max3,
    STDDEV(column3) as sd3
FROM table_name;