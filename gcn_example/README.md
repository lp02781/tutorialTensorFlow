# GCN Example — Node Classification on the Karate Club Graph

A **Graph Convolutional Network** (Kipf & Welling, 2017), built from scratch, that
classifies members of **Zachary's Karate Club** — a 34-person friendship network that
split into two factions. The twist: we reveal the faction of only **2 nodes** (the two
leaders) and let the GCN propagate that information across the friendship edges to
classify everyone else. This is **semi-supervised node classification**.

## Notebooks

| File | Framework |
|------|-----------|
| `gcn_karate_club.ipynb` | TensorFlow / Keras (`tensorflow==2.1`) |
| `gcn_karate_club_pytorch.ipynb` | PyTorch (`torch`) |

Both implement the same model. No graph library (e.g. `networkx`) is required — the 78
edges are hard-coded.

## What you'll learn

- The GCN layer `H' = σ(Â H W)` and how multiplying by the adjacency matrix mixes each
  node with its neighbours (the "graph convolution")
- Why we add **self-loops** (`Â = D⁻½(A+I)D⁻½`) and **degree-normalize** the adjacency
- How a 2-layer GCN gives each node a **2-hop** receptive field — enough for 2 labels to
  reach the whole graph
- How the loss on just 2 nodes still trains the whole network via gradient flow through Â
- *Over-smoothing*: why deeper isn't always better on small graphs

## Run it

```bash
# TensorFlow
pip install "tensorflow==2.1" matplotlib
jupyter notebook gcn_karate_club.ipynb

# PyTorch
pip install torch matplotlib
jupyter notebook gcn_karate_club_pytorch.ipynb
```

Trains in **seconds on CPU** — no dataset download needed.

## Output

- Per-epoch training loss and full-graph accuracy (typically **30+/34 correct** from just
  2 labels)
- A PCA scatter plot of the learned node embeddings, coloured by predicted faction, with
  the two labelled leaders circled — you should see two clean clusters.

## See also

- `../gan_example/` — generating images with adversarial training.
- `../autoencoder_example/` — unsupervised representation learning on images.
