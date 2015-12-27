library(lubridate)
res = read.csv("data/Residential_Data_Report_FY2016.csv")
res$SALE.DATE.1 = strptime(res$SALE.DATE.1, "%m/%d/%Y %H:%M:%S %p")
res$SALE.DATE.2 = strptime(res$SALE.DATE.2, "%m/%d/%Y %H:%M:%S %p")
res$SALE.DATE.3 = strptime(res$SALE.DATE.3, "%m/%d/%Y %H:%M:%S %p")
res$SALE.DATE.4 = strptime(res$SALE.DATE.4, "%m/%d/%Y %H:%M:%S %p")
res$SALE.DATE.5 = strptime(res$SALE.DATE.5, "%m/%d/%Y %H:%M:%S %p")
res$SALE.DATE.6 = strptime(res$SALE.DATE.6, "%m/%d/%Y %H:%M:%S %p")

# Pick recent sales
recents = res[year(res$SALE.DATE.1) == 2015 |
              year(res$SALE.DATE.1) == 2014 |
              year(res$SALE.DATE.1) == 2013 |
              year(res$SALE.DATE.1) == 2012 |
              year(res$SALE.DATE.1) == 2011 |
              year(res$SALE.DATE.1) == 2010, ]


# Pick only "Residential Buildings"
res_blds = recents[recents$ASSESS.DESC.1 == "RES BLD", ]

# Pick Residentila buildings less than 1.2M
res_blds = res_blds[res_blds$SALE.PRICE.1 <= 1200000,]

res_blds$YEAR = as.factor(year(res_blds$SALE.DATE.1))
