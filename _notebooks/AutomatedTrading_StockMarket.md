---
layout: post
title:  Stock market
date:   2019-08-05
day: omatedTrading
---


# Project - Automated Trading


```python
# import libraries
import pandas as pd
import datetime
import matplotlib.pyplot as plt
import matplotlib as mpl
import numpy as np
%matplotlib inline
mpl.rcParams['figure.figsize'] = (15, 9)
```


```python
# Reading data from a csv file - downloaded from yahoo finance
# feel free to choose any stock of your choice
df = pd.read_csv('./data/GOOGL.csv', sep=',')

# formatting the data for usage as datetime and not as string
df['Date'] = df['Date'].map(lambda x: datetime.datetime(year = int(x[:4]), month = int(x[5:7]), day = int(x[8:])))
```


```python
# Print the top snapshot of the table
# Hint: lookup the function head()
```


```python
# Print the bottom snapshot of the table
# Hint: lookup the function tail()
```


```python
# plot the close prices of the stock with dates on x-axis
```

#### Return

Return of a stock is defined as follows:
$r_{t} = \frac{price_{t} - price_{t-1}}{price_{t-1}}$


```python
# calculate the returns
```


```python
# plot the returns of with dates on the x-axis
```

#### Moving Average

Moving average are used to smooth data when the data is noisy just the return data or the price data. It is defined over a certain period `q` as follows:

$MA_{t}(q) = \frac{p_{t-q} + p_{t-q+1} + \dots + p_{t}}{q}$


```python
# calculate the moving average of the prices for 10, 20, 50, 200 days
# hint: lookup the function rolling and sum in pandas
```


```python
# plot the prices as well as the moving averages calculated in the above cell
```


```python
# Calculate the cross-over i.e the difference between the moving averages
# name the variables crossover_10_20, crossover_10_50, crossover_10_200 ...
```


```python
# calculate a new variable as call it "Status" and assign is 1 if the crossover > 0 and -1 for crossover < 0 and rest 0
```


```python
# Prepare the final table for calculating profits - Just like in the class
```
