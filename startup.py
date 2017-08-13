# This file is loaded when the ipython kernel starts.
# Ipython extensions are loaded before PYTHONSTARTUP script
# So this script needs to append to the conf object if one exists or create a new one.
print("In Spark PYTHONSTARTUP script," + __name__)

if __name__ == "__main__":
    global conf
    spark_imported = True
    try:
        from pyspark import SparkConf
    except ImportError:
        spark_imported = False
        print("PYTHONSTARTUP: Error, cannot import SparkConf")
        
    if(spark_imported):
        if 'conf' in globals() and isinstance(globals()['conf'],SparkConf):
            pass
        else:
            conf=SparkConf()

        conf.set("spark.FROMPYTHONSTARTUP","HELLO WORLD")
        print("PYTHONSTARTUP: SparkConf Configured")
