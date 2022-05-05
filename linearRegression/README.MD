# Linear Regression with Sorting

* This function will take two arrays (x and y). 
* The first test is to see if x and y are equal in size. 
* It will then sort the y array in ascending order and save the movements so it can move the x array as well. 
* Sorting of the data is next and to determine if a data point is an outlier it needed to be less then Q1(first quartile) - IQR*1.5 or greater than Q3(third quartile) + IQR*1.5 .
* Once the two arrays are sorted it will then calculate the linear regression using the normal equations. 
* After finding the linear equation it will calculate the R^2 . 
* The function will return the two sorted arrays, the slope and intercept of the line, and the R^2 value. 
