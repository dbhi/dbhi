from pathlib import Path
from subprocess import check_call
from shutil import which

ROOT = Path(__file__).parent

CASE = 'axisbuffer'

# Create build dirs

BUILD_DIR = ROOT / 'build'
for path in ['bin', 'obj']:
    (BUILD_DIR / path).mkdir(parents=True, exist_ok=True)

# Build application

APP_DIR = ROOT / 'app'

check_call(['gcc', '-fPIC', '-rdynamic', APP_DIR / 'main.c', '-o', BUILD_DIR / 'bin' / (CASE + '_main')])

# Compile and run VUnit simulation

PY_DIR = ROOT / 'test' / 'py'

PY = which('python')
if PY is None:
    PY = which('python3')

check_call([PY, 'sim.py', '--compile', '-v'], cwd=PY_DIR)
check_call([PY, 'sim.py', '-v'], cwd=PY_DIR)

# Build C co-simulation sources

C_DIR = ROOT / 'test' / 'c'

check_call(['gcc', '-fPIC', '-c', C_DIR / 'wrapper.c', '-o', BUILD_DIR / 'obj', 'wrapper.o'])

# Analyse VHDL sources

GHDL_ARGS = [
    '-fPIC',
    '--ieee=synopsys',
    '-frelaxed',
    '-P../../test/py/vunit_out/ghdl/libraries/vunit_lib',
    '-P../../test/py/vunit_out/ghdl/libraries/osvvm'
]

#check_call(['ghdl', '-a'] + GHDL_ARGS + [C_DIR / 'pkg_c.vhd'])
