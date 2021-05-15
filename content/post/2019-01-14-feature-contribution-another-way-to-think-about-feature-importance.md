---
title: "Feature Contribution - another way to think about feature importance"
author: ~
date: '2019-01-14'
slug: feature-contribution-another-way-to-think-about-feature-importance
categories: ["Machine learning & Statistics"]
---

<!-- wp:image -->
<center>
<figure class="wp-block-image"><img src="https://3qeqpr26caki16dnhd19sv6by6v-wpengine.netdna-ssl.com/wp-content/uploads/2016/07/XGBoost-Feature-Importance-Bar-Chart.png" alt=""/><figcaption>A typical feature importance plot. <a href="https://3qeqpr26caki16dnhd19sv6by6v-wpengine.netdna-ssl.com/wp-content/uploads/2016/07/XGBoost-Feature-Importance-Bar-Chart.png">Image source</a>.</figcaption></figure>
</center>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>In many machine learning models, feature importance or variable importance is an important output from the model as it informs us about the relative or absolute importance of each feature in contributing to the model. More specifically, feature importance tells us which are the features that are highly differentiating, in the case of classification, and which are those that are not.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>However, one shortfall of feature importance is that it's global in nature - it informs the data scientist about the overall strength of the features as a whole in the dataset. What if something more granular and refined is required? Just because a feature is high up on the feature importance list does not mean that it's always important.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3>Logistic regression as an example</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Suppose you have some logistic regression model in the form</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">logit(p) =  β<sub>0</sub> + β<sub>1</sub>x<sub>1</sub> + ... + β<sub>p</sub>x<sub>p</sub></pre>
<!-- /wp:preformatted -->

<!-- wp:paragraph -->
<p>For a given test case with p features, you would get the predicted probability by substituting each actualized feature value into the model (and do the inverse logit transformation). Naturally, different test cases would have different actualized feature value, summing up to different predicted probabilities.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Therefore, it's intuitive to think about how a feature contributes to the predicted probability of a given test case:</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">feature contribution of x<sub>k</sub> = |β<sub>k</sub>x<sub>k</sub>| / (|β<sub>0|</sub> + Σ|β<sub>i</sub>x<sub>i</sub>|) ∈ [0,1]</pre>
<!-- /wp:preformatted -->

<!-- wp:paragraph -->
<p>With this, we can say the x<sub>k</sub> contributes to the predicted probability of a given test case for some proportion or percentage, i.e. the feature contribution.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3>Generalizing to tree-based models</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>This way of evaluating individual feature contribution can be generalized to beyond linear models. For example, in a decision tree, a given test case would have a given prediction pathway that it takes down the decision tree - passing through to multiple junctions in the tree. The gain or loss in predicted probabilities or predicted values can be tracked accordingly, leading to a similar notion of feature contribution.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Moreover, this can further generalized to ensemble models, such as Random Forest, ExtraTrees and even XGBoost.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>I leave you with these two blog posts and the treeinterpreter package in Python as it has already been explored:</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><li><a href="http://blog.datadive.net/interpreting-random-forests/">http://blog.datadive.net/interpreting-random-forests/</a></li><li><a href="https://blog.datadive.net/random-forest-interpretation-conditional-feature-contributions/">https://blog.datadive.net/random-forest-interpretation-conditional-feature-contributions/</a></li><li><a href="https://github.com/andosa/treeinterpreter">https://github.com/andosa/treeinterpreter</a></li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>That's all for this short post, hope it helps in bringing you to think slightly deeper about feature importance.</p>
<!-- /wp:paragraph -->