# Chapter 2 data sets.R

# Data Set 2.7 | Purity VS Hydrocarbons

# Another way
# This is more flexible, but more error-prone.
# plot (data2.7$purity ~ data2.7$hydro)

# Another one
# `attach` adds data frame to the global environment.
# Take a look at the global environment now.
# There is data2.7 there which is globally available
# Note that the Global Environment is a LIFO (Last In First Out) stack
# `detach` is also a function name
# This is not recommended.
# This is sort of `global` keyword in Python.
# attach (data2.7) 
# plot (purity ~ hydro)

# One way (this one is preferred!)
plot (purity ~ hydro, data=data2.7, ylab="Purity (%)", xlab="Hydrocarbons (%)")

# Fit a simple linear regression
fit2.7 = lm (purity ~ hydro, data=data2.7) # Define the linear model
summary (fit2.7)  # Estimate parameters
abline  (fit2.7)  # Add the line

# df
# regression degrees of freedom = p - 1
# resodual degrees of freedom = n - p
# total = (p - 1) + (n - p) = n - 1
#
#
anova   (fit2.7)  # ANOVA table
confint (fit2.7)  # Parameter estimates for the model

# Predict mean or individual purity when hydro=1.2%
predict (fit2.7, list (hydro=1.2), interval="confidence")  # Mean
predict (fit2.7, list (hydro=1.2), interval="prediction")  # Individual


# Data Set 2.9 | Delivery Time VS Number of Cases

plot (y ~ x, data=data2.9, ylab="Delivery Time (min)", xlab="# Cases")

fit2.9 = lm (y ~ x, data=data2.9)
abline  (fit2.9)

# t-value is just an estimate divided by standard error
summary (fit2.9)

# Shouldn't delivery time be zero minutes for zero cases?
# In order to answer this question, we fit a no-interceot regression
# Ignore multiple R-squared, adjusted R-squared, and F-statistic lines for nointercept model
# Generally, we do not use no intercept regression
fit2.9noint = lm (y ~ 0 + x, data=data2.9)
abline (fit2.9noint, col="red")
summary (fit2.9noint)
