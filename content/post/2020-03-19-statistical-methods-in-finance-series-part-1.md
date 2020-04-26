---
title: "[short] Statistical methods in finance series - SMFS Part 1"
date: "2020-03-19"
categories: ["Stats finance"]
---

<center>
<img src="https://miro.medium.com/max/1280/1*LZnClq6o0kEU88-BZnkvCw.jpeg" width="100%">
</center>

It's a sleepless night, so I decided to write a little. This will be the first part of a series that I would like to write about, circling around the use of statistical methods in finance. Most of the content that I will be exploring would originate from one of my NUS M.Sc Statistics modules, Advanced Statistical Methods in Finance. I was taught by Prof Xia Yingcun when I did this module.

Of all the modules that I did during my M.Sc, I always found this one to resonate with me the most - guess that's mainly because I like topic, as well as of the fact that I was heavily experimenting with investing on my own during that time. I also found that using finance as the backdrop or context to study certain statistical concepts, such as copula or factor analysis, to be more engaging than perhaps studying these topics in vaccum.

# Statistical methods in finance

There are a number of statistical methods that can be directly mapped to their applications in finance:

* Statistical distributions: Value-at-Risk (VaR)
* Linear regression: Capital Asset Pricing Model (CAPM)
* Factor analysis: Arbitrage Pricing Theory
* Logit/probit models: credit scoring/rating
* Time series analysis: price forecast, volatility modelling
* Nonlinear regression: term structures of interest rates
* Monte-Carlo simulations: pricing of assets
* Copulae: tail dependence of asset prices
* Estimation of covariance matrix and optimization: Markowitz's portfolio theory
* and many more...

In this series, I would like to tackle some of these topics, by combining statistical theory, finance theory, and the use of R where relevant.

# Broader question: can statistics be used to make a profit?

Since there are folks who decided to spend the time and energy to study the application of statistical methods in capital markets, surely it's a worthwhile effort and making money is possible? Well, yes and no. It's well known in statistical finance is that financial data has extremely low signal-to-noise (SNR) ratio. This means that for a model that predicts price, even if the model is correctly specified, due to the low SNR, it's unlikely for the predictions to be useful. Most folks would hence consider the study of price volatility to be more important than price itself. If we are able to have an informed point of view about future volatility (perhaps due to the fact that volatility autocorrelation is strong => volatility may be predicted in a GARCH/ARCH model), we would be able to act accordingly. We will talk about this along the way in this series.

# Stylized fact in statistical finance

I previously (well, a year ago) wrote about [stylized facts](https://thestatsguy.netlify.com/2019/04/04/stylized-facts-in-statistical-finance/) in statistical finance, where I briefly listed without explanations various "facts". Stylized facts are commonly used in statistical finance to address and summarize phenomenon directly observed from historical data, and explainable with a certain level of theoretical consistency and logic. There are a number of well-known ones, such as:

* Financial data has extremely low signal-to-noise ratio.
* Price changes are less volatile in bull markets and more volatile bear markets.
* Volatility clustering is typically observed in financial data; that is, large changes tend to be followed by large changes of either sign, and small changes tend to be followed by small changes of either sign.
* and others

In this series, we will necessarily also delve a little deeper into some of these stylized facts, by considering both empirical (historical data) and theoretical perspectives.

That's it for a brief introduction to series - looking forward to do deep dives into various topics!