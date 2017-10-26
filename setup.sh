
#for copying input file
#cp sample.txt  ~/input

#for compiling java program

export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")

sudo javac -cp :commons-cli-1.4.jar:/usr/local/hduser/share/hadoop/common/hadoop-common-2.7.3.jar:/usr/local/hduser/share/hadoop/common/lib/hadoop-annotations-2.7.3.jar:/usr/local/hduser/share/hadoop/mapreduce/hadoop-mapreduce-client-core-2.7.3.jar *.java

#for creating jar file

jar -cvf Example.jar *

#for executing hadoop 
#make sure to remove ~/grep_example rm -R ~/grep_example/
/usr/local/hduser/bin/hadoop jar Example.jar Twitter aa.csv ~/twitter
/usr/local/hduser/bin/hadoop jar Example.jar Twitter bb.csv ~/twitter1
/usr/local/hduser/bin/hadoop jar Example.jar Boston cc.csv ~/twitter2


echo "\n\n\n---------------------------------------------------------------TWEETS------------------------------------------------------------------------------------"
echo "Events\t\tGeo\t#Tweets\tHashtag"
awk '{print $1"\t"$2"\t"$3"\t#"$1}' ~/twitter/part-r-00000 | sort -n -k2 -r | head -n5
awk '{print $1"\t"$2"\t"$3"\t#"$1}' ~/twitter1/part-r-00000 | sort -n -k2 -r | head -n5
awk '{print $1"BOMBBLAST\t"$1"\t"$2"\t#"$1}' ~/twitter2/part-r-00000 | sort -n -k2 -r | head -n5

