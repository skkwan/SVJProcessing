name=svj

echo -e "\n=== Create Python 3.11 environment with name ${name} ==="
conda create --name ${name} python=3.11

echo -e "\n=== Activate ${name} ==="
conda activate ${name}

# For I/O and array manipulations
echo -e "\n=== Installing xrootd ==="
conda install -c conda-forge xrootd
echo -e "\n=== Installing coffea ==="
conda install -c conda-forge coffea"=0.7.22"
# For easier calculations with vectors
echo -e "\n=== Installing vector ==="
conda install -c conda-forge vector

# For plotting
echo -e "\n=== Installing matplotlib ==="
conda install -c conda-forge matplotlib
echo -e "\n=== Installing seaborn ==="
conda install -c anaconda seaborn
echo -e "\n=== Installing plotly ==="
conda install -c plotly plotly

# For job submission
echo -e "\n=== Installing dask-jobqueue ==="
conda install dask-jobqueue -c conda-forge

# For the ML framework
echo -e "\n=== Installing scikit-learn ==="
conda install -c anaconda "scikit-learn>=0.24"
#echo -e "\n=== Installing tensorflow ==="
#echo "Check tensorflow version! Tenserflow 2 needed!"
# commented out because was getting issues, done with pip below
#conda install -c conda-forge tensorflow
echo -e "\n=== Installing keras ==="
conda install -c conda-forge keras
echo -e "\n=== Installing PyTorch ==="
conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia
conda install -c conda-forge torchmetrics
conda install -c conda-forge torchview
echo -e "\n=== Installing SHAP ==="
conda install -c conda-forge shap
echo -e "\n=== Installing comet ==="
conda install -c anaconda -c conda-forge -c comet_ml comet_ml

echo -e "\n=== Installing POT ==="
#conda install -c conda-forge "pot==0.7.0"
conda install -c conda-forge pot

# Auxiliary package for plotting with keras
echo -e "\n=== Installing pydot ==="
conda install pydot

# To make gif
echo -e "\n=== Installing imageio ==="
conda install -c conda-forge imageio

echo -e "\n=== Installing braceexpand ==="
conda install -c conda-forge braceexpand

# Install ssh-access library paramiko
echo -e "\n=== Installing paramiko ==="
conda install paramiko

echo -e "\n=== Installing bayesian-optimization ==="
conda install -c conda-forge bayesian-optimization

echo -e "\n=== Installing optuna ==="
conda install -c conda-forge optuna
conda install -c conda-forge python-kaleido

echo -e "\n=== Installing ROOT ==="
conda install -c conda-forge root


echo -e "\n=== Installing tensorflow ==="
echo "Check tensorflow version! Tenserflow 2 needed!"
pip install tensorflow

echo -e "\n=== Installing energyflow ==="
pip install energyflow

# Install DataFrame Image package
pip install dataframe_image

pip install pytest

pip install torchviz

echo -e "\n=== Installing tensorflow ==="
echo "Check tensorflow version! Tenserflow 2 needed!"
pip install tensorflow

echo -e "\n=== Installing energyflow ==="
pip install energyflow

# Install DataFrame Image package
pip install dataframe_image

pip install pytest

pip install torchviz

pip install pyshaper

# Installing modified version of the MDMM
export OLD_PWD=$PWD
pip install mdmm && cd $(python -m site | grep "site-packages'," | cut -d"'" -f2)/mdmm && git clone git@github.com:fleble/mdmm.git && cp mdmm/mdmm/mdmm.py . && rm -rf mdmm
cd $OLD_PWD