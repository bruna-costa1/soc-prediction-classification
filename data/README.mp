# Dataset Documentation

## Source

The dataset used in this project is publicly available through Mendeley Data:

https://data.mendeley.com/datasets/29kw38kzwj

The original dataset is preserved in the `raw/` directory without manual modification.

## Battery Chemistries

The dataset contains experiments for three lithium-ion battery chemistries:

* LiFePO₄ (LFP)

Raw files are organized by chemistry:

data/
└── raw/
    ├── LFP/

## Experimental Conditions

### Charging C-rates

Experiments are available at:

* 0.5C
* 1C
* 1.5C

Within the Excel workbooks, different C-rate experiments are stored in separate sheets.

### Temperature

The main temperature conditions are:

* 5 °C
* 25 °C
* 45 °C

## Measurements

The charging experiments contain measurements such as:

* time
* current
* voltage
* accumulated capacity (mAh)
* accumulated energy (mWh)
* State of Charge (SOC)
* State of Energy (SOE)

Column names in the original spreadsheets encode experimental metadata.

For example:

```text
SOC_5D_0.5C_LFP
SOE_5D_0.5C_LFP
```

These names contain information about:

* temperature;
* C-rate;
* battery chemistry.

Part of the preprocessing pipeline will convert this information into explicit metadata columns rather than relying on information embedded in column names or filenames.

## Charging Direction

The files currently being analyzed correspond to **charging experiments**.

In these experiments, the reported SOC progresses from approximately:

```text
0% → 100%
```

as the battery is charged.

## Current Data Organization

Each chemistry has its own folder.

Within each chemistry, files are separated by temperature, while individual Excel sheets represent different charging C-rates.

Conceptually:

```text
chemistry
    ↓
temperature workbook
    ↓
0.5C / 1C / 1.5C sheet
```

The exact raw structure is intentionally preserved before preprocessing.

## Known Questions and Data-Quality Considerations

The following items are currently being investigated.

### SOC and SOE Calculation

The dataset contains SOC and SOE values, but the exact procedure used to calculate these variables has not yet been confirmed.

Before using them as machine-learning targets, the project will investigate:

* whether SOC was calculated directly from accumulated capacity;
* whether SOE was calculated directly from accumulated energy;
* what reference capacity and energy values were used;
* whether these calculations differ across temperatures or chemistries.

This is important for identifying possible target leakage during model development.

### Unequal Temperature Coverage

The −5 °C condition exists for NCA but is not available for NMC or LiFePO₄.

This is not treated as an error in the dataset.

Instead, it creates an asymmetric experimental condition that must be considered when comparing chemistries or constructing train/test splits.

## Data Handling Principles

The raw dataset will not be manually overwritten.

Any transformations will be performed programmatically and documented through the preprocessing pipeline.

The project will distinguish between:

* confirmed data errors;
* formatting inconsistencies;
* experimental differences;
* unresolved metadata questions.

Uncertain values or conditions will be documented before any corrective transformation is applied.
