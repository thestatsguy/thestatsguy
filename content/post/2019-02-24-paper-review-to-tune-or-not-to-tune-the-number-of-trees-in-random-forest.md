---
title: "Paper Review: To Tune or Not to Tune the Number of Trees in Random Forest"
date: 2019-02-24
categories: ["Machine learning & Statistics"]
---

<center>
<img src="https://thestatsguyhome.files.wordpress.com/2019/02/download2-1.png" width="100%">
Plotting different performance metrics against the number of trees in random forest. [Source](https://github.com/PhilippPro/tuneNtree/blob/master/graphics/binary_classification.pdf)
</center>

<p>I came across the following paper during my Masters coursework that addresses a practical issue in the use of the random forest model, and in general, any other bootstrap aggregating ensembles:</p>

<p><a href="http://jmlr.org/papers/v18/17-269.html">Probst, P. &amp; Boulestix, A-L. (2018). To Tune or Not to Tune the Number of Trees in Random Forest. Journal of Machine Learning Research, 18(181), 1-18. </a></p>

<h2>1. Motivation</h2>

<p>This is an interesting paper as it directly addresses a fundamental question on whether the number of base learners in a bagging ensemble should be tuned. In the case of random forest (RF), the number of trees <em>T</em> is often regarded as a hyperparameter, in the sense that either too high or too low of a value would yield sub-par model performance. Tuning of <em>T</em> is typically done by plotting the one or multiple chosen out-of-bag (OOB) metrics, such as the error rate, as a function of <em>T</em>:</p>

<center>
<img src="https://thestatsguyhome.files.wordpress.com/2019/02/download.png" width="100%">
Different OOB metrics (error rate, Brier score, log loss, AUC) as a function of <em>T</em>. [Source](https://github.com/PhilippPro/tuneNtree/blob/master/graphics/binary_classification.pdf)
</center>

<p>In the case above, there are clear indications of convergence in <em>T</em>, and any further increase in <em>T</em> brings either marginal or zero improvements in model performance. However, that's not always the case, prompting the treatment of <em>T</em> as a model hyperparameter:</p>

<center>
<img src="https://thestatsguyhome.files.wordpress.com/2019/02/download2.png" width="100%">
Non-convergence of <em>T</em>. [Source](https://github.com/PhilippPro/tuneNtree/blob/master/graphics/binary_classification.pdf)
</center>

<h2>2. Objectives of paper</h2>

<p>Based on this motivation, the authors move step by the step to give this issue a structured treatment along the following objectives:</p>

<figure class="wp-block-table"><table class=""><tbody><tr><td><strong>Quoted from abstract</strong></td><td><strong>Layman explanations</strong></td></tr><tr><td>(i) Provide theoretical results showing that the expected error rate may be a non-monotonous function of <em>T</em>, and explaining under which circumstances this happens</td><td>Show that the error rate of RF may increase or decrease as <em>T</em> increases (non-monotonous), depending on a certain phenomenon that could be observed from the testing dataset.</td></tr><tr><td>(ii) Provide theoretical results showing that such non-monotonous patterns cannot be observed for other performance measures such as the Brier score and the log loss (for classification) and the MSE (for regression)</td><td>Show that such non-monotonicity cannot be observed for performance metrics such as the Brier score, log loss and MSE, even though it can be observed for the error rate - sorry for the double negative, take a moment to digest that before you get confused further.<br><br>(It is also shown in the paper that the ROC-AUC follows such non-monotonicity.)</td></tr><tr><td>(iii) Illustrate the extent of the problem through an application to a large number (306) datasets</td><td>Validate findings via empirical experimentations using public ML datasets</td></tr><tr><td>(iv) Argue in favor of setting <em>T</em> to a computationally feasible large number as long as classical error measures based on average loss are considered</td><td>Conclude that <em>T</em> should not be tuned, but set to a feasibly large number.</td></tr></tbody></table></figure>

<h2>3. Structure of paper</h2>

<ol><li>Motivation and literature review</li><li>Build up RF and various performance metrics for theoretical context</li><li>Theoretical treatment (mainly binary classification, results for multiclass classification and regression are extrapolated and inferred)</li><li>Empirical validation</li><li>Conclusions and extensions</li></ol>

<h2>4. Five takeaways from the authors</h2>

<p>Without boring you as the reader on the specifics of the theoretical and empirical treatments to the problem, here are the key takeaways from the authors (with my translations):</p>

<ol><li><strong>Non-monotonicity (as a function of </strong><em><strong>T</strong></em><strong>) can only be observed for the error rate and the ROC-AUC</strong>, but not for typical performance metrics such as the Brier score, log loss, or MSE.</li><li><strong>*The behaviour of the error rate as a function of </strong><em><strong>T</strong></em><strong> (error rate curve) is largely dependent on the empirical OOB distributions of the prediction errors ε</strong><sub><strong>i</strong></sub> - this is the most important point in this paper for me, to be elaborated further.</li><li><strong>For regression, non-monotonicity can be observed from median-based (as opposed to mean-based) performance metrics</strong>. This makes sense since typical recursive partitioning in the base learners goes for squared error minimization.</li><li><strong>The biggest OOB performance gain comes from the first 250 trees; going from 250 to 2000 trees yields minimal performance gains</strong>. This is true for binary classification, multiclass classification, and regression.</li><li><strong>More trees are better</strong> - non-monotonicity is only observed under specific conditions, with specific performance metrics. Even under non-monotonicity, the difference between the converged metric and its global extreme is minimal. Therefore, <strong>set </strong><em><strong>T</strong></em><strong> to a computationally feasible large number</strong>.</li></ol>

<h2>5. Empirical OOB distributions of prediction errors</h2>

<p>One of the key takeaways from this paper is that the behaviour of the error rate as a function of <em>T</em> (error rate curve) is largely dependent on the empirical OOB distributions of the prediction errors ε<sub>i</sub>. In the paper, it was shown theoretically that the convergence rate of the error rate curve is only dependent on the distribution of ε<sub>i</sub>. In particular,</p>

<ul><li>In a largely accurate (many observations with ε<sub>i</sub>  ≈ 0, few observations with ε<sub>i</sub>  ≈ 1) ensemble, observations with ε<sub>i</sub> &gt; 0.5 will be compensated by observations with ε<sub>i</sub> &lt; 0.5 , in such a way that the error rate curve is monotonously decreasing.</li><li>However, in ensembles with many ε<sub>i</sub>  ≈ 0 and a few ε<sub>i</sub> ≥ 0.5 that are close to 0.5, a problem arises. By the authors' computations, due to these fringe cases (model is uncertain <strong>∴</strong> ε<sub>i</sub>  ≈ 0.5), the error rate curve falls down quickly, then grows again slowly to convergence. The following should make a convincing case:</li></ul>

<center>
<img src="https://thestatsguyhome.files.wordpress.com/2019/02/untitled.png" width="100%">
OOB error rate curves for three datasets from OpenML. [Source](http://jmlr.org/papers/v18/17-269.html)
</center>

<center>
<img src="https://thestatsguyhome.files.wordpress.com/2019/02/untitled2.png" width="100%">
OOB ε<sub>i</sub> distributions from RF models on the same three datasets. [Source](http://jmlr.org/papers/v18/17-269.html)
</center>

<p>These are rather high impact findings as <strong>in practice, the empirical OOB distributions of ε</strong><sub><strong>i</strong></sub><strong> are often not reviewed, especially in the setting of RF or any other ensemble&nbsp;modeling&nbsp;exercise</strong>. (On the other hand, if your training is in statistics, then linear regression diagnostics should be very familiar. Just sayin'.)</p>

<h2>6. Practical implications from this paper</h2>

<p>Finally, all that talk for what we can do in practice:</p>

<ol><li>As part of model maintenance, check on the distribution of ε<sub>i</sub>. When concept drift kicks in in the future, your model could become doubly misspecified - one count from training-testing data disparity and one count on the selection of <em>T</em>. Also notice that the distribution of ε<sub>i&nbsp;</sub>is a function of e.g. size of the dataset (both <em>n</em> and <em>p</em>). This should be intuitive.</li><li>Understand the behavior of your selected performance metric as a function of <em>T</em>. To give a naive example, optimizing ROC-AUC vs. optimizing log loss with respect to <em>T</em> should now be very different to you.</li><li>Finally, under normal or slightly perturbed conditions (again on <br>distribution of ε<sub>i)</sub> , a large <em>T</em> is still better.</li></ol>
