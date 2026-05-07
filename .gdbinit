add-auto-load-safe-path /software/valgrind/libexec/valgrind/valgrind-monitor.py
source /software/valgrind/libexec/valgrind/valgrind-monitor.py
set debuginfod enabled off

set confirm off
set breakpoint pending on
set pagination off

python
print("loading eigen prettyprinters...")
import sys
sys.path.insert(0, '/software/eigen/debug/gdb')
from printers import register_eigen_printers
register_eigen_printers (None)
end

python
print("loading stdc++ prettyprinters...")
import sys
sys.path.insert(0, '/usr/share/gcc/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end

source ~/gdb_imshow.py

# force GDB to use active venv
python
import os
import subprocess
import sys
paths = subprocess.check_output('python -c "import os; import sys;print(os.linesep.join(sys.path).strip())"',shell=True).decode("utf-8").split()
# Extend GDB's Python's search path
sys.path.extend(paths)
end
