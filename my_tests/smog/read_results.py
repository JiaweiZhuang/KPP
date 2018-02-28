import pandas as pd

def read_varnames(codefile):
    with open (codefile, "r") as f:
        code_str = f.readlines()
        
    varnames = []

    pattern = 'INTEGER, PARAMETER :: ind_'
    for line in code_str:
        if pattern in line:
            varnames.append( line.replace(pattern,'').split()[0] )

    return varnames

def read_dat(datfile, varnames):
    df = pd.read_csv(datfile, delim_whitespace=True, header=None, index_col=0)
    df.columns = varnames
    df.index.name = 'time'
    df = df.apply(pd.to_numeric, errors='raise')
    
    return df