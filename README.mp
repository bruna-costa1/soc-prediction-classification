# Battery State-of-Charge Prediction

## Overview

This project investigates machine-learning approaches for battery State-of-Charge (SOC) estimation under different operating conditions.

The current focus is on understanding how SOC estimation performance changes across battery chemistries, temperatures, and charging C-rates, with particular attention to model generalization under conditions not seen during training.

## Research Direction

The initial research question is:

> How well does an SOC estimator trained under a subset of operating conditions generalize to unseen C-rates or temperatures?

Future experiments may also investigate whether chemistry-specific models are necessary for NMC, NCA, and LiFePO₄ batteries, or whether a shared model can generalize across chemistries.

## Dataset

The project uses experimental battery charging data containing three battery chemistries:

* NMC
* NCA
* LiFePO₄

The dataset includes multiple operating conditions:

* Charging rates:

  * 0.5C
  * 1C
  * 1.5C
* Temperatures:

  * 5 °C
  * 25 °C
  * 45 °C
  * additional −5 °C experiments for NCA

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
│   │   ├── NMC/
│   │   ├── NCA/
│   │   └── LFP/
│   └── README.md
├── notebooks/
│   └── 01_data_understanding.ipynb
├── src/
│   └── soc_prediction/
│       └── __init__.py
├── README.md
├── requirements.txt
└── .gitignore
```

The repository separates:

* raw experimental data;
* exploratory analysis in notebooks;
* reusable processing and modeling code in `src/`;
* project and dataset documentation.

## Current Project Stage

* [x] Dataset collection
* [ ] Dataset understanding
* [ ] Data-quality validation
* [ ] Standardized preprocessing pipeline
* [ ] Baseline SOC regression model
* [ ] Cross-condition evaluation
* [ ] Cross-chemistry evaluation
* [ ] Sequence-based modeling

## Modeling Approach

The project will begin with deliberately simple baseline models before considering more complex sequence-based architectures.

Initial models will establish reference performance and help identify:

* whether voltage, current, and temperature contain sufficient information for SOC estimation;
* how strongly performance depends on operating condition;
* where distribution shifts occur across temperatures and C-rates.

More complex models will only be introduced after the dataset structure and baseline limitations are understood.

## Status

This repository is currently in the **data-understanding and validation stage**.

Results should therefore be considered preliminary while experimental metadata, SOC/SOE definitions, and cross-condition consistency are still being investigated.
