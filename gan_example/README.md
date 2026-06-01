# GAN Example — Generating Handwritten Digits (MNIST)

A **DCGAN** (Deep Convolutional GAN) that learns to generate new MNIST-style digits from
random noise. Two networks play an adversarial game: a **generator** turns noise into
fake images while a **discriminator** tries to tell fakes from real digits. As they
co-evolve, the generator's output becomes indistinguishable from real handwriting.

## Notebooks

| File | Framework |
|------|-----------|
| `gan_mnist.ipynb` | TensorFlow / Keras (`tensorflow==2.1`) |
| `gan_mnist_pytorch.ipynb` | PyTorch (`torch` + `torchvision`) |

Both implement the same architecture and training procedure — pick whichever framework
you prefer. The PyTorch notebook includes a TensorFlow→PyTorch translation table.

## What you'll learn

- The generator / discriminator adversarial setup and the minimax objective
- Why losses **oscillate** instead of steadily falling (judge progress by the samples!)
- Transposed convolutions for upsampling, batch-norm, and LeakyReLU
- The non-saturating generator loss and training stability tricks
- Common failure modes: mode collapse and discriminator dominance

## Run it

```bash
# TensorFlow
pip install "tensorflow==2.1" matplotlib
jupyter notebook gan_mnist.ipynb

# PyTorch
pip install torch torchvision matplotlib
jupyter notebook gan_mnist_pytorch.ipynb
```

MNIST downloads automatically on first run. Training `EPOCHS = 30` produces recognisable
digits; this is the heaviest example here — a GPU helps but CPU works.

## Output

Every few epochs the notebook renders a fixed 4×4 grid of generated digits so you can
watch them sharpen from noise into handwriting.

## See also

- `../autoencoder_example/` — another way to map a low-dimensional code to an image,
  much faster to train (and a good contrast: explicit target vs. adversarial signal).
- `../gcn_example/` — a graph neural network on the Karate Club dataset.
