

def standardize_columns(df):
    """
    Standardizes the column names of the given DataFrame based on the COLUMN_MAPPING.

    Parameters:
        df (pd.DataFrame): The input DataFrame with original column names.

    Returns:
        pd.DataFrame: A new DataFrame with standardized column names.
    """
    
    df= df.copy ()

    # Rename columns based on the mapping
    df = df.rename(columns={    
    "Time": "time_s",

    "Current": "current_ma",
    "Cur(mA)": "current_ma",

    "Voltage": "voltage_v",
    "Voltage(V)": "voltage_v",

    "Capacity(mAh)": "capacity_mah",
    "Capacity": "capacity_mah",
    "CapaCity(mAh)": "capacity_mah",

    "Energy (mWh)": "energy_mwh",
    "Energy": "energy_mwh",
    "Energy(mWh)": "energy_mwh"})

    #Find and rename soc and soe columns based on their prefixes
    for column in df.columns:
        if column.startswith("SOC_"):
            df = df.rename(columns={column: "soc"})

        if column.startswith("SOE_"):
            df = df.rename(columns={column: "soe"})

    # Drop any remaining unnamed columns
    if "Unnamed: 6" in df.columns and "soe" not in df.columns:
        df = df.rename(columns={"Unnamed: 6": "soe"})

    # Drop any remaining unnamed columns
    df = df.loc[:, ~df.columns.str.startswith("Unnamed")]

    #Check if the required columns are present in the DataFrame
    if "current_ma" not in df.columns:
        raise ValueError(
            f"Current column not found. Columns are: {df.columns.tolist()}"
        )

    if "capacity_mah" not in df.columns:
        print("Capacity column not found")
        print(df.columns.tolist())

    if "energy_mwh" not in df.columns:
        print("Energy column not found")
        print(df.columns.tolist())

    # Convert units to standard units
    df["current_a"] = df["current_ma"] / 1000
    df["capacity_ah"] = df["capacity_mah"] / 1000
    df["energy_wh"] = df["energy_mwh"] / 1000

    df.drop(columns=["current_ma", "capacity_mah", "energy_mwh"], inplace=True)

    return df


def add_metadata(df, chemistry, temperature_c, c_rate):
    """
    Adds metadata columns to the DataFrame.

    Parameters:
        df (pd.DataFrame): The input DataFrame.
        chemistry (str): The battery chemistry (e.g., 'NMC', 'LFP').
        temperature_c (float): The temperature in Celsius.
        c_rate (float): The C-rate of the charging/discharging process.

    Returns:
        pd.DataFrame: A new DataFrame with added metadata columns.
    """
    df = df.copy()
    df["chemistry"] = chemistry
    df["temperature_c"] = temperature_c
    df["c_rate"] = c_rate

    return df


def preprocess_data(df, chemistry, temperature_c, c_rate):
    df = standardize_columns(df)

    df = add_metadata(
        df,
        chemistry=chemistry,
        temperature_c=temperature_c,
        c_rate=c_rate
    )

    return df