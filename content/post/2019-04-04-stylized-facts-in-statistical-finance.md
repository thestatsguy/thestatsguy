---
title: "Stylized facts in statistical finance"
date: "2019-04-04"
categories: ["Investing"]
---

<center>
<img src="https://miro.medium.com/max/1280/1*LZnClq6o0kEU88-BZnkvCw.jpeg" width="100%">
</center>

<p>In statistical finance (as well as in certain areas in social science), <a href="https://en.wikipedia.org/wiki/Stylized_fact">stylized facts</a> are empirical observations summarized in a theory-like form, and are generally representative under broad circumstances.</p>

<p>Stylized facts are commonly used in statistical finance to address and summarize phenomenon directly observed from historical data, and explainable with a certain level of theoretical consistency and logic ("... this makes sense to me"). Stylized facts may often guide investigations and explorations into certain topics of interest, functioning perhaps as assumptions to be either built upon or proven otherwise. Specifically, invalidating a stylized fact could be considered insightful, much like using data analysis and machine learning to invalidate certain entrenched assumptions held by business users.</p>

<p>In this first statistical finance post, I would like to list out a couple of stylized facts (SF), without explanation, that are observed and used in finance, for future referencing as well as for my own explorations.</p>

<ul><li><strong>(SF1)</strong> Financial data has extremely low signal-to-noise ratio.</li><li><strong>(SF2)</strong> Price changes are less volatile in bull markets and more volatile bear markets.</li><li><strong>(SF3)</strong> The autocorrelations of the returns of an asset is weak, hence univariate prediction of returns is not possible. However, volatility autocorrelation is strong, and volatility can be reasonably predicted (using e.g. <a href="https://en.wikipedia.org/wiki/Autoregressive_conditional_heteroskedasticity">GARCH</a> models).</li><li><strong>(SF4)</strong> Financial data usually have more extreme events or values than expected (fat tails, <a href="https://en.wikipedia.org/wiki/Black_swan_theory">black swans</a>).</li><li><strong>(SF5)</strong> Tail dependence between different assets are high, making <a href="https://en.wikipedia.org/wiki/Copula_(probability_theory)">copula</a> fitting worthwhile.</li><li><strong>(SF6)</strong> Past price changes are negatively correlated with future volatility.</li><li><strong>(SF7)</strong> Aggregate stock market returns (e.g. an index) display negative skewness; individual stock returns display positive skewness.</li><li><strong>(SF8)</strong> In the long run, stocks in a given market will be positively correlated.</li><li><strong>(SF9)</strong> Volatility clustering is typically observed in financial data; that is, large changes tend to be followed by large changes of either sign, and small changes tend to be followed by small changes of either sign.</li></ul>

<p>There are probably more and more advanced ones that I have yet to come across, so I will probably add on to the list over time. In any case, I will start with these SFs and other techniques in the meantime, in my exploration of statistical finance. I also be using these SF indices (SF1 etc.) as references in future posts to reduce verbose.</p>