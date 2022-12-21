&& pip install cvxpy \
&& pip install cvxopt \
&& conda config --add channels conda-forge \
&& conda config --set channel_priority strict \
&& conda install gcg papilo scip soplex zimpl \
&& pip install pyscipopt \