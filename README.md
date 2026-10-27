# Shiny-Predictor

# Car Fuel Efficiency Predictor

## Project Overview
The Car Fuel Efficiency Predictor is an interactive web application
built using R and Shiny. It estimates a car's fuel efficiency in
miles per gallon (MPG) based on its weight, horsepower, and
number of cylinders.

## Dataset
The application uses R's built-in `mtcars` dataset, which contains
information about vehicle characteristics and fuel efficiency.

## Methodology
A multiple linear regression model is used to predict MPG based on:
- Car weight
- Horsepower
- Number of cylinders

## Features
- Interactive weight and horsepower sliders
- Cylinder selection
- Reactive MPG prediction
- Comparison chart
- In-app usage instructions and limitations

## How to Run Locally
1. Install R and RStudio.
2. Install Shiny using `install.packages("shiny")`.
3. Open the folder containing `ui.R` and `server.R`.
4. Open `ui.R` in RStudio.
5. Click **Run App**.

## Limitations
The model uses a small historical dataset. Predictions are estimates
and may not reflect modern vehicles or real-world driving conditions.

## Live Application
Add your shinyapps.io application URL here after deployment.

## Author
Vandita Singh
