WITH services_used AS (
SELECT 
	CASE
		WHEN "churn_forage_staging".phoneservice = 'Yes' THEN 1
		ELSE 0
	END AS phoneservice,
	CASE
		WHEN "churn_forage_staging".MultipleLines = 'Yes' THEN 1
		ELSE 0
	END AS MultipleLines,
	CASE
		WHEN "churn_forage_staging".OnlineSecurity = 'Yes' THEN 1
		ELSE 0
	END AS OnlineSecurity,
	CASE
		WHEN "churn_forage_staging".OnlineBackup = 'Yes' THEN 1
		ELSE 0
	END AS OnlineBackup,
	CASE
		WHEN "churn_forage_staging".DeviceProtection = 'Yes' THEN 1
		ELSE 0
	END AS DeviceProtection,
	CASE
		WHEN "churn_forage_staging".TechSupport = 'Yes' THEN 1
		ELSE 0
	END AS TechSupport,
	CASE
		WHEN "churn_forage_staging".StreamingTV = 'Yes' THEN 1
		ELSE 0
	END AS StreamingTV,
	CASE
		WHEN "churn_forage_staging".StreamingMovies = 'Yes' THEN 1
		ELSE 0
	END AS StreamingMovies,
	CASE
		WHEN "churn_forage_staging".InternetService = 'No' THEN 0
		ELSE 1
	END AS InternetService,
	"churn_forage_staging".Churn
FROM public."churn_forage_staging"
)

SELECT 
	'Phone' AS services_name,
	(SELECT SUM(phoneservice) FROM services_used WHERE churn = 'Yes') AS churned,
	(SELECT SUM(phoneservice) FROM services_used WHERE churn = 'No') AS no_churned,
	(SELECT SUM(phoneservice) FROM services_used) AS total
UNION ALL
SELECT 
	'Multiple Lines' AS services_name,
	(SELECT SUM(MultipleLines) FROM services_used WHERE churn = 'Yes') AS churned,
	(SELECT SUM(MultipleLines) FROM services_used WHERE churn = 'No') AS no_churned,
	(SELECT SUM(MultipleLines) FROM services_used) AS total
UNION ALL
SELECT 
	'Online Security' AS services_name,
	(SELECT SUM(OnlineSecurity) FROM services_used WHERE churn = 'Yes') AS churned,
	(SELECT SUM(OnlineSecurity) FROM services_used WHERE churn = 'No') AS no_churned,
	(SELECT SUM(OnlineSecurity) FROM services_used) AS total
UNION ALL
SELECT 
	'Online Backup' AS services_name,
	(SELECT SUM(OnlineBackup) FROM services_used WHERE churn = 'Yes') AS churned,
	(SELECT SUM(OnlineBackup) FROM services_used WHERE churn = 'No') AS no_churned,
	(SELECT SUM(OnlineBackup) FROM services_used) AS total
UNION ALL
SELECT 
	'Device Protection' AS services_name,
	(SELECT SUM(DeviceProtection) FROM services_used WHERE churn = 'Yes') AS churned,
	(SELECT SUM(DeviceProtection) FROM services_used WHERE churn = 'No') AS no_churned,
	(SELECT SUM(DeviceProtection) FROM services_used) AS total
UNION ALL
SELECT 
	'Tech Support' AS services_name,
	(SELECT SUM(TechSupport) FROM services_used WHERE churn = 'Yes') AS churned,
	(SELECT SUM(TechSupport) FROM services_used WHERE churn = 'No') AS no_churned,
	(SELECT SUM(TechSupport) FROM services_used) AS total
UNION ALL
SELECT 
	'Streaming TV' AS services_name,
	(SELECT SUM(StreamingTV) FROM services_used WHERE churn = 'Yes') AS churned,
	(SELECT SUM(StreamingTV) FROM services_used WHERE churn = 'No') AS no_churned,
	(SELECT SUM(StreamingTV) FROM services_used) AS total
UNION ALL
SELECT 
	'Streaming Movies' AS services_name,
	(SELECT SUM(StreamingMovies) FROM services_used WHERE churn = 'Yes') AS churned,
	(SELECT SUM(StreamingMovies) FROM services_used WHERE churn = 'No') AS no_churned,
	(SELECT SUM(StreamingMovies) FROM services_used) AS total
UNION ALL 
SELECT 
	'Internet Services' AS services_name,
	(SELECT SUM(InternetService) FROM services_used WHERE churn = 'Yes') AS churned,
	(SELECT SUM(InternetService) FROM services_used WHERE churn = 'No') AS no_churned,
	(SELECT SUM(InternetService) FROM services_used) AS total
;
