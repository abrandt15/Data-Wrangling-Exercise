library(tidyverse)
refine <- read_csv("R/refine_original.csv")
head(refine)

#1: Clean up brand names

refine$company <- refine$company %>%
  tolower()
refine$company
head(refine)

#2: Separate product code and number

refine <- refine %>% separate(`Product code / number`, c("product_code", "product_number"), convert = TRUE)
         
head(refine)

#3: Add product categories

  refine <- refine %>% mutate(product_categories = gsub("p", "Smartphone", product_code),
                              product_categories = gsub("v", "TV", product_code),
                              product_categories = gsub("x", "Laptop", product_code),
                              product_categories = gsub("q", "Tablet", product_code)
            
  head(refine)

#4: Add full address for geocoding
  
  refine <- refine %>% unite("full_address", c("address", "city", "country"), sep = ",")
  head(refine)

#5: Create dummy variables for company and product category
  
  company_phillips <- ifelse(refine$company == "phillips",1,0)
  company_akzo <- ifelse (refine$company == "akzo",1,0)
  company_van_houten <- ifelse (refine$company == "van houten",1,0)
  company_unilever <- ifelse (refine$company == "unilever",1,0)
  product_smartphone <- ifelse(refine$product_categories == "Smartphone",1,0)
  product_tv <- ifelse (refine$prdouct_categories == "TV",1,0)
  product_laptop <- ifelse (refine$product_categories == "Laptop",1,0)
  product_tablet <- ifelse (refine$product_categories == "Tablet",1,0)
  

