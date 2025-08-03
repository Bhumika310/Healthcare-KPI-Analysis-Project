create database healthcare_kpi;
use healthcare_kpi;
CREATE TABLE patient_records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Patient_ID VARCHAR(20),
    Admission_Date DATE,
    Department VARCHAR(100),
    Length_of_Stay INT,
    Bed_Utilization INT,
    Fall_Incident VARCHAR(10),
    Staff_Count INT,
    Satisfaction_Score FLOAT,
    Discharge_Type VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    Diagnosis VARCHAR(100)
);
select * from patient_records;
SELECT * FROM patient_records LIMIT 10;
-- KPI 1: Bed Utilization by Department
SELECT 
    Department,
    ROUND(AVG(Bed_Utilization), 2) AS Avg_Bed_Utilization
FROM 
    patient_records
GROUP BY 
    Department
ORDER BY 
    Avg_Bed_Utilization DESC;

-- KPI 2: Fall Incidents by Department
SELECT 
    Department,
    COUNT(*) AS Total_Incidents
FROM 
    patient_records
WHERE 
    Fall_Incident = 'Yes'
GROUP BY 
    Department
ORDER BY 
    Total_Incidents DESC;

-- KPI 3: Satisfaction vs Staff Count
SELECT 
    Department,
    ROUND(AVG(Staff_Count), 2) AS Avg_Staff_Count,
    ROUND(AVG(Satisfaction_Score), 2) AS Avg_Satisfaction
FROM 
    patient_records
GROUP BY 
    Department;

-- KPI 4: Average Length of Stay by Department
SELECT 
    Department,
    ROUND(AVG(Length_of_Stay), 2) AS Avg_Length_Of_Stay
FROM 
    patient_records
GROUP BY 
    Department
ORDER BY 
    Avg_Length_Of_Stay DESC;

-- KPI 5: Satisfaction Score by Discharge Type
SELECT 
    Discharge_Type,
    ROUND(AVG(Satisfaction_Score), 2) AS Avg_Satisfaction
FROM 
    patient_records
GROUP BY 
    Discharge_Type
ORDER BY 
    Avg_Satisfaction DESC;
