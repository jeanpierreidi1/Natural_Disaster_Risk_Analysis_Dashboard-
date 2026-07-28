CREATE DATABASE disaster_db;
CREATE SCHEMA IF NOT EXISTS gold;

CREATE TABLE IF NOT EXISTS gold.disasters (
    disaster_id         VARCHAR(20),
    disaster_type       VARCHAR(50),
    declaration_date    DATE,
    incident_begin      DATE,
    incident_end        DATE,
    state               VARCHAR(5),
    county              VARCHAR(100),
    region              VARCHAR(20),
    declaration_type    VARCHAR(10),
    year                INT,
    month               INT,
    month_name          VARCHAR(10),
    quarter             INT
);

-- KPI View for Power BI
CREATE OR REPLACE VIEW gold.vw_disaster_kpis AS
SELECT
    disaster_id,
    disaster_type,
    declaration_date,
    state,
    county,
    region,
    year,
    month,
    month_name,
    quarter,
    CASE disaster_type
        WHEN 'Fire'      THEN 'Wildfire'
        WHEN 'Hurricane' THEN 'Hurricane'
        WHEN 'Earthquake'THEN 'Earthquake'
        WHEN 'Flood'     THEN 'Flood'
        WHEN 'Tornado'   THEN 'Storm'
        WHEN 'Severe Storm(s)' THEN 'Storm'
        ELSE 'Other'
    END AS disaster_category
FROM gold.disasters
WHERE year >= 2000;

-- Run this in pgAdmin to verify
SELECT COUNT(*) FROM gold.disasters;