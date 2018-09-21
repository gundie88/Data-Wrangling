transmutate says you only want those certain things, mutate takes what you want and adds a new column.

tq_transmute(select = adjusted,
               mutate_fun = periodReturn, 
               period = "daily",
               type = "log")

* selects the column adjusted.              
* tq_transmute = It returns only newly created columns.
* mutate_fun = The mutation function from either the xts, quantmod, or TTR package.
* quantmod::periodReturn() = Given a set of prices, return periodic returns.
daily return. 


tq_portfolio(assets_col=symbol,
               returns_col=daily.returns, 
               weights = tibble(asset.names = friend, weight = c(0.259,.534,.207)),
               wealth.index = T)


* tq_portfolio =  Aggregates a group of returns by asset into portfolio returns
* PerformanceAnalytics::Return.portfolio = Using a time series of returns and any regular or irregular time series of weights for each asset, this function calculates the returns of a portfolio with the same periodicity of the returns data.
* All weights should add up to one.
