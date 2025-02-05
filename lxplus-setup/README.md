# README

These are approximately the steps used to set up a virtual environment in lxplus. They are modified slightly from [these instructions](https://github.com/jniedzie/SVJanalysis_wiki/wiki/Creating-SVJ-virtual-environment) and only take the most important packages.

First I changed my conda install directories. In `~/.condarc` I pointed to areas with more space than my `/user/` area:
```
envs_dirs:
  - /eos/user/s/skkwan/conda-files/conda_envs
pkgs_dirs:
  - /eos/user/s/skkwan/conda-files/conda_pkgs
```

It seemed that `makeSVJEnv.sh` has a lot of stuff we don't need. I started from scratch:
```bash
conda create -n "svj" python=3.11
```

Then to activate the venv:
```bash
conda activate svj
```

Manually installing the minimal libraries needed:
```bash
pip install awkward
# need an earlier version of coffea because of this https://github.com/scikit-hep/coffea/discussions/705
pip install coffea"==0.7.22"
# continually run pip install for all remaining directories, Ctrl+Z and restart if it hangs
# needed another directory with more space than /user
pip install xrootd --cache-dir=/tmp/skkwan/devel-nano-skim/pip_cache
# needed an early enough version of setuptools, otherwise I got this error: https://github.com/scikit-hep/uproot5/issues/1259
pip install setuptools"<71"
```


## Start of each session

```bash
source setup.sh
```

## Status
Currently I am running a commented-out version of:

```bash
bash prepare_input_files_list_t_channel.sh
# only running list_dataset_files.py 
```
And this produces:

```
(/eos/user/s/skkwan/conda-files/conda_envs/svj) [skkwan@lxplus932 prepare_input_files_lists]$ bash ./prepare_input_files_list_t_channel.sh 

Preparing input files for dataset TTJets year 2018 and selection t_channel_pre_selection
datasets:  ['TTJets']
[INFO] Processing batch 1/1...
100%|██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████| 294/294 [01:29<00:00,  3.30it/s]
[INFO] /tmp/skkwan/devel-nano-skim/store/datasets/files_list/2018/TTJets.csv was written.
```

The contents of this `.csv` are a bunch of `AnalysisTree.root` files.
```
(/eos/user/s/skkwan/conda-files/conda_envs/svj) [skkwan@lxplus932 prepare_input_files_lists]$ cat /tmp/skkwan/devel-nano-skim/store/datasets/files_list/2018/TTJets.csv
file_name,number_of_events
root://cmseos.fnal.gov//store/user/lpcsusyhad/SusyRA2Analysis2015/Run2ProductionV20/Summer20UL18/TTJets_TuneCP5_13TeV-madgraphMLM-pythia8/0_RA2AnalysisTree.root,47258
root://cmseos.fnal.gov//store/user/lpcsusyhad/SusyRA2Analysis2015/Run2ProductionV20/Summer20UL18/TTJets_TuneCP5_13TeV-madgraphMLM-pythia8/1_RA2AnalysisTree.root,4286
root://cmseos.fnal.gov//store/user/lpcsusyhad/SusyRA2Analysis2015/Run2ProductionV20/Summer20UL18/TTJets_TuneCP5_13TeV-madgraphMLM-pythia8/2_RA2AnalysisTree.root,33778
root://cmseos.fnal.gov//store/user/lpcsusyhad/SusyRA2Analysis2015/Run2ProductionV20/Summer20UL18/TTJets_TuneCP5_13TeV-madgraphMLM-pythia8/3_RA2AnalysisTree.root,57636
```