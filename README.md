# Mamba 安装教程

## 环境要求
- **操作系统**：Linux
- **硬件**：NVIDIA GPU
- **软件**：
  - PyTorch 1.12 及以上版本
  - CUDA 11.6 及以上版本

## 安装步骤

### 1. 创建虚拟环境
在终端中运行以下命令创建名为 `mamba` 的虚拟环境，并安装 Python 3.10：
```bash
conda create -n mamba python=3.10 -y
```
**注意**：如果你是在服务器上第一次创建虚拟环境，需要先执行 `conda init`，然后关闭并重新打开终端页面，才能进入自己的环境。

### 2. 激活虚拟环境
激活刚才创建的虚拟环境：
```bash
conda activate mamba
```

### 3. 安装 PyTorch
根据你的 CUDA 版本安装对应的 PyTorch 版本。例如，如果你的 CUDA 版本是 11.8，可以安装 PyTorch 2.3.1：
```bash
conda install pytorch==2.3.1 torchvision==0.18.1 torchaudio==2.3.1 pytorch-cuda=11.8 -c pytorch -c nvidia
```
请根据你的实际 CUDA 版本选择合适的 PyTorch 版本。你可以通过运行 `nvcc -V` 来查看 CUDA 版本。

### 4. 安装依赖库
由于直接通过 `pip install` 安装 `causal-conv1d` 和 `mamba-ssm` 可能会因网络问题失败，建议通过以下方式离线安装。

#### 安装 `causal-conv1d`
1. 访问 [causal-conv1d 的 GitHub Releases 页面](https://github.com/Dao-AILab/causal-conv1d/releases/)。
2. 找到与你的 CUDA 和 PyTorch 版本匹配的 `causal_conv1d` 安装包。例如，如果你的 CUDA 版本是 11.8，PyTorch 版本是 2.3，Python 版本是 3.10，你应该选择 `causal_conv1d-1.4.0+cu118torch2.3cxx11abiFALSE-cp310-cp310-linux_x86_64.whl`。
3. 使用 `wget` 下载对应的安装包：
   ```bash
   wget https://github.com/Dao-AILab/causal-conv1d/releases/download/v1.4.0/causal_conv1d-1.4.0+cu118torch2.3cxx11abiFALSE-cp310-cp310-linux_x86_64.whl
   ```
4. 使用 `pip` 安装下载好的文件：
   ```bash
   pip install causal_conv1d-1.4.0+cu118torch2.3cxx11abiFALSE-cp310-cp310-linux_x86_64.whl
   ```

#### 安装 `mamba-ssm`
1. 访问 [mamba-ssm 的 GitHub Releases 页面](https://github.com/state-spaces/mamba/releases)。
2. 找到与你的 CUDA 和 PyTorch 版本匹配的 `mamba_ssm` 安装包。例如，如果你的 CUDA 版本是 11.8，PyTorch 版本是 2.3，Python 版本是 3.10，你应该选择 `mamba_ssm-2.2.3+cu11torch2.3cxx11abiFALSE-cp310-cp310-linux_x86_64.whl`。
3. 使用 `wget` 下载对应的安装包：
   ```bash
   wget https://github.com/state-spaces/mamba/releases/download/v2.2.3/mamba_ssm-2.2.3+cu11torch2.3cxx11abiFALSE-cp310-cp310-linux_x86_64.whl
   ```
4. 使用 `pip` 安装下载好的文件：
   ```bash
   pip install mamba_ssm-2.2.3+cu11torch2.3cxx11abiFALSE-cp310-cp310-linux_x86_64.whl
   ```

## 注意事项
- 确保安装的 `causal-conv1d` 和 `mamba-ssm` 的版本与你的 CUDA 和 PyTorch 版本相匹配。
- 如果在安装过程中遇到问题，请检查你的网络连接，并确保你选择了正确的安装包版本。