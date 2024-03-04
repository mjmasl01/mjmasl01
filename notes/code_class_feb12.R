library(here)
library(tidyverse)
library(broom)

statsurvey_df <- read_csv(here("data/stat113_survey.csv"))

statsurvey_nomiss <- statsurvey_df |> filter(!is.na(GPA))
statsurvey_nomiss <- statsurvey_nomiss |>
  mutate(time_year = as.numeric(time_year)) |>
  mutate(a_year = if_else(time_semester == "S",
                          true = time_year - 1,
                          false = time_year)) |>
  filter(GPA <= 4.0) |>
  mutate(a_year_fact = as.factor(a_year),
         a_year = a_year + 2000)




