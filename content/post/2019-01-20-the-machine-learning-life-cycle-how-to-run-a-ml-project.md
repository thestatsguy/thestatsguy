---
title: "The Machine Learning Life Cycle: how to run a ML project"
date: 2019-01-20
categories: ["ML & Stats"]
---

<center>
<img src="https://3gp10c1vpy442j63me73gy3s-wpengine.netdna-ssl.com/wp-content/uploads/2018/03/Screen-Shot-2018-03-22-at-10.41.30-AM-1024x579.png" width="100%">
</center>

<p>I recently came across this <a href="https://www.datarobot.com/wiki/machine-learning-life-cycle/">page</a> in the <a href="https://www.datarobot.com/wiki/">DataRobot Artificial Intelligence Wiki</a>. If you don't already know, <a href="https://www.datarobot.com/sg/">DataRobot</a> is currently one of the top <a href="https://en.wikipedia.org/wiki/Automated_machine_learning">automated machine learning</a> platform in the market, with emphasis on supervised learning and citizen data science. I am quite a big fan of their platform - even though I don't use it in my work, I believe that they and their competitors in the market are heading into the right direction towards automated machine learning. In any case, this is not my intended topic for today.</p>

<p>If you have worked on data science projects previously, odds are you would have heard of the term CRISP-DM, short of <a href="https://en.wikipedia.org/wiki/Cross-industry_standard_process_for_data_mining">CRoss Industry Standard Process for Data Mining</a>. CRISP-DM was developed by five European countries, including Teradata, in 1997, though it's now largely recognized as being associated with IBM and SPSS.</p>

<center>
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/CRISP-DM_Process_Diagram.png/800px-CRISP-DM_Process_Diagram.png" width="100%">
The CRISP-DM Process
</center>

<p>The official CRISP-DM manual is this <a href="ftp://public.dhe.ibm.com/software/analytics/spss/documentation/modeler/18.0/en/ModelerCRISPDM.pdf">50-page document</a>, which if I said that I have read it, I would be lying. Nonetheless, CRISP-DM is intuitive enough for me to use it in my work, in order to scope and run data science projects. There are multiple ways to use CRISP-DM, such as manhours scoping and costing and milestones and success criteria setting. So naturally, I was intrigued by the DataRobot's version of CRISP-DM, and decided to look a little bit deeper.</p>

<h3>How to run a ML project - a hypothetical walkthrough</h3>

<p>In essence, I will also use this post to illustrate how a typical data science project can be run and managed hypothetically.</p>

<h3>Running a project using the DataRobot Machine Learning Cycle - 5 major steps</h3>

<p>There are five majors steps in the DataRobot (DR) Machine Cycle:</p>

<ol><li>Define project objectives</li><li>Acquire and explore data</li><li>Model data</li><li>Interpret and communicate</li><li>Implement, document and maintain</li></ol>

<p>Let's walk through each of them and look slightly deeper.</p>

<h3>1. Define project objectives</h3>

<p>Under this step, there are:</p>

<ul><li><strong>Specify business problem</strong> - this is usually related to defining the motherhood statement or problem statement of the project. Typically, a problem statement can be broken into multiple usecases. To give you an example in HR analytics, the problem statement of <em>"How can the impact of employee attrition to the company be minimized?"&nbsp;</em>can be broken down into at least 2 usecases:<ol><li>Predict the attrition risk of a given employee</li><li>Predict the performance of a given employee</li></ol></li><li><strong>Acquire subject matter expertise</strong> - primarily, consulting the SMEs to make initial and final assessments on whether the project is feasible. Questions can include potential drivers of phenomenon, availability of data, or potential value created.</li><li><strong>Define unit of analysis and prediction target</strong> - this sounds trivial, right? In actual fact, this can turn out to be the most contentious and make-or-break factor in certain types of projects. To illustrate an example, consider a typical product hierarchy of a company that produces goods. There is typically a SKU or UPN level which describes a product in the most granular terms, which then cascades up multiple levels to the top. <strong>At which level do you think predictions of sales or demand makes the most sense?</strong> Remember that this directly impacts model count - the lower the level, the more models there will be, while the higher the level, the less meaningful the models might possibly become. It's interesting how in some companies, demand planning and FP&amp;A are set out into different directions on this from the get-go.</li><li><strong>Prioritize modelling criteria</strong> - it's not abundantly clear to me what modelling criteria meant, but my best guess would be the modelling performance metrics, whether it's accuracy, log-loss, RMSE, ROC-AUC or others. Each has it's own context and significance in the business setting.</li><li><strong>Consider risks and success criteria</strong> - this should be straightforward. In many data science and ML projects, the emphasis typically lies in accuracy and/or automation. For example, if the as-is prediction or forecasting is already highly accurate then the emphasis should be on the to-be automation, with a success criteria of certain reduction in FTE.</li><li><strong>Decide whether to continue</strong> - a call that should be co-owned by business, IT, and data science.</li></ul>

<h3>2. Acquire and explore data</h3>

<ul><li><strong>Find appropriate data</strong> - yep.</li><li><strong>Merge data into a single table</strong> - yep.</li><li><strong>Conduct exploratory data analysis</strong> (EDA) - this is extremely important. Illustrating and validating business assumptions, as well as retrieving any data artifacts or surprising insights, such as trends or correlations, improves both customer experience and the subsequent modelling process. 1 to 2 iterations of EDA would be ideal.</li><li><strong>Find and remove any target leakage</strong> - yep, though target leakage is not a concept that many are familiar with. Again, the DR AI Wiki does a good job <a href="https://www.datarobot.com/wiki/target-leakage/">explaining</a> target leakage.</li><li><strong>Feature engineering</strong> - yep, though I would say that feature engineering should be a sustained and continuous activity throughout the project. For example, the 1 to 2 EDA iterations should give hints towards potential features to engineer.</li></ul>

<h3>3. Model data</h3>

<ul><li><strong>Variable selection</strong> - yep. There are many, many ways to do variable selection in a data-driven manner, but I would like emphasize here on <strong>customer-driven variable selection</strong>. Build some preliminary models based on a feature set that your customers, with their business knowledge, think are important. These prelim models can serve multiple purposes including EDA, assumption validation and setting a baseline model performance.</li><li><strong>Build candidate models</strong> - yep.</li><li><strong>Model validation and selection</strong> - yep.</li></ul>

<h3>4. Interpret and communciate</h3>

<p>This is where it gets hairy, and where I see most data scientists struggle. Needless to say, this is also one of the most important steps in any project.</p>

<ul><li><strong>Interpret model</strong> - where to even begin... No customer wants to hear that you are delivering a black box model to them, because no one wants to use a black box for day-to-day operations. Therefore, it's our job as data scientists to break things as much as possible for our customers. Here are some things that I usually consider:<ul><li>How the selected algorithms work (in brief)</li><li>Why certain features are dropped (e.g. multicollinearity, leakage, low predictive power, low significance, unactionable in the future, low/no data availability in the future)</li><li>How are certain features engineered</li><li>Which are the important features</li><li>How to interpret feature importance</li><li>How/why certain test cases are given respective predictions (<a href="https://thestatsguy.home.blog/2019/01/14/feature-contribution-another-way-to-think-about-feature-importance/">feature contributions</a>)</li><li>How do certain features interact (effect modification, statistical interaction, confounding)</li></ul></li><li><strong>Communicate model insights</strong> - build a nice ppt deck with the pointers illustrated above to get customers buy-in.</li></ul>

<h3>5. Implement, document and maintain</h3>

<p>After buy-in and green light to productionize, last but definitely not the least we do the following:</p>

<ul><li><strong>Set up batch or API prediction system</strong> - depending on problem statement / usecases / future data availability / business context / customer infrastructure readiness</li><li><strong>Document modelling process for reproducibility</strong> - don't be lazy. In fact, this shouldn't be here in the last steps. This should be done consistently throughout the project!</li><li><strong>Create model monitoring and maintenance plan</strong> - again dependent on multiple factors. There are multiple ways to refresh a model, from simply retuning with updated data, to start from scratch with the business assumptions. The right answer is always somewhere in the middle.</li></ul>

<h3>Running data science projects using process models</h3>

<p>As mentioned above, I wanted to use this post to illustrate how a typical data science project can be run and managed hypothetically. Overall, my understanding on running ML projects is pretty close to the DR Machine Learning Cycle. Finally, note that each of these process models are built with their respective software in mind:</p>

<ul><li>DR Machine Learning Cycle for DR</li><li>CRISP-DM for IBM</li><li><a href="https://en.wikipedia.org/wiki/SEMMA">SEMMA</a> for SAS - I didn't talk about SEMMA because it's too simplistic and focused on the actual data analysis and modelling rather than the business side of things.</li></ul>

<p>But that doesn't mean that these can't be extrapolated and modified to your needs. That's all for this post, thanks for reading!</p>