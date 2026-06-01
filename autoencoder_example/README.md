# Autoencoder Examples — Compression, Denoising & Generation

A progression of **autoencoder** examples on MNIST, from a basic dense autoencoder to a
fully generative **variational autoencoder**. Each ships in both **TensorFlow/Keras** and
**PyTorch**. All train in seconds-to-a-minute on CPU.

## Examples

| # | Topic | Notebooks | Idea |
|---|-------|-----------|------|
| 1 | **Basic (dense)** | `autoencoder_mnist.ipynb` / `..._pytorch.ipynb` | Compress to a 32-d code and reconstruct |
| 2 | **Denoising** | `denoising_autoencoder.ipynb` / `..._pytorch.ipynb` | Feed a noisy image, recover the clean one |
| 3 | **Convolutional** | `convolutional_autoencoder.ipynb` / `..._pytorch.ipynb` | Keep 2D structure → sharper reconstructions |
| 4 | **Variational (VAE)** | `variational_autoencoder.ipynb` / `..._pytorch.ipynb` | A *generative* model with a sampleable latent space |

Suggested order: **1 → 2 → 3 → 4**. Each builds on the last; the VAE is the payoff — a
proper generative model you can sample from.

## What you'll learn

- The **encoder → bottleneck → decoder** structure and reconstruction loss (ex. 1)
- That the target *is* the input — autoencoders are **self-supervised** (ex. 1)
- Training on `(corrupted, clean)` pairs for **denoising** / robustness (ex. 2)
- Using **convolutions** to respect image structure (ex. 3)
- The **reparameterization trick** + **KL regularization** that make a latent space you
  can sample from, plus latent-space and manifold visualizations (ex. 4)

## Run it

```bash
# TensorFlow
pip install "tensorflow==2.1" matplotlib
jupyter notebook autoencoder_mnist.ipynb

# PyTorch
pip install torch torchvision matplotlib
jupyter notebook autoencoder_mnist_pytorch.ipynb
```

MNIST downloads automatically on first run. (The VAE's latent-grid cell uses `scipy` if
present but falls back to a plain grid otherwise.)

## See also

- `../gan_example/` — GANs are the other major generative-model family. Compare the GAN's
  sharp-but-unstable samples with the VAE's smooth-but-blurry ones.
- `../gcn_example/` — the link-prediction example there is a *graph* auto-encoder.
