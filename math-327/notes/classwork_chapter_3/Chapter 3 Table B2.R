# Chapter 3 Table B2.R

# Replace the next statement with an appropriate path on your computer
# or just load the Appendix B data
load ("./Appendix_B_data.Rdata")

# Table B.2 has data collected during a solar energy project at Georgia Tech
#
# y = heat flux (kW)
# x1 = Insolation (watts/m^2)
# x2 = Position of focal point in east direction (in)
# x3 = Position of focal point in south direction (in)
# x4 = Position of focal point in north direction (in)
# x5 = time of day

plot (dataB.2)

# Fit all of the predictor variables

fitB2a = lm (y ~ x1 + x2 + x3 + x4 + x5, data=dataB.2)
summary (fitB2a)
plot (dataB.2$y ~ fitB2a$fitted.values, ylab="Heat Flux (kW)",
      xlab = "Fitted Heat Flux (kW)")
abline (0, 1)

# Add a quadratic term for x5

# dataB.2$x5sq CREATES a new column
# Then since R is vectorized, it subtracts the mean from every element
# Finally, we square the values
dataB.2$x5sq = (dataB.2$x5 - mean (dataB.2$x5))^2
fitB2b = lm (y ~ x1 + x2 + x3 + x4 + x5 + x5sq, data=dataB.2)
summary (fitB2b)

plot (dataB.2$y ~ fitB2b$fitted.values, ylab="Heat Flux (kW)",
      xlab = "Fitted Heat Flux (kW)")
abline (0, 1)
