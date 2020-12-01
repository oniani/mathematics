# VIF

VIF (Variance Inflation Factor) = evaluate effect of multicolliniarity

$\text{VIF} = \dfrac{1}{1 - R^2_j}$ for $j^{th}$ regression coefficient $\hat\Beta_j$.

We do $x_j \sim x_1 + x_2 + \dots + x_{j + 1} + \dots + x_{p - 1}$.

Here is some code to run `vif`:

```r
fitB3a = lm (y ~ x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10, data=dataB.3)
library (car)
vif (fitB3a)
```

$$R = \sqrt{R^2} = \text{multiple correlation coefficient} = correl(Y, \hat{Y})$$

Rule of thumb, is that correlated ones are going to have lower alpha values,
but it is sometimes not going to happen primarily because there is usually a
fairly high degree of correlation. In fact, when removing predictor variables,
the direction of the coefficients (a.k.a estimates) might also change.

GENERALLY SPEAKING, DO NOT JUST USE `vif` TO GET RID OF REGRESSOR VARIABLES
OR ELIMINATE MULTICOLLINIARITY. A GOOD PRACTICE IS TO USE IT AS A VERIFIER
OF RESULTS. FIRST, GET RESULTS AND THEN VERIFY THEM USING `vif`.

ALSO, INFLATION FACTORS SHOULD BE LESS THAN 5.

# Practice

```r
plot (dataB.13)

# Fit the full-order model (include all individual predictors ~ no extra stuff)

fit13a = lm (y ~ x1 + x2 + x3 + x4 + x5 + x6, data=dataB.13)
summary (fit13a)
vif (fit13a)

# Let us take out x6
# This is Zach's idea

fit13b = lm (y ~ x1 + x2 + x3 + x4 + x5, data=dataB.13)
summary (fit13b)
vif (fit13b)

# Let us take out x2 now as it was the least significant
# Note that we put x6 back (bad idea taking it out, Zach...)
fit13c = lm (y ~ x1 + x3 + x4 + x5 + x6, data=dataB.13)
summary (fit13c)
vif (fit13c)

# Let us take out x4 now as it was the least significant
fit13d = lm (y ~ x1 + x3 + x5 + x6, data=dataB.13)
summary (fit13d)
vif (fit13d)

# Let us take out x5 since it is least significant
fit13e = lm (y ~ x1 + x3 + x6, data=dataB.13)
summary (fit13e)
vif (fit13e)
confint (fit13e)
```

# Interpretation of fit13e

x1, x3, and x6 together explain 99.7% of the variation in thrust.
The residual standard error is 27.8 thrust units and is small
compared to the range of thrust values.

Mean thrust increases 1.36 Newtons per rad/seconds and between 1.07 and
1.6751.36 Newtons per rad/sec with 95% seconds.

# R Output

For each parameter, we are going to get a separate VIF value. One needs to look
at the rightmost column, not the leftmost column. VIF for each parameter should
be less than 5 and some of them less than 10.
