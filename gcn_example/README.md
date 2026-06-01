# GCN / GNN Examples — Graph Neural Networks

A set of **Graph Neural Network** examples covering the **three canonical graph tasks**
(node-, graph-, and edge-level) plus an attention-based variant. Most use **Zachary's
Karate Club** — a 34-person friendship network that split into two factions. Every example
ships in both **TensorFlow/Keras** and **PyTorch** and needs no graph library (edges are
hard-coded).

## Examples

| # | Task | Notebooks | Idea |
|---|------|-----------|------|
| 1 | **Node classification** | `gcn_karate_club.ipynb` / `..._pytorch.ipynb` | Label every member from just **2** known labels |
| 2 | **Graph classification** | `graph_classification.ipynb` / `..._pytorch.ipynb` | Label whole graphs (sparse vs dense) via readout pooling |
| 3 | **Link prediction** | `link_prediction.ipynb` / `..._pytorch.ipynb` | Recover hidden edges (Graph Auto-Encoder) |
| 4 | **Graph Attention (GAT)** | `gat_karate_club.ipynb` / `..._pytorch.ipynb` | Node classification with *learned* neighbour weights |

Suggested order: **1 → 2 → 3 → 4**. Example 1 introduces the GCN layer; 2–3 reuse it for
the other two task types; 4 swaps the layer itself.

## The three task levels

- **Node level** (ex. 1, 4): one prediction *per node*.
- **Graph level** (ex. 2): one prediction *per graph* — needs a **readout** that pools all
  node embeddings into one vector.
- **Edge level** (ex. 3): predict *whether a link exists* — encode nodes, then score pairs
  by embedding similarity.

## What you'll learn

- The GCN layer `H' = σ(Â H W)` and why we add self-loops + degree-normalize (ex. 1)
- How a loss on 2 labels trains the whole graph via message passing (ex. 1)
- **Readout / global pooling** for graph-level tasks (ex. 2)
- **Negative sampling** and the **AUC** metric for link prediction (ex. 3)
- **Attention** over neighbours — and how to *visualize* the learned weights (ex. 4)

## Run it

```bash
# TensorFlow
pip install "tensorflow==2.1" matplotlib
jupyter notebook gcn_karate_club.ipynb

# PyTorch
pip install torch matplotlib
jupyter notebook gcn_karate_club_pytorch.ipynb
```

All examples train in **seconds on CPU** with **no dataset download**.

## See also

- `../gan_example/` and `../autoencoder_example/` — generative models on images. (The link
  prediction example here is itself a *graph* auto-encoder.)
