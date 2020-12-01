# Chapter 3 Table B3.R

load ("C:/users/iverph01/Documents/Fall 2019/Math 327 fa19/Montgomery data sets/Appendices/Appendix_B_data.Rdata")

# Table B.3 has data on the gasoline mileage of various cars
#
# y = miles per gallon
# x1 = Displacement (cubic in)
# x2 = Horsepower (ft-lb)
# x3 = Torque (ft-lb)
# x4 = Compression Ratio
# x5 = Rear axle ratio
# x6 = Carburetor (barrels)
# x7 = Number of transmission speeds
# x8 = Overall length (in)
# x9 = Width (in)
# x10 = Weight (lb)
# x11 = Type of transmission (1=Automatic, 0=Manual)

plot (dataB.3)

# Fit all of the predictor variables

fitB3a = lm (y ~ x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10 + x11, data=dataB.3)
summary (fitB3a)

# Calculate variance inflaction factors (VIF) for the model above.
# Need to install the car package (one time) and use the library() fuction to activate the package
library (car)
vif (fitB3a)

# Remove the least significant predictor, x11

fitB3b = lm (y ~ x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10, data=dataB.3)
summary (fitB3b)

# Repeat, removing x6

fitB3c = lm (y ~ x1 + x2 + x3 + x4 + x5 + x7 + x8 + x9 + x10, data=dataB.3)
summary (fitB3c)

# Repeat, removing x4

fitB3c = lm (y ~ x1 + x2 + x3 + x5 + x7 + x8 + x9 + x10, data=dataB.3)
summary (fitB3c)

# Plot response vs predicted values (y vs y-hat) for the previous fit
# Since rows 23 and 25 having at least one missing value, they are excluded from
# the fitted model.  Thus we have to remove those two rows from the data set, as well,
# to make the plot work properly.

plot (dataB.3$y[-c(23,25)] ~ fitB3c$fitted.values)
abline (0,1)

# Repeat, removing x2

fitB3c = lm (y ~ x1 + x3 + x5 + x7 + x8 + x9 + x10, data=dataB.3)
summary (fitB3c)
vif (fitB3c)

# Repeat, removing x4

fitB3d = lm (y ~ x3 + x5 + x7 + x8 + x9 + x10, data=dataB.3)
summary (fitB3d)
vif (fitB3d)

# Remove x10

fitB3e = lm (y ~ x3 + x5 + x7 + x8 + x9, data=dataB.3)
summary (fitB3e)
vif (fitB3e)
