library(tidyverse)
library(openxlsx)
library(readxl)
library(writexl)
library(lubridate)
library(bizdays)



clean_data <- function(raw_data_as400) {
  
  cleaned_data <- raw_data_as400 %>%
    dplyr::mutate(order_date = as.Date(order_date),
                  delivery_date = as.Date(delivery_date),
                  ship_date = as.Date(ship_date),
                  date_acknowledge = as.Date(date_acknowledge),
                  date_acknowledgement_calc = as.Date(date_acknowledgement_calc)) %>%
    dplyr::rename("Profile owner" = profile_owner,
                  "Profile name" = profile_name,
                  "Enter by" = enter_by,
                  "Enter by name" = enter_by_name,
                  Leader = leader,
                  "Leader name" = leader_name,
                  Loc = loc,
                  Order = order,
                  CustomerName = customer_name,
                  Customer = customer,
                  OrderDate = order_date,
                  Week = week_number,
                  DeliveryDate = delivery_date,
                  ShipDate = ship_date,
                  "Order Acknowledgement Flag" = order_ack,
                  "Date acknowledge" = date_acknowledge,
                  "Date Acknowledgement Calc." = date_acknowledgement_calc,
                  "Days to acknowledge" = days_to_acknowledge) %>% 
    dplyr::filter(!is.na(OrderDate) & OrderDate != 0) 

  
  
  return(cleaned_data)
}


data_info <- function() {
  data_info <- raw_data_as400[3, ]
  data_info <- data_info %>% 
    dplyr::select(1)
  return(data_info)
}

# Default Data 
raw_data_as400 <- read_xlsx("anonymized_data.xlsx")
cleaned_default_data <- clean_data(raw_data_as400)


