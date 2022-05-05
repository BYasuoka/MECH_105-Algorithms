# False Position Root Method

* This function will take 5 inputs, a functionm, upper and lower bound, stopping error criterion, and maximum iterations (optional). 
* It will first to see if the bounds have opposite signs and to see if the one of the bounds is your root. 
* If there is no maximum iterations inputted then it will default to 200. 
* After this it will then do the false position root finding method until the approximated error is less then the stopping criterion or we are under the maximum iterations. 
* At the end the function will return the x value of the root, the y value of the root, the approximate error, and the amountn of iterations done. 
