
----------- WINDOW FUNCTION ------------
 /* 
 Defination : window function applies aggregate ,ranking and analytic functions over a particular window (set of rows).
              and OVER clause is used with window functions to define that window.

			  # aggregate function(sum,avg,max,min,count) = give output one row per aggregation 
			  # Window functions : the row maintain their separate identities

NOTE : OVER = kis set of value ke upar apply karna cahte ho 
	# syntax :
			   SELECT column_1 ,column_2,
			   	      FUN() OVER( [ PARTITION BY > ]
						 	      [ ORDER BY Clause> ]
								  [ < ROW or RANGE Clause> ])
								 
FRoM table_name;                 # Over (Define a Window)
# SELECT a function					1. Partition by = In which column you want to apply partition 
1.aggregate functions				 2. order by    = kis row ke hisabse order karna hai 
2. Ranking functions			 	 3. rows  = window function laga rahe hai to kis range mai laga rahe hai  
3.Analytic functions

# Window function terms

-- window function = applies aggregate , ranking,and analytic functions over a particular window ; 
 					for Example : sum,avg ,or row_number

-- Expression is the name of column that we want the window function operated on.This may 
			   may not  be necessary depending on what window function is used ( kis column par function 
			   lagana cahte hai )

-- OVER =  (Help to create window ) OVER IS just to signify that this is a window function
-- Partitioin by  = divides the rows into partitions so we can specific which
					rows to optional  and does not have to be specified

-- ORDER BY = it is used so that we can order the rows within each partition  
			  This  is optional and does not have to be specified. 

-- ROWS = It can used if we want to further limit the rows window 
	      Partitioin. This is optional and usaually not used(decide the  size of window)

---------------------------------------Window function types ----------------------------------------------------

Defination  :There is no official divisionof the sql window functions into categories but high level we can divide
  					into three types

								-+-+-+-+-+-+-+-+-+-+WINDOW FUNCTION-+-+-+-+-+-+-+-+-+-+-+
													
          Aggregate function 						Ranking_function 					Analytic_function
		  
		  1.SUM()									1.ROW_NUMBER						1.LEAD
		  2.AVG()									2.RANK								2.LAG
		  3.MIN()									3.DENSE_RANK						3.FIRST_VALUE
		  4.MAX()									4.PERCENT_RANK						4.LAST_VALUE
		  5.COUNT()

*/
CREATE TABLE company_data(
	new_id int,
	new_cat VARCHAR(50)
);
drop table company_data;

INSERT INTO company_data(new_id,new_cat)
	values(100,'Agni'),
		   (500,'Vayu'),
		   (300,'Vayu'),
		   (700,'Dharti'),
		   (200,'Vayu'),
		   (200,'Agni'),
		   (500,'Dharti')
truncate table company_data;
-- window function--
--aggregate function
SELECT new_id,new_cat,
	SUM(new_id)       OVER(PARTITION BY new_cat  ORDER BY new_cat )AS TOTAL_SUM,
	ROUND(AVG(new_id) OVER(PARTITION BY new_cat  ORDER BY new_cat ),2 ) AS AVG_VALUE,
	MIN(new_id)       OVER(PARTITION BY new_cat  ORDER BY new_cat ) AS value,
	MAX(new_id)       OVER(PARTITION BY new_cat  ORDER BY new_cat ) AS MAX_VALUE,
	COUNT(new_id)     OVER(PARTITION BY new_cat  ORDER BY new_cat ) AS COUNT_VALUE
FROM company_data;












     	 				
  