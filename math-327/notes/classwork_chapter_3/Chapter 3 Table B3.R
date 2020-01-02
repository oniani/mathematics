# Chapter 3 Table B3.R

load ("./Appendix_B_data.Rdata")

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

# Remove the least significant predictor
# We take x11 out
# Better Adjusted R squared and Sigma
fitB3b = lm (y ~ x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10, data=dataB.3)
summary (fitB3b)

# Repeat, removing x6
# Better Adjusted R squared and Sigma
fitB3c = lm (y ~ x1 + x2 + x3 + x4 + x5 + x7 + x8 + x9 + x10, data=dataB.3)
summary (fitB3c)

# Repeat, removing x4
# Better Adjusted R squared and Sigma
fitB3c = lm (y ~ x1 + x2 + x3 + x5 + x7 + x8 + x9 + x10, data=dataB.3)
summary (dataB.3$y[-c(23, 25)], ~ fitB3c$fitted.values)
ablina (0, 1)

# Repeat, removing x2
# Better Adjusted R squared and Sigma
fitB3c = lm (y ~ x1 + x3 + x5 + x7 + x8 + x9 + x10, data=dataB.3)
summary (fitB3c)
