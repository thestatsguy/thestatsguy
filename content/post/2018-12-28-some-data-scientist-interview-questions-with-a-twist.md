---
title: "Some data scientist interview questions - with a twist"
date: 2018-12-28
categories: ["Machine learning & Statistics"]
---

<center>
<img src="https://thestatsguyhome.files.wordpress.com/2018/12/machine_learning.png" width="50%">
</center>
<center>
Machine Learning. Nothing to do with my intended topic, just a random xkcd comic that I thought is funny. [Source](https://xkcd.com/1838/)
</center>

<!-- wp:paragraph -->
<p>Been wanting to do this consolidation for some time, so here goes. I won't be touching on any language-specific questions (e.g. packages or functions), as I don't believe they are relevant in this Google/Stack Overflow era - kind of missing the forest for the trees. Also, won't be going over basic questions like "What is logistic regression" or "How does collaborative filtering works" or the like.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Rather, I want to be more focused on ML concepts that are closely tied to <strong>the consumption of ML models by business</strong>. Once ML matures in the market, the next more well-sought after set of skills should be closely related to <strong>translation of business requirements</strong>, <strong>model deep-diving</strong>, <strong>ML pipeline management (roadmapping)</strong>, and&nbsp;<strong>curation of models</strong>.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Questions will be categorized according to the following:</p>
<!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} -->
<ol><li><strong>Business understanding</strong> - developing business understanding in a short amount of time is a key skillset for a data scientist, in order to build superb ML models. In addition, managing your customers in the context between your ML practice and their business expertise is key to project success</li><li><strong>Statistics</strong> - contrary to plenty of data scientists out there, I continue to believe statistics is a pre-requisite core skillset to being a good data scientist (hence even the name of my blog)</li><li><strong>Model Building</strong></li><li><strong>Model Selection</strong> - it's easy to select models based on metrics like accuracy or ROC-AUC. What happens if there are additional concerns or complications from the business?</li><li><strong>Model Maintenance</strong> - a data scientist's job doesn't stop at building the models, it should also include keeping our models healthy for business consumption</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3>Business Understanding</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>1. As data scientists, a big part of our job is to understand the business in which our usecases originate from, and glean subtle ways in which our analysis and modelling could be influenced or impacted. This typically starts from multiple requirements gathering meetings we have with our customers. Given a predictive usecase, what would be some of the questions that you ask your customers in order to arrive at the relevant information?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Identify drivers, (strength of) business assumptions, get clarity of data availability of drivers, span of historical data available, exceptions, macro-environment changes and their impact, availability of external data</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>2. In the initial stages of modelling/exploratory data analysis, how would you validate your new found understanding the business and validate them with your customers?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Construct preliminary models, use customers' input directly as feature selection means</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>3. Suppose your analysis and/or models are giving plenty of output that deviates substantially from your customers' expectations - for example, unintuitive feature importance from a high quality model, or unexpected predicted values. How would you develop a compromise between good ML practice and their business knowledge and negotiate your way through the project?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>4. What is customer success and why is it important in data science projects?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>In many data science units, including both inward- and outward-facing units, customer success (CS) is often neglected as a form of "post-sales" activity. CS refers to the continued and sustained effort to ensure that the deliverables, regardless of models or tools etc., become an integral part of the customer's processes or workflows.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>CS is about maximizing the adoption and usage of the deliverables, to ensure that the customer is successful in operating the tools that have been delivered to them.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>While it seems reasonable to scope a project in terms of producing the deliverables subsequently ending the engagement thereafter, this is an unhealthy way of running any projects, including data science. CS is important because it is an indication of the return of investment for a project - for a outward-facing data science unit, CS and post-sales activities maximizes customer experience and quality of account, leading to sales/presales pipeline development. This is relevant for both software as well as professional services vendors. For a inward-facing unit, user adoption and value delivered can be directly measured to assess true value throughput of the data science unit in serving the company.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>As it turns out, CS is a function of multiple factors, including customer experience, user experience, and change management. As data scientists, there are a couple of things which we can do to directly contribute to CS:</p>
<!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} -->
<ol><li>During project scoping and requirements gathering, <strong>ensure that the project is well-scoped in time and space</strong>, in terms of e.g. unit of analysis, target variable, number of models, modelling criteria and success criteria. Strive to <strong>deliver clear understanding on data science terminologies</strong> to business stakeholders and users, minimize ambiguity and <strong>align expectations</strong>. For example, ML projects are typically pitched to create value in accuracy and/or automation. Ensure this expectation on accuracy and/or automation is aligned.</li><li><strong>Reduce the use of ad-hoc data</strong> (e.g. standalone, manually curated/maintained spreadsheets) where possible. If these datapoints turn out to be valuable to the models, create scripts or workflows to ensure data refreshes can be done as hassle-free as possible.</li><li><strong>Build confidence with customers</strong> by performing e.g. 1 to 2 rounds of exploratory data analysis (EDA). Illustrating and validating business assumptions, as well as retrieving any data artifacts or surprising insights, such as trends or correlations, improves customer experience and the subsequent modelling process. Present these pre-modelling results to customers for validation and communication.</li><li>Ensure the <strong>modelling process is clearly illustrated</strong> in an "explain-like-I'm-5" manner. Let customers understand why certain features are dropped, or why a certain feature is engineered in a particular manner. Customers should be able to understand feature importance in a model. Most importantly, <strong>customers should not feel that models are black-box</strong> as this increases the fear of the unknown and reduces model adoption.</li><li><strong>Document all work products</strong> throughout the project, from business assumptions, data preparation, modelling, to model deployment. This ensure reproducibility.</li><li>Finally, <strong>develop a reasonable model monitoring and maintenance process</strong>. Both data refreshes as well as model refreshes should be not too frequent, manual or time-consuming. A reasonable maintenance cadence maximizes model adoption and customer success.</li></ol>
<!-- /wp:list -->

<!-- wp:heading {"level":3} -->
<h3>Statistics</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>1. How do you detect statistical interactions in a dataset, and how would that affect your modelling?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Effect modification. Classical way is to use multiplicative terms in modelling, though not always scalable - O(n^2)-type complexity.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>2. How do you detect confounding in a dataset, and how would that affect your modelling? How does confounding differ from multicollinearity?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Tackle from epidemiology standpoint</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>3. Would it be apt to use p-values, either from univariate- or multivariate-type analysis, as indications of feature importance or as a means of feature selection? If yes, how would you use it? If no, what are your considerations?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>No. Definition of p-values and null hypothesis differs subtly from feature importance, but with substantial impact in interpretation.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>4. What is bias, and how would bias affect your analysis, modelling and interpretations of data?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Selection bias, information bias</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>5. What is the bias-variance tradeoff, and how would the tradeoff affect your modelling?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3>Model Building</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>1. Why is there a general tradeoff between model performance and interpretability? Suppose you constructed a high performing model that is essentially a black box e.g. a deep learning model. How would you present the model to your customers in an more interpretable manner?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Complexity of business environment, opaque drivers with unknown interactions. Build simple regression or decision tree models with important features from black box as proxy for interpretation.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>2. Given a reasonably clean dataset in a predictive usecase, what are the tasks standing between the dataset and a good model? Which are the tasks that would, in principle, take the longest time to perform?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Feature transformation, feature engineering, hyperparameter tuning, model selection. Feature engineering should be the challenging and take the longest. A good feature set can easily beat a well-tune model because the former is closer to the true underlying business context than the latter.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>3. Having a dataset with temporal element means that it lends itself to both typical supervised learning models as well as time series models. Again, in a predictive usecase, how would you decide which is a better way to reach quality predictions?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>4. Would your general modelling methodology differ substantially or at all if your customers are seeking explanations instead of predictions?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Broadly speaking, suppose we consider the divide between tree-based methods against linear regression methods. In the construction of a decision tree, the training dataset is divided into multiple discrete p-dimensional subspaces, where p is the number of features. To transcend from one subspace to its adjacent neighbor, one would have to make multiple unit increments in one direction towards a given subspace boundary, until the boundary is transcended. This means that throughout the unit increments, the predicted value of a test case remains the same, until the boundary is transcended. Contrast this to a linear regression-type method, where we can see the impact on predicted value for every unit increment of a given feature with its given coefficient. Intuitively, this could better aid in explanations and understanding, and can be used to perform sensitivity or what-if analysis for deeper insights.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>In addition, we could consider fit-emphasizing metrics such as R<sup>2</sup> instead of prediction-emphasizing metrics such as accuracy for model evaluation.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>5. In a multiclass classification problem, it is typically challenging to develop a high performing model. How would you tackle a multiclass classification problem?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Collapse class, multi-tier modelling, though errors in classification will cascade. If class is ordinal, measure error wrt distance to the correct class rather than in absolute terms.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3>Model Selection</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>1. Given two black box models, how would you choose one over the other?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Generally, we can consider the following: i) model performances on the testing&nbsp; sets, ii) model performances on fitted training sets, iii) feature importance, and iv) model simplicity.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>i) Model performances on the testing set is obviously important as it directly points to the model's ability to generalize to unseen cases.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>ii) Model performances on the fitted training sets can given an indication on the fundamental quality of the model itself. For example, if training performance outweigh testing performance by a large margin, then overfitting could be a concern. On its own, a low training performance indicates underfitting, while extremely high training performance could indicate target leakage.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>iii) Feature importance illustrates the relative weightages of underlying features in the model and how they contribute to reaching a prediction or outcome. In a scenario where a strong model outperforms a weaker model but with a somewhat bizarre and unintuitive set of feature importance, it becomes a business decision to make a prudent model selection. This is especially important in industries e.g. banking, where decisions to reject a loan may need to be entirely transparent.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>iv) Finally, Occam's razor would be a good heuristic to apply - for a given model performance, the simpler a model is, the better it is for human and business consumption.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>2. In usecases that typically exhibit class imbalance and yet not the extent where anomaly detection algorithms are appropriate, how would we ensure that the models selected are adequate for business consumption?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>In classification problems with class imbalance, one of the first things to experiment is upsampling the minority class or downsampling the majority class. Typically, the former is preferred as then we don't lose training samples. Subsequently, we can then follow up with the modelling, and more importantly, the selection of a metric robust to class imbalance, such as ROC-AUC or sensitivity or specificity per se. This is trivial.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>More importantly and very often neglected is a deliberate consideration of the risk or cost of a wrong prediction, especially in a class imbalance setting. For instance, suppose we are tackling an employee attrition usecase, where we are predicting if an employee is about to leave the company within the next 3 months, as an example. This is of course a typical class imbalance problem - most reasonably large companies have about 10 to 20% attrition rate as a healthy number.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>However, suppose the usecase is specific to high potential individuals within the employee population - employees who are earmarked by HR and management as e.g. successors of critical roles in the company (hence high potential). In this context, a false negative, i.e. wrongly predicting no attrition, becomes a costly mistake. In contrast, a false positive is a false alarm and is much less costly.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>How do we capture this asymmetry in cost/risk in our model evaluation process? A solution would be develop a utility function <em>U(m)</em>, and assign relative utility to our prediction outcomes, as below:<br>
</p>
<!-- /wp:paragraph -->

<!-- wp:table -->
<figure class="wp-block-table"><table><tbody><tr><td><strong>Prediction outcome</strong></td><td><b>Utility</b></td></tr><tr><td>True positive</td><td>1</td></tr><tr><td>True negative</td><td>1</td></tr><tr><td>False positive</td><td>-5</td></tr><tr><td>False negative</td><td>-50</td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p>Then, the utility of a model <em>m</em> would be
</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">U(m) = TP(n<sub>1</sub>) + TN(n<sub>2</sub>) - 5FP(n<sub>3</sub>) - 50FN(n<sub>4</sub>)</pre>
<!-- /wp:preformatted -->

<!-- wp:paragraph -->
<p>where <em>n<sub>i</sub></em> are the respective case counts of each prediction outcome. Model tuning and validation can then be done by maximizing utility.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>3. In most projects, multiple models are selected to be production-grade and their respective output are combined. What are the different ways we can combine multiple models?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>There are various ways in which models can be combined, such as boosting, ensemble learning and stacking. I would like to focus here on a less well-known approach known as <a href="https://en.wikipedia.org/wiki/Analytic_hierarchy_process" target="_blank" rel="noopener">analytical hierarchy process</a>&nbsp;(AHP).&nbsp;In essence, AHP is utility-driven way of combining different types of models to reach a single conclusion. The best way to illustrate AHP is the use of an example.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Consider a HR analytics problem statement: how can the impact of employee attrition to the company be minimized?</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Typically, in HR analytics, we can say that primary outcomes that are impactful and can evaluated are performance, potential, and attrition. We can therefore formulate three usecases to culminate into our problem statement:</p>
<!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} -->
<ol><li>Predict the short-term performance of a given employee</li><li>Predict the potential/runway of a given employee</li><li>Predict the attrition risk of a given employee</li></ol>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>This necessarily means that we would at least have three different models, with three different target variables, to construct. How would we then combine these models to address the problem statement of minimizing employee attrition? This is done using AHP to build a utility function, by assign utilities or weights to the predicted probabilities of each model. Without going through the details of AHP, following are examples of simple utility functions:
</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">impact of attrition =
attrition risk * short-term performance + 5 * attrition risk * potential

impact of attrition =
attrition risk * employee rank * (short-term performance + potential)

impact of attrition =
attrition risk * (40 - tenure) * potential</pre>
<!-- /wp:preformatted -->

<!-- wp:paragraph -->
<p>Note that we can include additional layers of modelling in the AHP to capture specific intricacies and requirements - for example, the utility function need not be a linear combination of weights, but a decision tree or a matrix.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>In general, AHP is an extremely powerful method to combine multiple models to address a large and encompassing problem statement.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3>Model Maintenance</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><strong>1. What are the points of consideration in deciding when and how to update or refresh a model?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>In general, the performance of a model erodes over time, with changes in business environment. Model refresh is therefore an important consideration even before commencement of any data science project.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>There are a number of factors when considering when and how to refresh a model:</p>
<!-- /wp:paragraph -->

<!-- wp:list {"ordered":true} -->
<ol><li>Availability of data - when can fresh datapoints be captured and sufficiently verified? For example, fresh datapoints could be captured on a weekly or monthly basis. This implies that models can be refreshed at most at a weekly or monthly basis. On the other hand, with monthly captures but only quarterly validation means that models can be refreshed at most at a quarterly basis.</li><li>Changes in business environment - has there been a major change in the environment? For example, new policies announced or implemented by authorities, entry of new competitors, new product launches, major news or events could all justify model refreshes. Of course, this is also dependent on data availability.</li><li>Refresh/no refresh cost-benefit analysis - for example, a model refresh could require collection of updated datapoints with some man effort in the executing the refresh, which leads some dollar value cost. On the other hand, the benefit of the refresh is deemed to be of low consequence and unlikely to steer decision making or operations in significant manner, which leads to some dollar value benefit.</li></ol>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p><strong>2. What are the ways you can refresh a model (from ML perspective, not engineering perspective)?</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The simplest way to refresh a model is the simply rerun the training algorithm on the updated data with a fresh round of hyperparameter tuning. The next order of complexity would be to re-execute the training process with the same feature set (with updated data), but re-experimenting with the various training algorithms. Layering on that could be additional feature engineering for potentially better model performances.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Finally, the most labour-intensive form of refresh would be to rework the entire model from scratch, starting again with requirements gathering and assumptions validation, with possibly new feature sets.</p>
<!-- /wp:paragraph -->