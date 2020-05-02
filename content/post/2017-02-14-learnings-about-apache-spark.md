---
title: Learnings about Apache Spark
author: ~
date: '2017-02-14'
slug: learnings-about-apache-spark
categories: ["ML & Stats"]
tags: []
---

##  One simple way to optimise Spark jobs on YARN

When submitting Spark jobs to YARN on the CLI, we would use a submission script that typically looks like the following:
```
spark-submit \
--master yarn-cluster \
--driver-memory 20G \
--driver-cores 10 \
--executor-cores 10 \
--executor-memory 20G \
--num-executors 10 \
--total-executor-cores 100\
script_to_submit.py
```

These are options that allows the user to specify the amount of resources to allocate to the submitted job. Not every option is always available - it depends on the type of cluster manager. There are currently three types available to Spark: standalone, Mesos, and YARN.

Simply put, the standalone cluster manager comes with the Spark distribution, while Mesos and YARN are clusters managers designed to be compatible to Spark, with YARN coming together with Hadoop distributions.

In brief, the available options for each cluster manager are:

* Standalone - driver-cores, executor-cores, total-executor-cores
* Mesos - total-executor-cores
* YARN - driver-cores, executor-cores, num-executors

The rest, namely driver-memory and executor-memory are available to all three.

I haven't had any experience with the standalone manager as well as Mesos, so I will just talk about YARN. On the YARN web UI, under "Cluster Metrics", there are two entries that read "Memory Total" and "VCores Total".

To optimise the amount of resources allocated to your job:

* "Memory Total" should be roughly and less than num-executors x executormemory
* "VCores Total" should be roughly and less than num-executors x executor-cores

Seems intuitive but I didn't fully put this optimisation in my conscious mind until one of our engineers explicitly enlighten me of this.

## Other learnings on Spark

This is PySpark.

1. Writing text files to HDFS using sc.saveAsTextFile() - use high driver memory. RDD has to fit in the driver memory when writing.

2. Use rdd.coalesce(n) to save to n text files. On the YARN UI, each file will be represented as a task.

3. If the saveAsTextFile() stage keeps stopping at the last task, check the data. There is most probably something wrong with the data in the program.

4. There is a difference between using 50GB RAM times 10 executors versus 20GB times 30 executors. The memory used reflected on the YARN UI differs greatly - for my case, the former gives 550GB while the latter, 220GB. I'm guessing it's best to match the number of executors to the number of datanodes in the cluster.

5. Whenever a task or a stage cannot succeed, check the data within the program - columns, counts, datatypes.

6. A conventional way to debug code or scripts is always to print statements or data onto the console or terminal. Note that this debugging technique cannot work for some spark Spark apps, because of Spark's lazy evaluation. Methods in Spark can be classified as either actions or transformations. Unlike actions, transformation methods are parsed and interpreted by Spark, without any actual work done on the data structures; only when actions are called will work be done. Therefore interjecting your code with print statements doesn't help too much.

7. UDFs can run without checking for errors in the data within the program. Suspect that UDFs are transformations and not actions.

8. In YARN, container RAM is the RAM of 1 datanode. When setting the RAM for each container, leave about 5GB for overheads and OS functions.

9. df.printSchema() can work even without reading any data into the program - even lazier than transformations if I'm not wrong.

10. Actions / transformations of one RDD cannot be performed inside the actions / transformations of another RDD, as all actions and transformations of the former RDD will require the spawning of new workers and jobs, within the current workers and jobs on the latter RDD, which is not supported.

11. The UDF function turns a regular Python function to a function that is applied on all elements of the input column. This function cannot any Spark functions, as calling any Spark functions may require the needs to spawn new workers and jobs. (10) is a generalisation of this.

## Book: Getting Started with Apache Spark: From Inception to Production

This book, published by MapR, serves as an introduction to Apache Spark. It's a free book I got from the Strata Hadoop 2016 conference in Singapore. A relatively short and lightweight intro to Spark, this is a good read for anyone who wants to learn a little more about Spark. Topics include installation, architecture overview, Hadoop and Spark, data streaming, and machine learning using MLlib.

Pdf version available here: http://www.bigdatatoronto.com/2016/assets/getting_started_with_apache_spark.pdf