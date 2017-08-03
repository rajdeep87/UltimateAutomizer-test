PWD=`pwd`
TIMEOUT=3600
TOOL=ultimate
BENCHMARKDIRS=`cat benchmarks.txt`
PROGRESSLOG=${PWD}/progress.log-${TOOL}
echo "Starting experiments at `date` on `hostname`" > ${PROGRESSLOG}
for DIR in $BENCHMARKDIRS
do
  echo ${DIR}
  filename=main.c
  rm -rf ${filename}
  cd ${DIR}
  cp ${filename} ../
  echo "Starting to processing $DIR/$filename at `date`" >> ${PROGRESSLOG}
  cd ..
  ./run.sh >> ${PROGRESSLOG}
  echo "done at `date`" >> ${PROGRESSLOG}
done
