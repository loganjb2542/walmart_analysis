![walmart_logo](https://github.com/user-attachments/assets/265ed8cb-55b2-4c09-bb69-a016cf7b0622)
# Walmart Sales Data Analysis with SQL

## Project Description

This project delves into Walmart's sales data, employing SQL queries to extract valuable insights and conduct a comprehensive Exploratory Data Analysis (EDA). The primary objective is to understand customer behavior, product performance, and overall sales trends.

## Data Source

The dataset utilized for this analysis is a Walmart sales CSV file, which was loaded into a SQL workbench.
![Screenshot (337)](https://github.com/user-attachments/assets/fc5252ca-cb9e-4aa7-bfe9-14d0c526046f)
### Process of importing csv file SQL Workbench Using the Table Data Import Wizard

1. Right-click on the database or the newly created table.
2. Select "Table Data Import Wizard".
3. Click "Browse" to select the CSV file.
4. Choose the destination table (existing or newly created).
5. Configure the import settings:
a> Character Set: Specify the character encoding of the CSV file (e.g., UTF-8, Latin1).
b> Field Terminator: Indicate the delimiter used to separate fields (e.g., comma, semicolon, tab).
c> Row Terminator: Specify the character(s) that mark the end of a row (e.g., newline).
d> Enclosed By: Define the character used to enclose field values (e.g., double quotes).
e> Escaped By: Specify the escape character used to escape special characters within field values.
6. Click "Next" to review the mapping of CSV columns to table columns. Adjust as needed.
7. Click "Finish" to start the import process.

## Data Preparation

To facilitate a more in-depth analysis, several additional columns were created using SQL queries:

time_of_day: Categorizes time into morning, afternoon, evening, and night.

day_name: Identifies the day of the week.

month_name: Specifies the month of the year.

product_category: Grouped products into two categories (e.g., good and bad).
![Screenshot (339)](https://github.com/user-attachments/assets/d3dc5352-a797-43bb-b42e-04c20dde305c)
## Exploratory Data Analysis (EDA)

The EDA is divided into three primary sections:

### 1. Product Analysis

####  Most common payment method: 
Identifies the most used payment method from different payment methods and how many times it was used.
#### Total revenue by month: 
Evaluates the sales performance monthly and the total amount of the sales for that particular month.
####  The most selling product line :
Analyzes which product line was sold most frequently.
#### City with the highest revenue:
Which city has generated the maximum revenue.
### 2. Customer Analysis

#### Customer Segmentation: 
Divides customers into segments based on types of customers.
####  Gender distribution per branch: 
Compare the number of males and females per branch.
#### Gender of most of the customers:
Examines which gender mostly visits walmart.
#### Day of the week has the best average ratings:
Calculates the best average rating among the different days of the week.
### 3. Sales Analysis

#### Sales Trends Over Weekdays: 
Tracks overall sales trends over different time periods (on Weekdays).
#### City has the largest tax percentage/ VAT (Value Added Tax): 
Analyzes the distribution of VAT across various cities and gives out the city name with the highest collectio.
#### Customer type that generates the highest revenue: 
Identifies which customers generate the maximum revenue.

## Tools and Technologies

SQL for data querying and analysis.
SQL Workbench for data loading and query execution.

## Project Structure

The project repository will include:

#### Data Folder: 
Contains the original Walmart sales CSV file.
#### SQL Scripts Folder: 
Stores the SQL scripts used for data preparation and EDA.
#### README.md: 
Provides an overview of the project, including data source, methodology, findings, and insights.

