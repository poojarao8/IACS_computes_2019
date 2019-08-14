---
layout: post
title:  Practice
date:   2019-08-14
day: 2
---


# Day 2 practice

Let's practice the tools and functions we have looked at the past couple of days. We'll have 2 main probems to solve today: staircase and sentiment analysis.

### Staircase

For a given $n$, print the corresponding staircase made out of hash symbols. For example, if $n=6$, we should get:

```
#
##
###
####
#####
######
```


```python
n = 6

for i in range(1, n+1):
    print('#' * i)
```

    #
    ##
    ###
    ####
    #####
    ######



```python
my_str = ""

for i in range(n):
    my_str += "#"
    print(my_str)
```

    #
    ##
    ###
    ####
    #####
    ######


## Data cleaning

When scientists perform experiments, the data that they collect needs to be processed before it can be analyzed. Sometimes the detector may not be working, it might be cloudy so the telescope can't see anything, or the scientist may go to get a coffee and miss a reading. Sometimes things interfere with the readings, leading the strange, *anomalous* readings that are far outside the range of expected values. Before any analysis is performed, the data must therefore be *cleaned* to remove any missing or anomalous values.

In this exercise, we're going to pretend that we've collected some readings of the brightness of a star that we observed using Mount Stony Brook every evening for four weeks. Unfortunately, on a few of those nights it was cloudy, so no reading was taken. In this case, the brightness is recorded as `0`. On a few other nights, the flood lights at the nearby football stadium were turned on, leading to light contamination which produced anomalously large readings. On one night, an anomalously small reading was recorded (maybe the person taking the reading put the decimal point in the wrong place??). 

Before we can analyze our data to work out how bright the star is, we will therefore need to clean it. 

To do this, create a new list which does not contain any values which are 0, or much smaller/larger than would reasonably be expected. Decide for yourself what to consider to be anomalously small/large values. You should create the new list by using a for loop to iterate over the elements of the list, adding any values which satisfy the criteria to your new list. 


```python
data = [105.77696802, 110.406054  , 106.36737707,  95.02908826,
        84.13182033,  0, 0, 101.47121241,
       106.07343453,  90.65935074,  93.66283734, 102.19944747,
        82.82894661, 102.20360106, 102.29047846, 596.23884439,
       104.03586589,  99.09490557,  76.09848805, 114.83901321,
        86.5806938 , 497.74438934,  9.891387187, 506.57861168,
       101.61619984,  92.62959516,  0,  90.04324646]
```


```python
# create your clean data here

# most of the values are around 100, so let's throw out all values that
# are not 100 +/- 30

clean_data = []

for num in data:
    if num > 70 and num < 130:
        clean_data.append(num)
        
print(clean_data)
```

    [105.77696802, 110.406054, 106.36737707, 95.02908826, 84.13182033, 101.47121241, 106.07343453, 90.65935074, 93.66283734, 102.19944747, 82.82894661, 102.20360106, 102.29047846, 104.03586589, 99.09490557, 76.09848805, 114.83901321, 86.5806938, 101.61619984, 92.62959516, 90.04324646]


Now you have your nice clean data, let's analyze it to deduce how bright this star is. 
- Calculate the mean of your clean data (this gives an estimate of the true value of the brightness)
- *Advanced*: calculate the standard deviation of the clean data (see the advanced problem in the lists - if you did that problem you can reuse your code here!). The standard deviation gives us an estimate of the error in our measurement.


```python
# calculate the mean
mean = sum(clean_data) / len(clean_data)
mean
```




    97.52564877523812




```python
# calculate the standard deviation
sd_sum = 0

for num in clean_data:
    sd_sum += (num - mean)**2
    
standard_deviation = (1 / (len(clean_data) - 1) * sd_sum)**0.5

standard_deviation
```




    9.877044386788




```python
# for fun, let's repeat this with our uncleaned data and see how different the results are 

unclean_mean = sum(data) / len(data)
unclean_mean
```




    130.66042345989283




```python
sd_sum = 0

for num in data:
    sd_sum += (num - unclean_mean)**2
    
standard_deviation = (1 / (len(data) - 1) * sd_sum)**0.5

standard_deviation
```




    147.02447345444045




```python
# we can see that with our uncleaned data the mean is much larger (as it is
# skewed by the large anomalous values) and the standard deviation is 
# also much larger (indicating that many of the values in the data are 
# very far from the mean).
```
