# Analyzing Students Mental Health

![image](https://github.com/user-attachments/assets/5a893c55-b821-410a-9aad-15460d6b00c1)


## Table of Contents

- [Project Introduction](#project-introduction)
    - [Analyzing Students Mental Health SQL Queries](#analyzing-students-mental-health-sql-queries)
    - [Analyzing Students Mental Health Dataset](#analyzing-students-mental-health-dataset)
- [Analysis Outline](#analysis-outline)

## Project Introduction

Studying abroad can be both exciting and stressful. In 2018 an international Japanese university surveyed its students and published the recordings after the ethical and regulatory boards approved it. This analysis will showcase my data manipulation skills to explore the data from the study to find the factor that may have the most impact on students' mental health.

### Analyzing Students Mental Health SQL Queries
All SQL queries on GitHub.

Link: [Analyzing Students Mental Health](https://github.com/jasondo-da/Analyzing_Students-_Mental_Health/blob/main/queries.sql)

### Analyzing Students Mental Health Dataset

| Field Name |	Description |
| :------------- | :------------ |
| inter_dom |	Types of students (international or domestic) |
| japanese_cate |	Japanese language proficiency |
| english_cate |	English language proficiency |
| academic |	Current academic level (undergraduate or graduate) |
| age |	Current age of student |
| stay |	Current length of stay in years |
| todep |	Total score of depression (PHQ-9 test) |
| tosc |	Total score of social connectedness (SCS test) |
| toas |	Total score of acculturative stress (ASISS test) |


## Analysis Outline

```sql
/* View a sample of the data */
SELECT inter_dom,
  japanese_cate,
  english_cate,
  academic,
  age,
  stay,
  todep,
  tosc,
  toas
FROM students
LIMIT 5
```

Output:
| index |	inter_dom |	japanese_cate |	english_cate |	academic |	age |	stay |	todep |	tosc |	toas |
| :-----------: | :----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| 0 |	Inter |	Average |	High |	Grad |	24 |	5 |	0 |	34 |	91 |
| 1 |	Inter |	High |	High |	Grad |	28 |	1 |	2 |	48 |	39 |
| 2 |	Inter |	High |	High |	Grad |	25 |	6 |	2 |	41 |	51 |
| 3 |	Inter |	Low |	Average |	Grad |	29 |	1 |	3 |	37 |	75 |
| 4 |	Inter |	Low |	Average |	Grad |	28 |	1 |	3 |	37 |	82 |


```sql
/* Calculating customer concentrations for each state with the amount of revenue generated */
SELECT s.stay, 
	COUNT(*) count_int,
	ROUND(AVG(s.todep), 2) average_phq,
	ROUND(AVG(s.tosc), 2) average_scs,
	ROUND(AVG(s.toas), 2) average_as
FROM students s
WHERE s.inter_dom = 'Inter'
GROUP BY s.stay
ORDER BY stay DESC
```

Output:
| index |	stay |	count_int |	average_phq |	average_scs |	average_as |
| :-----------: | :----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| 0 |	10 |	1 |	13 |	32 |	50 |
| 1 |	8 |	1 |	10 |	44 |	65 |
| 2 |	7 |	1 |	4 |	48 |	45 |
| 3 |	6 |	3 |	6 |	38 |	58.67 |
| 4 |	5 |	1 |	0 |	34 |	91 |
| 5 |	4 |	14 |	8.57 |	33.93 |	87.71 |
| 6 |	3 |	46 |	9.09 |	37.13 |	78 |
| 7 |	2 |	39 |	8.28 |	37.08 |	77.67 |
| 8 |	1 |	95 |	7.48 |	38.11 |	72.8 |
