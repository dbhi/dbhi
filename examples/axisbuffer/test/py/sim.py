from pathlib import Path
from vunit import VUnit
import csv, random


ROOT = Path(__file__).resolve().parent


def create_random_in_csv(
    path,     # Path of the file to be created
    N=20,     # Width of the matrix (length of each vector)
    M=13108,  # Height of the matrix (number of vectors)
    B=16      # Precision (number of bits)
):
    DATA = [[round(random.random()*(2**B)) for i in range(N)] for j in range(M)]

    if not path.exists():
        path.parent.mkdir(parents=True, exist_ok=True)
        with open(path, 'wt') as f:
            csv_writer = csv.writer(f)
            for row in DATA:
                csv_writer.writerow(row)


create_random_in_csv(ROOT.parent / 'data' / 'in.csv', M=250)

VU = VUnit.from_argv()

VU.add_array_util()
VU.add_verification_components()

LIB = VU.add_library("lib")
LIB.add_source_files([
    ROOT.parent.parent / "src" / "*.vhd",
    ROOT.parent / "*.vhd",
    ROOT / "*.vhd"
])

VU.main()
