ROOT=$(cd "$(dirname $0)/.."; pwd)

# put your mxnet jar file in the $ROOT/lib folder
MXNET_JAR_FILE=$ROOT/lib/mxnet-full_2.11-INTERNAL.jar

CLASS_PATH=$MXNET_JAR_FILE:$ROOT/target/scala-2.11/classes/:\
$HOME/.ivy2/cache/org.scala-lang/scala-library/jars/scala-library-2.11.8.jar:\
$HOME/.ivy2/cache/args4j/args4j/bundles/args4j-2.33.jar:\
$HOME/.ivy2/cache/org.slf4j/slf4j-api/jars/slf4j-api-1.6.2.jar:\
$HOME/.ivy2/cache/org.slf4j/slf4j-simple/jars/slf4j-simple-1.6.2.jar


# path to the mnist dataset
TRAIN_DATA_PATH=$ROOT/datas/mnist

LEARNING_RATE=0.001

BATCH_SIZE=100

# which gpu card to use, -1 means cpu
GPU=0

# whether use centerloss during training, 1 means use, 0 means not
WITH_CENTER_LOSS=0

java -Xmx1G -cp $CLASS_PATH \
	centerloss.Train \
	--data-path $TRAIN_DATA_PATH \
	--lr $LEARNING_RATE \
	--gpu $GPU \
	--batch-size $BATCH_SIZE \
	--with-center-loss $WITH_CENTER_LOSS
