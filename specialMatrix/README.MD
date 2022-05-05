# Special Matrix

* This function will return a matrix with the following criteria
  * The value of each element in the first row is the number of the column.
  * The value of each element in the first column is the number of the row.
  * The rest of the elements each has a value equal to the sum of the element above it and element to the left.
* This function will take two inputs that will be used as the number of rows and number of columns. 
* It will initially create a matrix of ones of the size specified by the inputs. 
* Next, it will make the first column ascend in order from 1 through n. 
* The same will be done for the first row ascending in order from 1 through m. 
* Finally it will find the assign the value for all the other numbers by finding the sum of the element above and to the left. 
