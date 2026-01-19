# DAATA CLEANING
#create database, import data,remove duplicates, standardize the data( like checking spelings), null?blank values, remove unnecessary columns and rows
DELIMITER ;
SELECT *
FROM layoffs;

# create staging table to avoid losing data from the raw data
CREATE table  layoff_staging
	like layoffs;
SELECT *
FROM layoff_staging;
# insert the data into the duplicate table
insert into layoff_staging
	select*
    from layoffs;
    
## removing duplicates
#identify dublicates
SELECT *,
ROW_NUMBER() over(PARTITION BY company, location, industry, total_laid_off, `date`, stage,country,funds_raised_millions) as row_num
FROM layoff_staging;

# create a cte to filter out duplicates
WITH duplicate_cte AS
( 
SELECT *,
ROW_NUMBER() over(
PARTITION BY company, location, industry, total_laid_off, `date`, stage,country,funds_raised_millions) as row_num
FROM layoff_staging
)
select *
from duplicate_cte
where row_num >1;
# checking for confirmation
SELECT *
FROM layoff_staging
where company = 'casper';
# we cannot update a cte
# create a table and delete the extra raw
#copy clipboard
CREATE TABLE `layoff_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoff_staging2;
# insert data into staging2
insert into layoff_staging2
SELECT *,
ROW_NUMBER() over(
PARTITION BY company, location, industry, total_laid_off, `date`, stage,country,funds_raised_millions) as row_num
FROM layoff_staging;

# filter the duplicates
SELECT *
FROM layoff_staging2;
#where row_num > 1;
#delete the duplicates
DELETE 
FROM layoff_staging2
where row_num > 1;

## Standardizind data
#trim company
select company, trim(company)
FROM layoff_staging2;
#update
update layoff_staging2
SET company = trim(company);
# industry, some industry have diffrent names but fall into one category
select DISTINCT(industry)
FROM layoff_staging2
ORDER BY 1;
#
select *
FROM layoff_staging2
where industry like '%Crypto%';
#update
UPDATE layoff_staging2
SET industry = 'Crypto'
where industry like '%Crypto%';
#location
select DISTINCT(location)
FROM layoff_staging2
ORDER BY 1;
#country
select DISTINCT(country)
FROM layoff_staging2
ORDER BY 1;
#update
UPDATE layoff_staging2
SET country = 'United States'  #country = TRIM(TRAILING '.' from, country
WHERE country like '%United States%';

#date, changing datatype
select `date`,
str_to_date(`date`,'%m/%d/%Y')
from layoff_staging2;
#update
UPDATE layoff_staging2
SET `date` = str_to_date(`date`, '%m/%d/%Y');

ALTER TABLE layoff_staging2
MODIFY COLUMN `date` DATE;
# 
select *
FROM layoff_staging2;

##NULL and blank rows and columns

;
# INDUSTRY
#convert blanks to nulls
UPDATE layoff_staging2
SET industry = NULL
WHERE industry = '';

SELECT *
FROM layoff_staging2
WHERE industry is null
or industry ='';
#check columns to match missing data
SELECT *
FROM layoff_staging2
WHERE company like 'Bally%';
#join
SELECT *
FROM layoff_staging2 t1
JOIN layoff_staging2 t2
	ON t1.company = t2.company
	and t1.location = t2.location
WHERE (t1.industry is null )
and (t2.industry is not null ); 
#update
UPDATE layoff_staging2 t1
	JOIN layoff_staging2 t2
		ON t1.company = t2.company
		and t1.location = t2.location
SET t1.industry = t2.industry
WHERE (t1.industry is null )
and (t2.industry is not null );

SELECT *
FROM layoff_staging2;

# total_laid_off and percentage laid off== if they are both null they might not be usefull
SELECT*
FROM layoff_staging2
WHERE total_laid_off is null
AND percentage_laid_off is null;

 # DELETE
DELETE
FROM layoff_staging2
WHERE total_laid_off is null
AND percentage_laid_off is null;

SELECT*
FROM layoff_staging2;

## Deleting a column
ALTER TABLE layoff_staging2
DROP COLUMN row_num;

SELECT DISTINCT(stage)
from layoff_staging2;