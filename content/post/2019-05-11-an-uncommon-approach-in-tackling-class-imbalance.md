---
title: "An uncommon approach in tackling class imbalance"
date: 2019-05-11
categories: ["Machine learning & Statistics"]
---

<center>
<img src="https://thestatsguyhome.files.wordpress.com/2019/05/f5126-1h01epkhncswjxdtyxzuq6g.jpeg" width="100%">
</center>

<!-- wp:paragraph {"align":"left"} -->
<p class="has-text-align-left">In supervised learning, one challenged faced by data scientists is classification class imbalance, where in a binary classification problem, instances in one class severely outnumbers instances in the other. This poses a problem as model performances may be misleading: a naive example would be to always predict negative in a 10% positive-90% negative dataset - accuracy would then be 90%, but the model would be utterly useless.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The typical approaches in alleviating class imbalance include using robust metrics such as the ROC-AUC, or performing downsampling of majority class or upsampling of minority class (e.g. <a href="https://en.wikipedia.org/wiki/Oversampling_and_undersampling_in_data_analysis#SMOTE">SMOTE</a>). Of course, downsampling of majority class is often frowned upon as precious datapoints are being discarded.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>In many situations, these approaches work reasonably well. However, in contexts in which there is an inherent asymmetry between false positives and false negatives, these approaches are less than ideal. For example,</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul><li>In cyber security, the inability to detect an intrusion into networks (false negative) incurs a different cost as compared to a false alarm (false positive).</li><li>In human resources, the inability to detect impending attrition of a high-potential employee (false negative) incurs a different cost as compared to incorrectly detecting said attrition (false positive).</li><li>In a clinical setting, the inability to detect post-surgical complications (false negative) incurs a different cost as compared to incorrectly detecting a complication (false positive). </li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>In most practical contexts, false positives and negatives incur different waste and costs. In addition, given that a prediction error is going to occur, there is often a <strong>preferred </strong>outcome or error. For instance, a healthcare practitioner would likely rather to not miss out on a post-surgical complication, than save on manpower and resources with poor prognosis.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Assuming that is the case, a simple but less commonplace approach to tackling class imbalance is to design a utility function <em>U(m)</em> that captures the inherent asymmetry of prediction outcomes, and use <em>U(m) </em>as the loss function in the ML training process for model <em>m</em>. Such utility functions are often used in econometrics to capture choices and preferences. Following illustrates an instructive but naive example of <em>U(m)</em>:</p>
<!-- /wp:paragraph -->

<!-- wp:table -->
<figure class="wp-block-table"><table><tbody><tr><td>
  <strong>Prediction Outcome</strong>
  </td><td>
  <strong>Utility Score</strong>
  </td></tr><tr><td>
  True positive
  </td><td>
  1
  </td></tr><tr><td>
  True negative
  </td><td>
  1
  </td></tr><tr><td>
  False positive
  </td><td>
  -5
  </td></tr><tr><td>
  False negative
  </td><td>
  -50
  </td></tr></tbody></table></figure>
<!-- /wp:table -->

<!-- wp:paragraph -->
<p><em>U(m)</em> would then be:</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">U(m) = TP(n<sub>1</sub>) + TN(n<sub>2</sub>) - 5FP(n<sub>3</sub>) - 50FN(n<sub>4</sub>)</pre>
<!-- /wp:preformatted -->

<!-- wp:paragraph -->
<p>where <em>n<sub>i </sub>&nbsp;</em>are the respective case counts of each prediction outcome. <em>U(m) </em>can then be used as the loss function in tuning individual ML models, heavily penalizing false negatives.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The utility scores of each prediction outcome is a function of the expert judgement of clinicians and practitioners, in evaluating relative costs and tradeoffs between each outcome. They are also largely context-driven and should ideally differ between surgical complications, diseases, or even hospitals and departments. Finally, loss functions are general to supervised learning algorithms, i.e. <em>U(m)</em> can be experimented with and built into various ML models.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Of course, the challenge then, in using utility functions in machine learning, is in the design of the function - how to best to capture the inherent asymmetry and tradeoffs, and evaluate and summarize relative costs. This has to be done together with domain experts as they are the ones who can providing the expert opinion and judgement, in articulating the tradeoffs in utility. While network intrusion and employee attrition can be quantified in dollar value, the loss of a human life is definitely not so straightforward.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p></p>
<!-- /wp:paragraph -->