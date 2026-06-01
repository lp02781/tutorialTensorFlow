# GAN Examples — Generative Adversarial Networks

A progression of **GAN** examples, from a basic image GAN to conditioning, visualization,
and an alternative loss. Each example ships in both **TensorFlow/Keras** and **PyTorch**.

## Examples

| # | Topic | Notebooks | Idea |
|---|-------|-----------|------|
| 1 | **DCGAN** | `gan_mnist.ipynb` / `gan_mnist_pytorch.ipynb` | Generate MNIST digits with a convolutional GAN |
| 2 | **Conditional GAN** | `conditional_gan.ipynb` / `conditional_gan_pytorch.ipynb` | Choose *which* digit to generate by feeding the label |
| 3 | **2D Toy GAN** | `toy_2d_gan.ipynb` / `toy_2d_gan_pytorch.ipynb` | Learn a 2D point distribution — *see* training & mode collapse |
| 4 | **LSGAN** | `lsgan_mnist.ipynb` / `lsgan_mnist_pytorch.ipynb` | Same DCGAN, least-squares loss for smoother training |

Suggested order: **1 → 3 → 2 → 4**. Example 3 (2D) is the best place to build intuition
because you can watch the whole distribution; example 4 is a one-line loss swap on
example 1.

## What you'll learn

- The generator/discriminator adversarial game and the minimax objective (ex. 1)
- Why GAN losses **oscillate** — judge progress by samples, not loss (all)
- **Mode collapse**, made visible on a 2D distribution (ex. 3)
- **Conditioning** both networks on a label to control the output (ex. 2)
- How the **loss function** affects stability: cross-entropy vs least-squares (ex. 4)
- Transposed convolutions, batch-norm, LeakyReLU, dropout, the `detach()`/`zero_grad()`
  pattern in PyTorch

## Run it

```bash
# TensorFlow
pip install "tensorflow==2.1" matplotlib
jupyter notebook gan_mnist.ipynb

# PyTorch
pip install torch torchvision matplotlib
jupyter notebook gan_mnist_pytorch.ipynb
```

The MNIST examples download data automatically. The **2D toy GAN trains in seconds** and
needs no download — start there if you just want to see a GAN work.

## See also

- `../autoencoder_example/` — another family of generative models (incl. the VAE, which
  also samples a latent code to make images, but trains far more stably).
- `../gcn_example/` — graph neural networks (one of which, the GAE, is also generative —
  it reconstructs edges).
