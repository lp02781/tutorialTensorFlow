# Autoencoder Example — Compressing & Reconstructing Digits (MNIST)

A simple **autoencoder** that learns to copy MNIST digits to its output through a narrow
**bottleneck**. An **encoder** squeezes each 784-pixel image down to a 32-number latent
code; a **decoder** rebuilds the image from that code. Because everything must pass
through the bottleneck, the network is forced to learn the *structure* of digits rather
than memorise pixels. Training is **unsupervised** — the target is the input itself.

## Notebooks

| File | Framework |
|------|-----------|
| `autoencoder_mnist.ipynb` | TensorFlow / Keras (`tensorflow==2.1`) |
| `autoencoder_mnist_pytorch.ipynb` | PyTorch (`torch` + `torchvision`) |

## What you'll learn

- The encoder → bottleneck → decoder structure and the reconstruction loss `‖x − g(f(x))‖²`
- Why this is *self-supervised* (input and target are the same array)
- How the latent dimension controls the compression / quality trade-off
- How an autoencoder contrasts with a GAN: an explicit target and a smooth, easy-to-train
  loss vs. an adversarial signal with sharper but harder-to-control output

## Run it

```bash
# TensorFlow
pip install "tensorflow==2.1" matplotlib
jupyter notebook autoencoder_mnist.ipynb

# PyTorch
pip install torch torchvision matplotlib
jupyter notebook autoencoder_mnist_pytorch.ipynb
```

MNIST downloads automatically. Trains in **seconds on CPU** (`EPOCHS = 20`).

## Output

- A smoothly decreasing reconstruction-loss curve
- An original-vs-reconstruction comparison on held-out test digits
- A bonus grid of digits decoded from **random latent codes** (messier than a GAN — a
  motivation for the variational autoencoder mentioned in "Things to try")

## See also

- `../gan_example/` — a different generative model; sharper samples, harder training.
- `../gcn_example/` — representation learning on graph-structured data.
