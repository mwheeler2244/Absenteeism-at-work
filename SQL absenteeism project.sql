--creat a join table 
Select * from Absenteeism_at_work a
left join compensation c
on a.ID = c.ID
left join Reasons r
on a.Reason_for_absence = r.Number

--find the healthiest for the bonus
select * from Absenteeism_at_work
where Social_drinker = 0 and Social_smoker = 0 and Body_mass_index <25
and absenteeism_time_in_hours < (select avg(absenteeism_time_in_hours) from Absenteeism_at_work)

--comp rate increase for non smokers/budget $983,221 so $.68 increase per hour/ $1414 per year
Select count(*) as nonsmokers from Absenteeism_at_work where Social_smoker = 0

--optimize this query 
Select 
a.ID,
r.Reason,
Month_of_absence,
Body_mass_index,
CASE WHEN Body_mass_index <18.5 Then 'Underweight'
	 WHEN Body_mass_index between 18.5 and 25 Then 'Healthy'
	 WHEN Body_mass_index between 25 and 30 Then 'Overweight'
	 WHEN Body_mass_index >30 Then 'Obese'
	 ELSE 'Unknown' END as BMI_Category,
CASE WHEN Month_of_absence IN (12,1,2) Then 'Winter'
     WHEN Month_of_absence IN (3,4,5) Then 'Spring'
	 WHEN Month_of_absence IN (6,7,8) Then 'Summer'
	 WHEN Month_of_absence IN (9,10,11) Then 'Fall'
	 ELSE 'Unkown' END as Seasons_Names,
CASE WHEN Son =0 Then 'No'
	 WHEN Son >0 THEN 'Yes'
	 ELSE 'Unknown' END as Children,
Distance_from_Residence_to_Work,
Age,
Son,
Work_load_Average_day,
Day_of_the_week,
Absenteeism_time_in_hours,
Social_smoker,
Social_drinker,
Education,
Day_of_the_week,
Transportation_expense
from Absenteeism_at_work a
left join compensation c
on a.ID = c.ID
left join Reasons r
on a.Reason_for_absence = r.Number


