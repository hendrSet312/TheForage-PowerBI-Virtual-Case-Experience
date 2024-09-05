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
	"churn_forage_staging".InternetService,
	"churn_forage_staging".Churn
FROM public."churn_forage_staging"
)

SELECT 
	churn
	,InternetService
	,COUNT(InternetService) as ct
FROM services_used
WHERE InternetService <> 'No'
GROUP BY churn,InternetService
ORDER BY churn,InternetService;