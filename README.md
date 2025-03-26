# Docker Mamba Installation Guide

## System Requirements
- **Operating System**: Linux
- **Hardware**: NVIDIA GPU
- **Software**:
  - PyTorch 1.12 or higher
  - CUDA 11.6 or higher

## Installation Steps

### 1. Create a Virtual Environment
Run the following command in the terminal to create a virtual environment named `mamba` and install Python 3.10:
```bash
conda create -n mamba python=3.10 -y
```
**Note**: If this is your first time creating a virtual environment on a server, you need to execute `source activate`, then close and reopen the terminal to enter your environment.

### 2. Activate the Virtual Environment
Activate the virtual environment you just created:
```bash
conda activate mamba
```

### 3. Install PyTorch
Install the appropriate version of PyTorch based on your CUDA version. For example, if your CUDA version is 11.8, you can install PyTorch 2.3.1:
```bash
conda install pytorch==2.3.1 torchvision==0.18.1 torchaudio==2.3.1 pytorch-cuda=11.8 -c pytorch -c nvidia
```
Make sure to choose the correct PyTorch version based on your CUDA version. You can check your CUDA version by running `nvcc -V`.

### 4. Install Dependencies
Since installing `causal-conv1d` and `mamba-ssm` via `pip install` may fail due to network issues, it’s recommended to install them offline.

#### Install `causal-conv1d`
1. Visit the [causal-conv1d GitHub Releases page](https://github.com/Dao-AILab/causal-conv1d/releases/).
2. Find the `causal_conv1d` installation package that matches your CUDA and PyTorch versions. For example, if your CUDA version is 11.8, PyTorch version is 2.3, and Python version is 3.10, you can choose `causal_conv1d-1.4.0+cu118torch2.3cxx11abiFALSE-cp310-cp310-linux_x86_64.whl`.
3. Download the corresponding package using `wget`:
   ```bash
   wget https://github.com/Dao-AILab/causal-conv1d/releases/download/v1.4.0/causal_conv1d-1.4.0+cu118torch2.3cxx11abiFALSE-cp310-cp310-linux_x86_64.whl
   ```
4. Install the downloaded file using `pip`:
   ```bash
   pip install causal_conv1d-1.4.0+cu118torch2.3cxx11abiFALSE-cp310-cp310-linux_x86_64.whl
   ```

#### Install `mamba-ssm`
1. Visit the [mamba-ssm GitHub Releases page](https://github.com/state-spaces/mamba/releases).
2. Find the `mamba_ssm` installation package that matches your CUDA and PyTorch versions. For example, if your CUDA version is 11.8, PyTorch version is 2.3, and Python version is 3.10, you can choose `mamba_ssm-2.2.3+cu11torch2.3cxx11abiFALSE-cp310-cp310-linux_x86_64.whl`.
3. Download the corresponding package using `wget`:
   ```bash
   wget https://github.com/state-spaces/mamba/releases/download/v2.2.3/mamba_ssm-2.2.3+cu11torch2.3cxx11abiFALSE-cp310-cp310-linux_x86_64.whl
   ```
4. Install the downloaded file using `pip`:
   ```bash
   pip install mamba_ssm-2.2.3+cu11torch2.3cxx11abiFALSE-cp310-cp310-linux_x86_64.whl
   ```

## Notes
- Ensure that the versions of `causal-conv1d` and `mamba-ssm` you install match your CUDA and PyTorch versions.
- If you encounter issues during installation, check your network connection and ensure you’ve selected the correct installation package version.