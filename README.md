# Course3 Project

## How to run the script

Copy the data set directly into the project directory, with the full name `UCI HAR Dataset`

for example, the `features.txt` will be located here:

```
$project_dir/UCI HAR Dataset/features.txt
```

`$project_dir` means the project path.

After running the script, it will output a `tidy_data.txt` under `$project_dir`

## How it works

the R script run as follows:

* read the dataset of `train` and `test`
* read `features.txt` to get all the mean and std measurement keys
* filter the right keys and select all the specific columns of test and train dataset
* merge these two datasets with `rbind` function into a new dataset `merged_data`
* update the colnames of `merged_data` with the name in `features.txt`
* calculate all the mean values of the `merged_data`
* build a tidy dataset with these mean values

## Cookbook

the output `tidy_data.txt` contains two columns:

* name : the name measured from origin dataset
* mean_value: the mean value of the specific name 