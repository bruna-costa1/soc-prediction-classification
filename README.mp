# Battery State-of-Charge Prediction

## Overview

This project investigates machine-learning approaches for battery State-of-Charge (SOC) estimation under different operating conditions.

The current focus is on understanding how SOC estimation performance changes across battery chemistries, temperatures, and charging C-rates, with particular attention to model generalization under conditions not seen during training.

## Research Direction

The initial research question is:

> How well does an SOC estimator trained under a subset of operating conditions generalize to unseen C-rates or temperatures?

Future experiments may also investigate whether chemistry-specific models are necessary for NMC, NCA, and LiFePO₄ batteries, or whether a shared model can generalize across chemistries.

## Dataset

The project uses experimental battery charging data containing LiFePO₄ battery chemistry.


The dataset includes multiple operating conditions:

* Charging rates:

  * 0.5C
  * 1C
  * 1.5C
* Temperatures:

  * 5 °C
  * 25 °C
  * 45 °C

Measurements include variables such as:

* time
* current
* voltage
* accumulated capacity
* accumulated energy
* State of Charge (SOC)
* State of Energy (SOE)

The dataset source and known data-quality questions are documented in [`data/README.md`](data/README.md).

## Project Structure

```text
.
├── data/
│   ├── raw/
│   │   └── LFP/
│   └── README.md
├── notebooks/
│   └── 01_data_understanding.ipynb
│   └── 02_data_cleaning.ipynb
│   └── 03_data_classification.ipynb
├── src/
│   └── soc_prediction/
│       └── data.py
├── README.md
```

The repository separates:

* raw experimental data;
* exploratory analysis in notebooks;
* reusable processing and modeling code in `src/`;
* project and dataset documentation.


## Modeling Approach

The project will begin with deliberately simple baseline models before considering more complex sequence-based architectures.

More complex models will only be introduced after the dataset structure and baseline limitations are understood.
