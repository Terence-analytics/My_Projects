# data explaratory, explanatory analysis

## 
SELECT*
FROM layoff_staging2;
# inspect the columns vs total laidoff
SELECT max(total_laid_off), max(percentage_laid_off)
FROM layoff_staging2;

SELECT*
FROM layoff_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions desc
;

SELECT company, sum(total_laid_off)
FROM layoff_staging2
GROUP BY company
order by 2 DESC;

SELECT min(`date`), max(`date`)
FROM layoff_staging2;

SELECT industry,sum(total_laid_off)
FROM layoff_staging2
GROUP BY industry
order by 2 DESC;

SELECT country,sum(total_laid_off)
FROM layoff_staging2
GROUP BY country	
order by 2 DESC;

SELECT year(`date`),sum(total_laid_off)
FROM layoff_staging2
GROUP BY year(`date`)
order by 1 DESC;

SELECT stage,sum(total_laid_off)
FROM layoff_staging2
GROUP BY stage
order by 2 DESC;
##progresssion of layofffs
#rolling total of layoffs
SELECT substring(`date`,1,7) as `Month`, sum(total_laid_off)
FROM layoff_staging2
where substring(`date`,1,7) is not null
GROUP BY `Month`
ORDER BY 1 asc
;

WITH rolling_total as
(
SELECT substring(`date`,1,7) as `Month`, sum(total_laid_off) as total_off
FROM layoff_staging2
where substring(`date`,1,7) is not null
GROUP BY `Month`
ORDER BY 1 asc)
select `Month`, total_off, sum(total_off) over( order BY `Month`) as Rolling_total
from rolling_total; # PARTITION BY substring(`Month`,1,4)

SELECT company, sum(total_laid_off)
FROM layoff_staging2
GROUP BY company
order by 2 DESC;


SELECT company, year(`date`), sum(total_laid_off)
FROM layoff_staging2
GROUP BY company, year(`date`)
order by 3 desc;
# rank which years more employees were layed off

WITH company_year(company, years, total_layed_off) as
(SELECT company, year(`date`), sum(total_laid_off)
FROM layoff_staging2
GROUP BY company, year(`date`)
), company_year_rank as # cte2
(
select *,DENSE_RANK() over(PARTITION BY years ORDER BY total_layed_off desc) as `dense_rank`
from company_year
where years is not null
)
SELECT*
from company_year_rank
where `dense_rank` <= 5

;







