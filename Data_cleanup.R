y = read.csv("Data/port3.csv", stringsAsFactors = FALSE, header = TRUE) #imports daily_sample.csv as data.frame with headers as the variable names

num = y$PERMNO


for (j in 2:nrow(y)) {
    
    row <- y[j,1]
    prev_row <- y[j-1,1]
    
    if(prev_row == row){
      print(y[j,3])
    }
    
    else{
    data1 <- na.omit(subset(y, y[,1]==num[j], select = c(PERMNO, date, PRC, VOL, BID, ASK, TICKER), drop = FALSE))
      
    # data_num <- ifelse(is.na(data1[1]), print("Empty data"), ifelse(nrow(data1 > 6000), data1, next))
    if (nrow(data1) > 5500) {

          # trade indicator = if previous price is smaller 1, else -1 ?
          # constant_spread = nls(Change ~ spread * Change_q + delta * lagged_q, data=data_num, start=list(delta=0.5, spread=0.5))
          # trade_reversal = nls(Qt ~ (1-2*pi)*lagged_q, data=y, start=list(pi=0.5))
          # alpha_beta = nls(Change_mid ~ Beta * half_spread * lagged_q + alpha * half_spread * lagged_q - (1 - 2 * pi) * alpha * half_spread * seclagged_q, data=y, start=list(alpha=0, Beta=0))
          
          # co = coef(constant_spread)
          # co1 = coef(trade_reversal)
          # spread = getElement(co, "spread")
          # delta = getElement(co, "delta")
          # pi = getElement(co, "pi")
          
          # co3 = coef(alpha_beta)
          # alpha = getElement(co3, "alpha")
          # beta = getElement(co3, "beta")
          
          # stock_name = y$TICKER[j]
          # rows = (nrow(newdata1))
          # s = cbind(stock_name, rows)
          # s = cbind(spread, delta, stock_name, pi, alpha, beta)
          s <- y$TICKER[j]
          u <- summary(data1)
          d <- merge(s, u)
          write.table(u, "Data/portfolio3_summary.csv", append = T, eol= "\n")
    }
    }
}