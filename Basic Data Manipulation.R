df <- read.csv("C:\\Users\\yuanzi\\Documents\\career\\Springboard\\assignments\\Data Wrangling Exercise 1\\refine_original.csv")

cc <- c(p = "Smartphone", v = "TV", x = "Laptop", q = "Tablet")

df %>% 
  mutate(company = tolower(company)) %>% 
     mutate(company = str_replace(company, "^[p|f].*s$", "philips")) %>% 
        mutate(company = str_replace(company, "^a.*o$", "akzo")) %>% 
           mutate(company = str_replace(company, "^u.*r$", "unilever")) %>% 
             separate(Product.code...number, c("product_code", "product_number"), remove = FALSE) %>%
                mutate(product_category = cc[product_code]) %>%
                   unite(full_address, address, city, country, sep = ",", remove = FALSE) %>%
                      mutate(company_philips = as.numeric(company == "philips"), company_akzo = as.numeric(company == "akzo"), 
                              company_van_houten = as.numeric(company == "van_houten"), company_unilever = as.numeric(company == "unilever"),
                                  product_smartphone = as.numeric(product_category == "Smartphone"), product_tv = as.numeric(product_category == "TV"),
                                     product_laptop = as.numeric(product_category == "Laptop"), product_tablet = as.numeric(product_category == "Tablet")) %>%
                                        write.csv("C:\\Users\\yuanzi\\Documents\\career\\Springboard\\assignments\\Data Wrangling Exercise 1\\refine_clean.csv", row.names = FALSE)