cd examples

for script in *.py
do
    python $script
    rval=$?
    if [ "$rval" != 0 ]; then
        echo "Error running example $script"
        exit $rval
    fi
done

cd spear_qcp
bash run.sh
rval=$?
if [ "$rval" != 0 ]; then
    echo "Error running example QCP"
    exit $rval
fi
cd ..

cd branin
python branin_fmin.py
rval=$?
if [ "$rval" != 0 ]; then
    echo "Error running example QCP"
    exit $rval
fi

python ../../scripts/smac --scenario scenario.txt
rval=$?
if [ "$rval" != 0 ]; then
    echo "Error running example QCP"
    exit $rval
fi
