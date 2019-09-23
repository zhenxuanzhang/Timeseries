# install.packages('TSA')
# install.packages('tseries')
library('TSA')
library('tseries')
# install.packages('zoo')
library('zoo')
# install.packages('forecast')
library('forecast')
plot(LakeHuron)

## 白噪声检验
Box.test(LakeHuron,6)

## 自偏相关系数判定阶数
acf(LakeHuron)
pacf(LakeHuron)

## 拟合AR
fit1 = arima(LakeHuron,order = c(2,0,0))
fit1
tsdiag(fit1)

## 信息准则
AIC(fit1)
AIC(fit2)
BIC(fit1)
BIC(fit2)

## 预测
fore1 = predict(fit1,10)
fore1
fore1 = forecast(fit1,10)
fore1
plot(fore1)
lines(fitted(fit1),col=2)

## 机器定阶
fit3 = auto.arima(LakeHuron)

## 差分
fit2 = arima(LakeHuron,order = c(2,1,0), transform.pars = F, fixed = c(0,NA))
fit2
tsdiag(fit2)

fit9 = arima(LakeHuron,order = c(9,0,0), transform.pars = F, fixed = c(NA,NA,0,0,0,0,0,0,NA,NA))
fit9
